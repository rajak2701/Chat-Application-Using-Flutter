import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:our_chat/apis/apis.dart';
import 'package:our_chat/main.dart';
import 'package:our_chat/screens/auth/login_screen.dart';
import 'package:our_chat/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //exit full-screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      if (Apis.auth.currentUser != null) {
        log('User : ${Apis.auth.currentUser}');
        log('UserAdditionalInfo : ${Apis.auth.currentUser}');
        //navigate to Homescreen
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        //navigate to loginscreen
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // initializing media query (for gettong device screen size)
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        //app logo
        Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset('images/chat.png')),
        // googlr login button
        Positioned(
            top: mq.height * .65,
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .07,
            child: const Text(
              "MADE IN INDIA WITH ❤️",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, letterSpacing: 1, color: Colors.black),
            )),
      ]),
    );
  }
}
