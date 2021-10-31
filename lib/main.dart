import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app_by_ck/screens/Home.dart';
import 'package:shopping_app_by_ck/screens/Splash.dart';
import 'package:shopping_app_by_ck/screens/authScreens/login.dart';
import 'package:shopping_app_by_ck/screens/authScreens/register.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation,deviceType){
      return GetMaterialApp(
        title: 'SHOP by CK',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        initialRoute: '/splash',
        getPages: [
          GetPage(name: '/splash', page: ()=>Splash()),
          GetPage(name: '/home', page: ()=>Home()),
          GetPage(name: '/login', page: ()=>Login()),
          GetPage(name: '/register', page: ()=>Register()),
        ],
      );
    });
  }
}
