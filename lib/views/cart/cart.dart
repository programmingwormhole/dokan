import 'package:dokan_multivendor/global_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'cart'.tr),
      body: Center(
        child: Text('cart'.tr),
      ),
    );
  }
}
