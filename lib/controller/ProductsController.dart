import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopping_app_by_ck/model/ProductModel.dart';
import 'package:http/http.dart' as http;

class ProductsController extends GetxController{
  RxList data = [].obs ;

  add(ProductModel obj){
    data.add(obj);
  }


  getData()async{

    try{
      Uri url = Uri.parse('https://raw.githubusercontent.com/ckkashi/backend-shop-by-ck/master/routes/products.json');
    var data = await http.get(url);
    var res = jsonDecode(data.body);
    for (var item in res) {
      add(ProductModel.fromJson(item));
      print(item);
    }
    }catch(e){}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    update();
  }

}