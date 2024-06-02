import 'dart:io';

import 'package:dokan_multivendor/components/common_shadow.dart';
import 'package:dokan_multivendor/controllers/auth_controller.dart';
import 'package:dokan_multivendor/global_widgets/custom_button.dart';
import 'package:dokan_multivendor/global_widgets/custom_field.dart';
import 'package:dokan_multivendor/utils/assets_maneger.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: commonShadow,
                          color: AppColors.white,
                          image: controller.selectedImagePath.isNotEmpty
                              ? DecorationImage(
                                  image: FileImage(
                                    File(controller.selectedImagePath.value),
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: controller.selectedImagePath.value.isEmpty
                            ? Center(
                                child: SvgPicture.asset(
                                  SvgManager.person,
                                ),
                              )
                            : const SizedBox(),
                      ),
                      InkWell(
                        onTap: () => controller.selectProfilePicture(),
                        child: Container(
                          height: 34,
                          width: 34,
                          decoration: const BoxDecoration(
                            gradient: AppColors.gradient,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(SvgManager.camera),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: controller.registerKey,
                  child: Column(
                    children: [
                      CustomField(
                        leading: SvgManager.personField,
                        hintText: 'Username',
                        onChanged: (value) => controller.userModel.value.username = value,
                      ),
                      CustomField(
                        leading: SvgManager.email,
                        hintText: 'Email',
                        onChanged: (value) => controller.userModel.value.email = value,
                      ),
                      CustomField(
                        leading: SvgManager.lock,
                        hintText: 'Password',
                        isSecured: true,
                        onChanged: (value) => controller.userModel.value.password = value,
                      ),
                      CustomField(
                        leading: SvgManager.lock,
                        hintText: 'Confirm Password',
                        isSecured: true,
                        onChanged: (value) => controller.userModel.value.cPassword = value,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  label: 'Sign Up',
                  onTap: () => controller.register(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      label: SvgManager.fbLogo,
                      buttonType: ButtonType.social,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                      label: SvgManager.googleLogo,
                      buttonType: ButtonType.social,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: AppColors.black.withOpacity(.5),
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF2893E3),
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
