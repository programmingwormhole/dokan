import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
      json.decode(str).map(
            (x) => ProductModel.fromJson(x),
          ),
    );

class ProductModel {
  int? id;
  String? thumbnail;
  String? name;
  String? regularPrice;
  String? salePrice;
  String? rating;
  List<Images>? images;

  ProductModel({
    this.id,
    this.name,
    this.thumbnail,
    this.images,
    this.salePrice,
    this.regularPrice,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<Images> imageList = json['images'] == null
        ? []
        : List<Images>.from(json['images']!.map((x) => Images.fromJson(x)));

    var thumbnailUrl = imageList.isNotEmpty ? imageList[0].src : '';

    return ProductModel(
      id: json["id"],
      name: json["name"],
      rating: json['average_rating'],
      salePrice: json['sale_price'],
      regularPrice: json['regular_price'],
      thumbnail: thumbnailUrl,
      images: imageList,
    );
  }
}

class Images {
  String? src;

  Images({
    this.src,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        src: json["src"],
      );
}
