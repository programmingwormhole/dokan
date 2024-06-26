import 'package:dokan_multivendor/controllers/home_controller.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_button.dart';

void filterBottomSheet(BuildContext context) {
  final controller = Get.put(HomeController());

  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'filter'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
              Obx(() {
                return Column(
                  children: [
                    buildFilterOption(
                      FilterOption.newest,
                      controller,
                    ),
                    buildFilterOption(
                      FilterOption.older,
                      controller,
                    ),
                    buildFilterOption(
                      FilterOption.priceLowToHigh,
                      controller,
                    ),
                    buildFilterOption(
                      FilterOption.priceHighToLow,
                      controller,
                    ),
                    buildFilterOption(
                      FilterOption.bestSelling,
                      controller,
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      buttonType: ButtonType.border,
                      label: 'cancel'.tr,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomButton(
                      backgroundColor: AppColors.secondary,
                      label: 'apply'.tr,
                      onTap: () {
                        {
                          controller.updateFilter();
                          Get.back();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildFilterOption(FilterOption filter, HomeController controller) {
  return CheckboxListTile(
    value: controller.selectedFilter.value == filter,
    checkboxShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    activeColor: AppColors.primary,
    side: const BorderSide(
      color: AppColors.primary,
      width: 2,
    ),
    onChanged: (value) {
      if (value == true) {
        controller.tempUpdate(filter);
      }
    },
    title: Text(getFilterTitle(filter)),
    controlAffinity: ListTileControlAffinity.leading,
    contentPadding: EdgeInsets.zero,
  );
}

String getFilterTitle(FilterOption filter) {
  String? title;

  switch (filter) {
    case FilterOption.newest:
      title = 'newest'.tr;
      break;
    case FilterOption.older:
      title = 'older'.tr;
      break;
    case FilterOption.priceLowToHigh:
      title = 'pp_l_h'.tr;
      break;
    case FilterOption.priceHighToLow:
      title = 'pp_h_l'.tr;
      break;
    case FilterOption.bestSelling:
      title = 'best_selling'.tr;
      break;
  }

  return title;
}
