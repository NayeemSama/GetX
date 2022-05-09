import 'package:get/get.dart';
import 'package:getx/models/item_model.dart';
import 'package:getx/services/remote_service.dart';

class ItemController extends GetxController{

  var itemList = <Welcome>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchItemsFromService();
    super.onInit();
  }

  fetchItemsFromService()async{

    try {
      isLoading(true);
      var items = await RemoteService().fetchItems();
      itemList.value = items!;
    } finally {
      isLoading(false);
    }

  }
}