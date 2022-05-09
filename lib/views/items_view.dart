import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/item_controller.dart';
import 'package:getx/views/item_card.dart';

class ShoppingHome extends StatelessWidget {
  ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Page'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Obx(
                () {
                  if(itemController.isLoading.value){
                    return Center(child: CircularProgressIndicator());
                  }
                  else{
                    return MasonryGridView.count(
                        itemCount: itemController.itemList.length,
                        crossAxisCount: 2,
                        itemBuilder: (context, index) {
                          return ItemTile(itemController.itemList[index]);
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
