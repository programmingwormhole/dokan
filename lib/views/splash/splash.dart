import 'dart:async';

import 'package:dokan_multivendor/routes/route_names.dart';
import 'package:dokan_multivendor/utils/assets_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // Wait 3 second and navigate to another screen
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(RouteNames.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ImageManager.logo.image(),
      ),
    );
  }
}
