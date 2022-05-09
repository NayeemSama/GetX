import 'package:get/get.dart';

class ProductModel {
  late final int? id;
  late final String? productName;
  late final String? productImage;
  late final String? productDescription;
  late final double? price;

  ProductModel({
    this.id,
    this.productName,
    this.productImage,
    this.productDescription,
    this.price,
  });

  final isFavorite = false.obs;
  final quantity = 1.obs;
}