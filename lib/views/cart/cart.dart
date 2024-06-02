import 'package:dokan_multivendor/global_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      body: Center(
        child: Text('Cart Screen'),
      ),
    );
  }
}
