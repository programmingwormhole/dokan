import 'package:dokan_multivendor/controllers/splash_controller.dart';
import 'package:dokan_multivendor/utils/assets_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(SplashController());

    return Scaffold(
      body: Center(
        child: ImageManager.logo.image(),
      ),
    );
  }
}
