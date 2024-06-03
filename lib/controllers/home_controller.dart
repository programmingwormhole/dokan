import 'dart:convert';

import 'package:dokan_multivendor/models/product_model.dart';
import 'package:flutter/material.dart';
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
      products.value = data.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error loading products: $e');
    }
  }

  // Default selected filter is Newest
  var selectedFilter = FilterOption.newest.obs;

  // Function to temporary update the selected filter
  void tempUpdate(FilterOption filter) {
    selectedFilter.value = filter;
  }

  // Function to update the selected filter
  void updateFilter() {
    // Apply filters based on the selected option
    switch (selectedFilter.value) {
      case FilterOption.newest:
        products.value = List.from(products)
          ..sort(
            (a, b) => b.createdDate!.compareTo(a.createdDate!),
          );
        break;
      case FilterOption.older:
        products.value = List.from(products)
          ..sort(
            (a, b) => a.createdDate!.compareTo(b.createdDate!),
          );
        break;
      case FilterOption.priceLowToHigh:
        products.value = List.from(products)
          ..sort(
            (a, b) => int.parse(a.price ?? '0').compareTo(
              int.parse(b.price ?? '0'),
            ),
          );
        break;
      case FilterOption.priceHighToLow:
        products.value = List.from(products)
          ..sort(
            (a, b) => int.parse(b.price ?? '0').compareTo(
              int.parse(a.price ?? '0'),
            ),
          );
        break;
      case FilterOption.bestSelling:
        products.value = List.from(products)
          ..sort(
            (a, b) => b.rating!.compareTo(
              a.rating!,
            ),
          );
        break;
    }

    update();
  }
}

enum FilterOption {
  newest,
  older,
  priceLowToHigh,
  priceHighToLow,
  bestSelling,
}
