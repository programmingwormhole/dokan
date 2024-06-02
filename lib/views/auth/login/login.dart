import 'package:dokan_multivendor/controllers/auth_controller.dart';
import 'package:dokan_multivendor/global_widgets/custom_button.dart';
import 'package:dokan_multivendor/global_widgets/custom_field.dart';
import 'package:dokan_multivendor/routes/route_names.dart';
import 'package:dokan_multivendor/utils/assets_maneger.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageManager.logo.image(),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              Form(
                key: controller.loginKey,
                child: Column(
                  children: [
                    CustomField(
                      leading: SvgManager.email,
                      hintText: 'Email',
                      onChanged: (value) =>
                          controller.userModel.value.email = value,
                    ),
                    Obx(
                      () => CustomField(
                        leading: SvgManager.lock,
                        hintText: 'Password',
                        isSecured: controller.isSecured.value,
                        trailing: controller.isSecured.value
                            ? SvgManager.eyeOn
                            : SvgManager.eyeOff,
                        onTrailingTap: () {
                          controller.isSecured.value =
                              !controller.isSecured.value;
                        },
                        onChanged: (value) =>
                            controller.userModel.value.password = value,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CustomButton(
                label: 'Login',
                onTap: () => Get.toNamed(
                  RouteNames.home,
                ),
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
              TextButton(
                onPressed: () => Get.toNamed(
                  RouteNames.register,
                ),
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    color: AppColors.black.withOpacity(.5),
                    fontWeight: FontWeight.w300,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
