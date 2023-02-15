// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twr/screens/aboutus.dart';
import 'package:twr/screens/survey_home.dart';
import 'package:twr/screens/home.dart';
// import 'package:twr/firebase_options.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      _setup().then(
        (_) => _navigateHome(),
      );
    });
    // _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  Future<void> _setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        // options: DefaultFirebaseOptions.currentPlatform,
        );
    Home();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash2.jpeg'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.linearToSrgbGamma()),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/thewaitingroom.png',
                    scale: 1.2,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 40.0, top: 20),
                  //   child: Image.asset(
                  //     'assets/images/casual-life-3d-boy-and-girl-sitting-in-chairs.png',
                  //     scale: 0.9,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
