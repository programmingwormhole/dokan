import 'dart:convert';

import 'package:dokan_multivendor/models/product_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  // On initialize controller first calling the loadProducts function to load data from local assets
  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  // All products will be store in this variable
  var products = <ProductModel>[].obs;

  // Function to load product from local assets
  loadProducts() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/products.json');
      final data = json.decode(response) as List;
      print(data.length);
      products.value = data.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  // Default selected filter is Newest
  var selectedFilter = 'Newest'.obs;

  // Function to temporary update the selected filter
  void tempUpdate(String filter) {
    selectedFilter.value = filter;
  }
  // Function to update the selected filter
  void updateFilter() {
  }

}
