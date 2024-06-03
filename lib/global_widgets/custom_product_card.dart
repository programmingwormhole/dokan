import 'package:dokan_multivendor/components/common_shadow.dart';
import 'package:dokan_multivendor/utils/assets_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: commonShadow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10.0)),
              child: FadeInImage.assetNetwork(
                placeholder: ImageManager.logo.path,
                image: product.thumbnail!,
                width: double.infinity,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          ImageManager.noImage.path,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.name ?? 'no_data'.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: product.salePrice!.isEmpty
                    ? Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : Row(
                        children: [
                          Text(
                            '\$${product.regularPrice!}',
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            '\$${product.salePrice!}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: _buildStarRating(
                    double.parse(product.rating!),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _buildStarRating(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(const Icon(Icons.star, color: Colors.orange, size: 16.0));
      } else if (i == fullStars && hasHalfStar) {
        stars
            .add(const Icon(Icons.star_half, color: Colors.orange, size: 16.0));
      } else {
        stars.add(
            const Icon(Icons.star_border, color: Colors.orange, size: 16.0));
      }
    }

    return stars;
  }
}
