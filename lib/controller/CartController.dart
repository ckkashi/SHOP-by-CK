import 'package:get/get.dart';
import 'package:shopping_app_by_ck/model/CartModel.dart';

class CartController extends GetxController{
  RxList cartList = [].obs;
  addItem(Cart obj){
    cartList.add(obj);
  }
  
}