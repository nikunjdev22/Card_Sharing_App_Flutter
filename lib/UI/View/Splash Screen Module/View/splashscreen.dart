import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Utils/string_constants.dart';
import '../../Home Screen Module/View/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 3;

  @override
  void initState() {
    setCustomMessageByDefault();
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
         body: Center(
          child: Text("Celebration Card"),
      ),
    ));
  }

  setCustomMessageByDefault() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(KEY_USER_MESSAGE, quotes.toString());
  }
}
