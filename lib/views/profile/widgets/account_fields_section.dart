import 'package:dokan_multivendor/controllers/profile_controller.dart';
import 'package:dokan_multivendor/global_widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/custom_button.dart';
import '../../../utils/colors.dart';

class AccountFieldsSection extends StatelessWidget {
  const AccountFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomField(
          fieldType: FieldType.border,
          labelText: 'email'.tr,
          hintText: 'mail@domain.com',
        ),
        Form(
          key: controller.accountKey,
          child: Column(
            children: [
              CustomField(
                fieldType: FieldType.border,
                labelText: 'first_name'.tr,
                hintText: 'enter_first_name'.tr,
                isRequired: true,
                onChanged: (value) => controller.fName.value = value,
              ),
              CustomField(
                fieldType: FieldType.border,
                labelText: 'last_name'.tr,
                hintText: 'enter_first_name'.tr,
                isRequired: true,
                onChanged: (value) => controller.lName.value = value,
              ),
            ],
          ),
        ),
        CustomField(
          fieldType: FieldType.border,
          labelText: 'street_address'.tr,
          hintText: '465 Nolan Causeway Suite 079',
        ),
        CustomField(
          fieldType: FieldType.border,
          labelText: 'apt_suite'.tr,
          hintText: 'Unit 512',
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .3,
          child: CustomField(
            fieldType: FieldType.border,
            labelText: 'zip_code'.tr,
            hintText: '77017',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButton(
                buttonType: ButtonType.border,
                label: 'cancel'.tr,
                onTap: () {},
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Obx(
                () => CustomButton(
                  backgroundColor: AppColors.secondary,
                  label: 'save'.tr,
                  isLoading: controller.isLoading.value,
                  onTap: () => controller.updateProfile(),
                  showLoadingText: false,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
