import 'package:dokan_multivendor/views/home/home.dart';
import 'package:dokan_multivendor/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  RxInt currentIndex = RxInt(0);

  changeView (int index) {
    currentIndex.value = index;
    update();
  }

  List<Widget> screens = [
    const HomeScreen(),
    const Center(
      child: Text('Category'),
    ),

    const Center(
      child: Text('Cart'),
    ),

    const ProfileScreen(),
  ];
}