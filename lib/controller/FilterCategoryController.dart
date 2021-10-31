import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopping_app_by_ck/controller/ProductsController.dart';
import 'package:shopping_app_by_ck/model/ProductModel.dart';
import 'package:http/http.dart' as http;

class FilterCategoryController extends GetxController{


  RxList filterList = [].obs;

  String? keyword ;

  addKeyword(String w){
    keyword = w ;
  }

  addData(ProductModel pm){
    filterList.add(pm);
  }

  getData ()async{
    try{
      Uri url = Uri.parse('https://raw.githubusercontent.com/ckkashi/backend-shop-by-ck/master/routes/products.json');
    var data = await http.get(url);
    var res = jsonDecode(data.body);
    for (var item in res) {
      if(ProductModel.fromJson(item).pCat == keyword){
        addData(ProductModel.fromJson(item));
      }     
    }
    print(filterList);
    }catch(e){
      print(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    keyword = '' ;
  }

}