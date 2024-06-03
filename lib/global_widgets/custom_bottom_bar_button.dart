// ignore_for_file: deprecated_member_use

import 'package:dokan_multivendor/controllers/navbar_controller.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomBottomBarButton extends StatelessWidget {
  final int index;
  final String icon;

  const CustomBottomBarButton({
    super.key,
    required this.index,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavbarController());

    return Obx(
      () => IconButton(
        onPressed: () => controller.changeView(index),
        icon: SvgPicture.asset(
          icon,
          color: controller.currentIndex.value == index
              ? AppColors.primary
              : const Color(0xFF6E7FAA),
        ),
      ),
    );
  }
}
