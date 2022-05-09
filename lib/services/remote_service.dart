import 'package:getx/models/item_model.dart';
import 'package:http/http.dart';

class RemoteService{

  var client = Client();

  Future<List<Welcome>?>fetchItems()async{
    var response =  await client.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if(response.statusCode == 200){
      var body = response.body;
      return welcomeFromJson(body);
    }
    else{
      return null;
    }
  }

}