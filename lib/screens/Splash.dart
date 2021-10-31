import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopping_app_by_ck/controller/ProductsController.dart';
import 'package:shopping_app_by_ck/screens/Home.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  // const Splash({ Key? key }) : super(key: key);
  

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // ProductsController controller = Get.put(ProductsController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.onInit();
    Timer(Duration(seconds: 3), ()=>{
       
      Get.offAllNamed('/home')
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        color: Colors.indigoAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag_sharp,size: 40.w,color: Colors.white,),
              Text(
                'SHOP\nby CK',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24.sp,
                  letterSpacing:2
                ),
                )
            ],
          ),
        ),
      ),      
    );
  }
}