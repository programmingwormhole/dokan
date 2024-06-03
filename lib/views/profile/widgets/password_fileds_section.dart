import 'package:dokan_multivendor/controllers/profile_controller.dart';
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
          child: const Column(
            children: [
              CustomField(
                fieldType: FieldType.border,
                labelText: 'Old Password',
                hintText: 'Enter your old password',
                isSecured: true,
                isRequired: true,
              ),
              CustomField(
                fieldType: FieldType.border,
                labelText: 'New Password',
                hintText: '********',
                isSecured: true,
                isRequired: true,
              ),
              CustomField(
                fieldType: FieldType.border,
                labelText: 'Confirm New Password',
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
                label: 'Cancel',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 20),
            const Expanded(
              child: CustomButton(
                backgroundColor: AppColors.secondary,
                label: 'Save',
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
