import 'package:dokan_multivendor/controllers/navbar_controller.dart';
import 'package:dokan_multivendor/global_widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widgets/custom_floating_button.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(NavbarController());

    return Obx(
      () => Scaffold(
        body: controller.screens[controller.currentIndex.value],
        floatingActionButton: const CustomFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: controller.currentIndex.value == 0,
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }
}
