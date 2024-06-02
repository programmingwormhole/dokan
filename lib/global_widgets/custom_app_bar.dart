import 'package:dokan_multivendor/utils/assets_maneger.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? hideAction;

  const CustomAppBar({super.key, required this.title, this.hideAction});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.scaffoldBackground,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.appBarText,
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
      actions: hideAction == true ? null : [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(SvgManager.search),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
