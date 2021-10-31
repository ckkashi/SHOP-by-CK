import 'dart:async';

import 'package:get/get.dart';

class LoadingController extends GetxController{

  bool forLoading = true ;

  chng(){
    forLoading = false ;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(Duration(seconds: 3), (){
      chng();
      // update();
    });
  }

}