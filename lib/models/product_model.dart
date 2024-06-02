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
  double? regularPrice;
  double? salePrice;
  double? rating;
  List<Image>? images;

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
    List<Image> imageList = json['images'] == null
        ? []
        : List<Image>.from(json['images']!.map((x) => Image.fromJson(x)));

    var thumbnailUrl = imageList.isNotEmpty ? imageList[0].src : '';

    return ProductModel(
      id: json["id"],
      name: json["name"],
      thumbnail: thumbnailUrl,
      images: imageList,
    );
  }
}

class Image {
  String? src;

  Image({
    this.src,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        src: json["src"],
      );
}
