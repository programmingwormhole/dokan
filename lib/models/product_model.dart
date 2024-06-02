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
  String? price;
  String? regularPrice;
  String? salePrice;
  String? rating;
  List<Images>? images;
  DateTime? createdDate;

  ProductModel({
    this.id,
    this.name,
    this.thumbnail,
    this.images,
    this.price,
    this.salePrice,
    this.regularPrice,
    this.rating,
    this.createdDate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<Images> imageList = json['images'] == null
        ? []
        : List<Images>.from(json['images']!.map((x) => Images.fromJson(x)));

    var thumbnailUrl = imageList.isNotEmpty ? imageList[0].src : '';

    return ProductModel(
      id: json["id"],
      name: json["name"],
      price: json['price'],
      salePrice: json['sale_price'],
      regularPrice: json['regular_price'],
      thumbnail: thumbnailUrl,
      images: imageList,
      rating: json['average_rating'],
      createdDate: DateTime.parse(json["date_created"]),
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
