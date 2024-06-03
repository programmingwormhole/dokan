import 'package:dokan_multivendor/global_widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../utils/colors.dart';

class PasswordFieldsSection extends StatelessWidget {
  const PasswordFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {

    final key = GlobalKey<FormState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: key,
          child: Column(
            children: [
              CustomField(
                fieldType: FieldType.border,
                labelText: 'old_password'.tr,
                hintText: '********',
                isSecured: true,
                isRequired: true,
              ),
              CustomField(
                fieldType: FieldType.border,
                labelText: 'new_password'.tr,
                hintText: '********',
                isSecured: true,
                isRequired: true,
              ),
              CustomField(
                fieldType: FieldType.border,
                labelText: 'confirm_new_password'.tr,
                hintText: '********',
                isSecured: true,
                isRequired: true,
              ),
            ],
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
              child: CustomButton(
                backgroundColor: AppColors.secondary,
                label: 'save'.tr,
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
