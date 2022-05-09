import 'package:get/get.dart';
import 'package:getx/models/product_model.dart';

class CartController extends GetxController{

  var cartItems = <ProductModel>[].obs;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + (item.price!/1));

  addToCart(ProductModel productModel){
    cartItems.add(productModel);
  }

}