import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Network/NetworkHandler/network_binding.dart';
import 'UI/View/Splash Screen Module/View/splashscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: NetworkBinding(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const SplashScreen(),
    );
  }
}
