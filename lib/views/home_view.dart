import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/controllers/shopping_controller.dart';

class HomeView extends StatelessWidget {

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDescription}'),
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}',
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(() {
                                    return Text(
                                      'Quantity: ${controller.products[index].quantity}',
                                      style: const TextStyle(fontSize: 15, color: Colors.black),
                                    );
                                  }),

                                  ElevatedButton(
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
                                    onPressed: () {
                                      cartController
                                          .addToCart(controller.products[index]);
                                      controller.products[index].quantity.value++;
                                    },
                                    child: const Text('Add to Cart',style: TextStyle(color: Colors.white,),),
                                  ),

                                ],
                              ),

                              Obx(() => IconButton(
                                icon: controller
                                    .products[index].isFavorite.value
                                    ? const Icon(Icons.thumb_up_alt)
                                    : const Icon(Icons.thumb_up_alt_outlined),
                                onPressed: () {
                                  controller.products[index].isFavorite
                                      .toggle();
                                },
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              ),
            ),

            // GetX<CartController>(builder: (controller) {
            //   return Text(
            //     'Total amount: \$ ${controller.totalPrice}',
            //     style: const TextStyle(fontSize: 32, color: Colors.white),
            //   );
            // }),

            Obx(() {
              return Text(
                'Total amount: \$ ${cartController.totalPrice}',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            const SizedBox(height: 100),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purpleAccent,
        onPressed: () {  },
        label: GetX<CartController>(
          builder: (context) {
            return Text('Items: ${context.cartItems.length}');
          }
        ),
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
