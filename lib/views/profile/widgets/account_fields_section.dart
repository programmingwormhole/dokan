import 'package:dokan_multivendor/controllers/navbar_controller.dart';
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
        const CustomField(
          fieldType: FieldType.border,
          labelText: 'Email',
          hintText: 'mail@domain.com',
        ),
        Form(
          key: controller.accountKey,
          child: Column(
            children: [
              CustomField(
                fieldType: FieldType.border,
                labelText: 'First Name',
                hintText: 'Enter your first name',
                isRequired: true,
                onChanged: (value) => controller.fName.value = value,
              ),
              CustomField(
                fieldType: FieldType.border,
                labelText: 'Last Name',
                hintText: 'Enter your last name',
                isRequired: true,
                onChanged: (value) => controller.lName.value = value,
              ),
            ],
          ),
        ),
        const CustomField(
          fieldType: FieldType.border,
          labelText: 'Street Address',
          hintText: '465 Nolan Causeway Suite 079',
        ),
        const CustomField(
          fieldType: FieldType.border,
          labelText: 'Apt, Suite, Bldg (optional)',
          hintText: 'Unit 512',
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .3,
          child: const CustomField(
            fieldType: FieldType.border,
            labelText: 'Zip Code',
            hintText: '77017',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButton(
                buttonType: ButtonType.border,
                label: 'Cancel',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                backgroundColor: AppColors.secondary,
                label: 'Save',
                onTap: () => controller.updateProfile(),
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
