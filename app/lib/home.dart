import 'package:flutter/material.dart';
import 'package:susya/services/notifications.dart';
import 'package:susya/authentication/sign_in_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:susya/pages/user_page.dart';
import 'package:susya/authentication/sign_in_button.dart';
import 'package:susya/services/notifications.dart';
import 'package:flutter/material.dart';
import 'package:susya/home.dart';
import 'package:susya/onboard/onboard.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationHandler(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(flex: 4),
                      Image.asset(
                        "assets/logo.jpg",
                        height: 125,
                      ),
                      Text("Plant Being",
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                      Spacer(flex: 4),
                      // LoginButton(
                      //   title: "Login",
                      //   onTap: () => Get.to(() => CameraPage()),
                      // ),
                      SignInButton(),
                      Spacer(flex: 6)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
