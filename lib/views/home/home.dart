import 'package:dokan_multivendor/controllers/home_controller.dart';
import 'package:dokan_multivendor/global_widgets/custom_app_bar.dart';
import 'package:dokan_multivendor/global_widgets/custom_product_card.dart';
import 'package:dokan_multivendor/views/home/widgets/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: CustomAppBar(
        title: 'product_list'.tr,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const FilterSection(),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: controller.products[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
