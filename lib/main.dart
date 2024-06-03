import 'package:dokan_multivendor/routes/route_destinations.dart';
import 'package:dokan_multivendor/routes/route_names.dart';
import 'package:dokan_multivendor/utils/languages.dart';
import 'package:dokan_multivendor/utils/thems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // Themes
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.light,

      // Languages
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),

      // Routes
      getPages: routeDestination,
      initialRoute: RouteNames.splash,
    );
  }
}
