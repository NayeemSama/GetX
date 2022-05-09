import 'package:get/get.dart';
import 'package:getx/models/product_model.dart';

class ShoppingController extends GetxController{

  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() {
    Future.delayed(const Duration(seconds: 1));
    var productResult = [
      ProductModel(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'FirstProd'),
      ProductModel(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'SecProd'),
      ProductModel(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'ThirdProd'),
    ];

    products.value = productResult;
  }

}