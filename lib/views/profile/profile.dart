import 'package:dokan_multivendor/components/common_shadow.dart';
import 'package:dokan_multivendor/controllers/auth_controller.dart';
import 'package:dokan_multivendor/global_widgets/custom_app_bar.dart';
import 'package:dokan_multivendor/global_widgets/custom_profile_tile.dart';
import 'package:dokan_multivendor/utils/assets_maneger.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:dokan_multivendor/views/profile/widgets/account_fields_section.dart';
import 'package:dokan_multivendor/views/profile/widgets/password_fileds_section.dart';
import 'package:dokan_multivendor/views/profile/widgets/profile_details_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());
    return Scaffold(
      appBar: CustomAppBar(
        title: 'my_account'.tr,
        hideAction: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfileDetailsSection(),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: commonShadow,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomProfileTile(
                        title: 'account'.tr,
                        icon: SvgManager.personField,
                        content: const AccountFieldsSection(),
                      ),
                      CustomProfileTile(
                        title: 'password'.tr,
                        icon: SvgManager.lock,
                        content: const PasswordFieldsSection(),
                      ),
                      CustomProfileTile(
                        title: 'notification'.tr,
                        icon: SvgManager.notification,
                      ),
                      CustomProfileTile(
                        title: 'wishlist'.tr,
                        icon: SvgManager.heart,
                      ),
                      ListTile(
                        onTap: () => auth.logout(),
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        title: Text(
                          'logout'.tr,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
