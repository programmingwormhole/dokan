import 'package:dokan_multivendor/utils/assets_maneger.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: const BoxDecoration(
        gradient: AppColors.gradient,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          SvgManager.search,
          color: AppColors.white,
        ),
      ),
    );
  }
}
