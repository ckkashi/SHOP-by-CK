import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopping_app_by_ck/model/User.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController{

  User? obj ;

  addUser(User obj){
    this.obj = obj ;
  }

  bool isLoggedIn = false ;

  addUserLoggedIn(bool l){
    this.isLoggedIn = l ;
  }

  login(String email,String pass)async{
    try{
    Uri url = Uri.parse('https://shop-by-ck.herokuapp.com/user/loginUser');
    var data = await http.post(
      url,
      body: {
        "email":email,
        "pass":pass
      },
      headers: {
        "Accept":"application/json",
        "access_control_allow-origin":"*"
      }
      );
      var res= jsonDecode(data.body);
      print(res);
    }catch(e){};
  }

  register(User user)async{
    try{
    Uri url = Uri.parse('https://shop-by-ck.herokuapp.com/user/registerUser');
    var data = await http.post(
      url,
      body: {
        "email":user.email,
        "pass":user.pass,
        "username":user.username,
        "userAddress":user.userAddress,
        "userContact":user.userContact,
        "userProfileUrl":"",
        "userPaymentDetail":""
      },
      headers: {
        "Accept":"application/json",
        "access_control_allow-origin":"*"
      }

      
      );

      var res= jsonDecode(data.body);
      addUser(res);
      print(res.toString());
    }catch(e){
      print(e);
    }
      
      update();
  }

  


}