import 'package:dokan_multivendor/routes/route_names.dart';
import 'package:dokan_multivendor/views/auth/login/login.dart';
import 'package:dokan_multivendor/views/auth/register/register.dart';
import 'package:dokan_multivendor/views/home/home.dart';
import 'package:dokan_multivendor/views/splash/splash.dart';
import 'package:get/get.dart';

List<GetPage> routeDestination = [
  GetPage(
    name: RouteNames.splash,
    page: () => const SplashScreen(),
  ),

  GetPage(
    name: RouteNames.login,
    page: () => const LoginScreen(),
  ),

  GetPage(
    name: RouteNames.register,
    page: () => const RegisterScreen(),
  ),

  GetPage(
    name: RouteNames.home,
    page: () => const HomeScreen(),
  ),

];
