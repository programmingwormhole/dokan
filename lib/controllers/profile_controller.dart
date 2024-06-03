import 'package:dokan_multivendor/core/services/api_services.dart';
import 'package:dokan_multivendor/core/services/shared_services.dart';
import 'package:dokan_multivendor/global_widgets/custom_snackbar.dart';
import 'package:dokan_multivendor/helpers/show_response_error.dart';
import 'package:dokan_multivendor/models/user_model.dart';
import 'package:dokan_multivendor/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // On initialize the controller call the function to get user data
  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  RxBool isLoading = RxBool(false);

  // User data model
  var userModel = UserModel().obs;

  // Global Key for form state
  var accountKey = GlobalKey<FormState>();

  // Get user inputs
  RxString fName = RxString('');
  RxString lName = RxString('');

  // Function to retrieve user data from local storage and set them to model
  Future<void> getUserData() async {
    final name = await SharedServices.getData(SetType.string, 'name');
    final email = await SharedServices.getData(SetType.string, 'email');
    final userID = await SharedServices.getData(SetType.string, 'user_id');
    const profilePicture =
        'https://file.xunruicms.com/admin_html/assets/pages/media/profile/profile_user.jpg';

    userModel.value = UserModel(
      id: userID,
      fName: name,
      email: email,
      profilePicture: profilePicture,
    );

    update();
  }

  // Function to update user profile data (First Name & Last Name only)
  Future<void> updateProfile() async {
    if (accountKey.currentState!.validate()) {

      // Set model data according to user entered value
      userModel.value.fName = fName.value;
      userModel.value.lName = lName.value;

      isLoading.value = true;

      // HIT the profile update API
      final response = await ApiServices.updateProfile(userModel.value);

      isLoading.value = false;

      // Check if any error show that error
      if (response.statusCode != 200) {
        return showResponseError(response);
      }

      // Update the local storage user data
      SharedServices.setData(SetType.string, 'name', '${fName.value} ${lName.value}');

      // Show a success message and navigate to home
      snackBar('profile_update_success'.tr);
      Get.offAllNamed(RouteNames.home);
    }
  }
}
