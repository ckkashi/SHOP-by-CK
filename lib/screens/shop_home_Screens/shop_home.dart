import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_by_ck/controller/LoadingController.dart';
import 'package:shopping_app_by_ck/controller/ProductsController.dart';
import 'package:shopping_app_by_ck/model/ProductModel.dart';
import 'package:shopping_app_by_ck/screens/Loading.dart';
import 'package:shopping_app_by_ck/screens/shop_home_Screens/CategoryList.dart';
import 'package:shopping_app_by_ck/screens/shop_home_Screens/ProductDetail.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class ShopHome extends StatefulWidget {
  @override
  _ShopHomeState createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {
  ProductsController controller = Get.put(ProductsController());

  bool forLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5), () {
      setState(() {
        forLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return forLoading
        ? Loading()
        : Container(
            width: 100.w,
            height: 100.h,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0,bottom: 10.0),
                          child: Text(
                            'LATEST ITEMS',
                            style: GoogleFonts.ubuntu(
                                letterSpacing: 1,
                                fontSize: 18.sp,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    CarouselSlider.builder(
                      itemCount: 5,
                      options: CarouselOptions(
                          height: 30.h, autoPlayCurve: Curves.easeOutSine),
                      itemBuilder: (context, itemIndex, pageViewIndex) {
                        return GestureDetector(
                          onTap: ()=>Get.to(ProductDetail(controller.data[itemIndex])),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        controller.data[itemIndex].pImg,
                                      ),
                                      fit: BoxFit.cover),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 4,
                                        spreadRadius: 4)
                                  ]),
                              width: 100.w,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                        width: 100.w,
                                        height: 7.h,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  controller
                                                      .data[itemIndex].pName,
                                                  maxLines: 1,
                                                  style: GoogleFonts.lato(
                                                      fontSize: 14.sp,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.indigoAccent
                                                .withOpacity(1.0),
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(5.0),
                                                bottomLeft:
                                                    Radius.circular(5.0)))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0,bottom: 10.0),
                          child: Text(
                            'CATEGORIES',
                            style: GoogleFonts.ubuntu(
                                letterSpacing: 1,
                                fontSize: 18.sp,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    categories_list(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0,bottom: 10.0),
                          child: Text(
                            'TRENDING ITEMS',
                            style: GoogleFonts.ubuntu(
                                letterSpacing: 1,
                                fontSize: 18.sp,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 30.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap:()=>Get.to(ProductDetail(controller.data[index])),
                            child: Container(
                              width: 40.w,
                              height: 28.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 2,
                                        spreadRadius: 4)
                                  ]),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40.w,
                                        height:19.h,
                                        decoration: BoxDecoration(
                                          image:DecorationImage(image: NetworkImage(controller.data[index].pImg),fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.black,
                                  )
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(controller.data[index].pName,maxLines: 1,style: GoogleFonts.lato(
                                          fontSize: 14.sp
                                        ),),
                                      ),
                                      Text('Price : '+controller.data[index].pPrice+' Rs',style: GoogleFonts.lato(
                                        fontSize: 12.sp
                                      )),
                                    ],
                                  ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  SizedBox categories_list() {
    return SizedBox(
      width: 100.w,
      height: 10.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // GestureDetector(
          //   onTap: ()=>Get.to(CategoryListData('All')),
          //   child: Padding(
          //     padding: const EdgeInsets.all(5.0),
          //     child: Container(
          //       width: 40.w,
          //       height: 7.5.h,
          //       child: Row(
          //         children: [
          //           Container(
          //             width: 10.w,
          //             height: 7.5.h,
          //             child: Icon(Icons.all_inclusive_sharp,
          //                 color: Colors.indigo),
          //           ),
          //           Container(
          //             width: 28.w,
          //             height: 7.5.h,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   'All',
          //                   style: GoogleFonts.ubuntu(
          //                       color: Colors.indigo, fontSize: 15.sp),
          //                 ),
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(5.0),
          //           color: Colors.white,
          //           boxShadow: [
          //             BoxShadow(
          //                 color: Colors.black.withOpacity(0.3),
          //                 blurRadius: 2,
          //                 spreadRadius: 4)
          //           ]),
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: ()=>Get.to(CategoryListData('Electronics')),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 40.w,
                height: 7.5.h,
                child: Row(
                  children: [
                    Container(
                      width: 10.w,
                      height: 7.5.h,
                      child: Icon(Icons.phone_android, color: Colors.indigo),
                    ),
                    Container(
                      width: 28.w,
                      height: 7.5.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Electronics',
                            style: GoogleFonts.ubuntu(
                                color: Colors.indigo, fontSize: 15.sp),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 2,
                          spreadRadius: 4)
                    ]),
              ),
            ),
          ),
          GestureDetector(
            onTap: ()=>Get.to(CategoryListData('Clothes')),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 40.w,
                height: 7.5.h,
                child: Row(
                  children: [
                    Container(
                      width: 10.w,
                      height: 7.5.h,
                      child: Icon(Icons.shopping_basket_rounded,
                          color: Colors.indigo),
                    ),
                    Container(
                      width: 28.w,
                      height: 7.5.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Clothes',
                            style: GoogleFonts.ubuntu(
                                color: Colors.indigo, fontSize: 15.sp),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 2,
                          spreadRadius: 4)
                    ]),
              ),
            ),
          ),
          GestureDetector(
            onTap: ()=>Get.to(CategoryListData('Cars')),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 40.w,
                height: 7.5.h,
                child: Row(
                  children: [
                    Container(
                      width: 10.w,
                      height: 7.5.h,
                      child: Icon(Icons.car_repair, color: Colors.indigo),
                    ),
                    Container(
                      width: 28.w,
                      height: 7.5.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cars',
                            style: GoogleFonts.ubuntu(
                                color: Colors.indigo, fontSize: 15.sp),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 2,
                          spreadRadius: 4)
                    ]),
              ),
            ),
          ),
          GestureDetector(
            onTap: ()=>Get.to(CategoryListData('Groceries')),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 40.w,
                height: 7.5.h,
                child: Row(
                  children: [
                    Container(
                      width: 10.w,
                      height: 7.5.h,
                      child: Icon(Icons.badge, color: Colors.indigo),
                    ),
                    Container(
                      width: 28.w,
                      height: 7.5.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Groceries',
                            style: GoogleFonts.ubuntu(
                                color: Colors.indigo, fontSize: 15.sp),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 2,
                          spreadRadius: 4)
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
