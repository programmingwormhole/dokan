// ignore_for_file: deprecated_member_use

import 'package:dokan_multivendor/components/common_shadow.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum FieldType {
  regular,
  border,
}

class CustomField extends StatelessWidget {
  final String? leading;
  final String? trailing;
  final String? labelText;
  final String hintText;
  final void Function()? onTrailingTap;
  final void Function(String)? onChanged;
  final bool? isSecured;
  final FieldType? fieldType;
  final bool? isRequired;

  const CustomField({
    super.key,
    this.leading,
    this.trailing,
    required this.hintText,
    this.onTrailingTap,
    this.isSecured,
    this.onChanged,
    this.fieldType,
    this.labelText,
    this.isRequired,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldType == FieldType.border)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelText!,
                style: TextStyle(
                  color: AppColors.black.withOpacity(.5),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: onChanged,
                obscureText: isSecured ?? false,
                validator: isRequired == true
                    ? (String? value) {
                        if (value!.isEmpty) {
                          return "validation_error".tr;
                        }
                        return null;
                      }
                    : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: AppColors.black.withOpacity(.3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.black.withOpacity(.1),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.black.withOpacity(.1),
                      width: 1.5,
                    ),
                  ),
                ),
              )
            ],
          )
        else
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: commonShadow,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              TextFormField(
                onChanged: onChanged,
                obscureText: isSecured ?? false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'validation_error'.tr;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: AppColors.black.withOpacity(.3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                  ),
                  prefixIcon: leading == null
                      ? null
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(leading!),
                        ),
                  suffixIcon: trailing != null
                      ? IconButton(
                          onPressed: onTrailingTap,
                          icon: SvgPicture.asset(
                            trailing!,
                            color: AppColors.black.withOpacity(.3),
                          ),
                        )
                      : null,
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
