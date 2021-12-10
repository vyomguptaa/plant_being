import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:susya/pdf/pdf_gen.dart';
import 'package:susya/services/http.dart';
import 'package:susya/widgets/login_button.dart';

class ResultPage extends StatefulWidget {
  final String disease, plant, remedy;

  const ResultPage(
      {Key? key,
      required this.disease,
      required this.plant,
      required this.remedy})
      : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Your Crop Analysis Report"),
          backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 1,
            ),
            Container(
              height: 400,
              width: 370,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text("Plant Name: " + widget.plant,
                      style: TextStyle(fontSize: 18)),
                  Spacer(
                    flex: 1,
                  ),
                  widget.disease == "healthy"
                      ? Text("Your Plant is Healthy!!",
                          style: TextStyle(fontSize: 18))
                      : Text("Disease detected: " + widget.disease,
                          style: TextStyle(fontSize: 18)),
                  Spacer(flex: 1),
                  widget.disease == "healthy"
                      ? Container()
                      : Text("Possible remedy: ",
                          style: TextStyle(fontSize: 18)),
                  SizedBox(height: 2),
                  widget.disease == "healthy"
                      ? Container()
                      : Text(widget.remedy,
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic)),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 10,
            ),
            LoginButton(
                title: "Make Report",
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  bool result = await makeReport(
                    plant: widget.plant,
                    disease: widget.disease,
                    remedy: widget.remedy,
                  );
                  setState(() {
                    isLoading = false;
                  });
                  print(result);


                }),
            isLoading
                ? Expanded(
                    flex: 1, child: Center(child: CircularProgressIndicator()))
                : Spacer(
                    flex: 1,
                  )
          ],
        ),
      ),
    );
  }
}
