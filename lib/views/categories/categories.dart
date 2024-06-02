import 'package:dokan_multivendor/global_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Categories'),
      body: Center(
        child: Text('Categories Screen'),
      ),
    );
  }
}
