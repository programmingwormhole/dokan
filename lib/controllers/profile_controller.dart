import 'package:dokan_multivendor/core/services/shared_services.dart';
import 'package:dokan_multivendor/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  // On initialize the controller call the function to get user data
  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

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
    const profilePicture =
        'https://file.xunruicms.com/admin_html/assets/pages/media/profile/profile_user.jpg';

    userModel.value = UserModel(
      fName: name,
      email: email,
      profilePicture: profilePicture,
    );

    update();
  }


  // Function to update user profile data (First Name & Last Name only)
  Future<void> updateProfile () async {
    if (accountKey.currentState!.validate()) {

    }
  }

}
