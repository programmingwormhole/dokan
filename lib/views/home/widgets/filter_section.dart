import 'package:dokan_multivendor/components/common_shadow.dart';
import 'package:dokan_multivendor/global_widgets/custom_bottom_sheet.dart';
import 'package:dokan_multivendor/utils/assets_maneger.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => filterBottomSheet(context),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: commonShadow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(SvgManager.filter),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'filter'.tr,
                      style: TextStyle(
                        color: AppColors.black.withOpacity(.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'short_by'.tr,
                      style: TextStyle(
                        color: AppColors.black.withOpacity(.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.black.withOpacity(.5),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(SvgManager.list),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
