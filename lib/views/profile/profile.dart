import 'package:dokan_multivendor/components/common_shadow.dart';
import 'package:dokan_multivendor/controllers/auth_controller.dart';
import 'package:dokan_multivendor/controllers/profile_controller.dart';
import 'package:dokan_multivendor/global_widgets/custom_app_bar.dart';
import 'package:dokan_multivendor/global_widgets/custom_button.dart';
import 'package:dokan_multivendor/global_widgets/custom_field.dart';
import 'package:dokan_multivendor/global_widgets/custom_profile_tile.dart';
import 'package:dokan_multivendor/utils/assets_maneger.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:dokan_multivendor/views/profile/widgets/account_fields_section.dart';
import 'package:dokan_multivendor/views/profile/widgets/profile_details_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My Account',
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
                        title: 'Account',
                        icon: SvgManager.personField,
                        content: const AccountFieldsSection(),
                      ),
                      CustomProfileTile(
                        title: 'Passwords',
                        icon: SvgManager.lock,
                      ),
                      CustomProfileTile(
                        title: 'Notification',
                        icon: SvgManager.notification,
                      ),
                      CustomProfileTile(
                        title: 'Wishlist',
                        icon: SvgManager.heart,
                      ),
                      ListTile(
                        onTap: () => auth.logout(),
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
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
