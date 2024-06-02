import 'package:dokan_multivendor/controllers/home_controller.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_button.dart';

void customBottomSheet(BuildContext context) {
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
              const Text(
                'Filter',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
              Obx(() {
                return Column(
                  children: [
                    buildFilterOption('Newest', controller),
                    buildFilterOption('Oldest', controller),
                    buildFilterOption('Price low > High', controller),
                    buildFilterOption('Price high > Low', controller),
                    buildFilterOption('Best selling', controller),
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
                      label: 'Cancel',
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomButton(
                      backgroundColor: AppColors.secondary,
                      label: 'Apply',
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

Widget buildFilterOption(String filter, HomeController controller) {
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
    title: Text(filter),
    controlAffinity: ListTileControlAffinity.leading,
    contentPadding: EdgeInsets.zero,
  );
}
