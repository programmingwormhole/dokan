import 'package:dokan_multivendor/global_widgets/custom_bottom_bar_button.dart';
import 'package:dokan_multivendor/utils/assets_maneger.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.1),
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BottomAppBar(
        color: AppColors.white,
        elevation: 0,
        notchMargin: 6.0,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomBottomBarButton(index: 0, icon: SvgManager.home),
              CustomBottomBarButton(index: 1, icon: SvgManager.categories),
              const SizedBox(
                width: 10,
              ),
              CustomBottomBarButton(index: 2, icon: SvgManager.cart),
              CustomBottomBarButton(index: 3, icon: SvgManager.personField),
            ],
          ),
        ),
      ),
    );
  }
}
