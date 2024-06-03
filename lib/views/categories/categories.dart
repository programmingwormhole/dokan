import 'package:dokan_multivendor/global_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'categories'.tr),
      body: Center(
        child: Text('categories'.tr),
      ),
    );
  }
}
