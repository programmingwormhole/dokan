import 'package:dokan_multivendor/core/services/shared_services.dart';
import 'package:dokan_multivendor/models/user_model.dart';
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

  // Function to retrieve user data from local storage and set them to model
  Future<void> getUserData() async {
    final name = await SharedServices.getData(SetType.string, 'name');
    final email = await SharedServices.getData(SetType.string, 'email');
    const profilePicture =
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg';

    userModel.value = UserModel(
      name: name,
      email: email,
      profilePicture: profilePicture,
    );

    update();
  }
}
