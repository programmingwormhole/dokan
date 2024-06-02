import 'package:dokan_multivendor/global_widgets/custom_app_bar.dart';
import 'package:dokan_multivendor/views/home/widgets/filter_section.dart';
import 'package:flutter/material.dart';

import '../../global_widgets/custom_ProductModel_card.dart';
import '../../models/ProductModel_model.dart';
import '../../models/product_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> ProductModels = [
      ProductModel(
        imageUrl: 'https://images.meesho.com/images/ProductModels/90849199/d32te_512.webp',
        name: 'Girls Stylish Dresses...',
        oldPrice: 150.00,
        newPrice: 79.00,
        rating: 4,
      ),
      ProductModel(
        imageUrl: 'https://images.meesho.com/images/ProductModels/90849199/d32te_512.webp',
        name: 'Man Stylish Dresses...',
        oldPrice: 150.00,
        newPrice: 79.00,
        rating: 4,
      ),
      ProductModel(
        imageUrl: 'https://images.meesho.com/images/ProductModels/90849199/d32te_512.webp',
        name: 'Man Stylish Dresses...',
        oldPrice: 150.00,
        newPrice: 79.00,
        rating: 4,
      ),
      ProductModel(
        imageUrl: 'https://images.meesho.com/images/ProductModels/90849199/d32te_512.webp',
        name: 'Girls Stylish Dresses...',
        oldPrice: 150.00,
        newPrice: 79.00,
        rating: 4,
      ),
      ProductModel(
        imageUrl: 'https://images.meesho.com/images/ProductModels/90849199/d32te_512.webp',
        name: 'Man Stylish Dresses...',
        oldPrice: 150.00,
        newPrice: 79.00,
        rating: 4,
      ),
      ProductModel(
        imageUrl: 'https://images.meesho.com/images/ProductModels/90849199/d32te_512.webp',
        name: 'Girls Stylish Dresses...',
        oldPrice: 150.00,
        newPrice: 79.00,
        rating: 4,
      ),
      ProductModel(
        imageUrl: 'https://images.meesho.com/images/ProductModels/90849199/d32te_512.webp',
        name: 'Man Stylish Dresses...',
        oldPrice: 150.00,
        newPrice: 79.00,
        rating: 4,
      ),
      ProductModel(
        imageUrl: 'https://images.meesho.com/images/ProductModels/90849199/d32te_512.webp',
        name: 'Girls Stylish Dresses...',
        oldPrice: 150.00,
        newPrice: 79.00,
        rating: 4,
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'ProductModel List',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const FilterSection(),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: ProductModels.length,
                itemBuilder: (context, index) {
                  return ProductModelCard(ProductModel: ProductModels[index]);
                },
              ),
            ),
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Row(
      //         children: [
      //           ElevatedButton.icon(
      //             onPressed: () {},
      //             icon: Icon(Icons.filter_list),
      //             label: Text('Filter'),
      //           ),
      //           Spacer(),
      //           DropdownButton<String>(
      //             items: <String>['Sort by', 'Price', 'Rating'].map((String value) {
      //               return DropdownMenuItem<String>(
      //                 value: value,
      //                 child: Text(value),
      //               );
      //             }).toList(),
      //             onChanged: (_) {},
      //             hint: Text('Sort by'),
      //           ),
      //           IconButton(
      //             icon: Icon(Icons.view_list),
      //             onPressed: () {},
      //           ),
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //       child: GridView.builder(
      //         padding: EdgeInsets.all(8.0),
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           crossAxisSpacing: 8.0,
      //           mainAxisSpacing: 8.0,
      //           childAspectRatio: 0.7,
      //         ),
      //         itemCount: ProductModels.length,
      //         itemBuilder: (context, index) {
      //           return ProductModelCard(ProductModel: ProductModels[index]);
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
