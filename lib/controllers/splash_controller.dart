import 'dart:async';
import 'package:dokan_multivendor/routes/route_names.dart';
import 'package:get/get.dart';
import '../core/services/shared_services.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    // Wait 3 second and navigate to another screen according to user state
    Timer(const Duration(seconds: 3), () {
      checkRoute();
    });
  }

  // Get stored token from local storage if have
  Future<String?> getToken() async =>
      await SharedServices.getData(SetType.string, 'token');

  // Check token and navigate
  Future checkRoute() async {
    final token = await getToken();

    // Check if token is null that means user not logged in, so navigate to login otherwise to home
    if (token == null) {
      Get.offAllNamed(RouteNames.login);
    } else {
      Get.offAllNamed(RouteNames.home);
    }
  }
}
