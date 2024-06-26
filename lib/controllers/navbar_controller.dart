import 'package:dokan_multivendor/views/cart/cart.dart';
import 'package:dokan_multivendor/views/categories/categories.dart';
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
    const CategoriesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
}