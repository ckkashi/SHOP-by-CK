import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app_by_ck/controller/FilterCategoryController.dart';
import 'package:shopping_app_by_ck/controller/ProductsController.dart';
import 'package:shopping_app_by_ck/model/ProductModel.dart';
import 'package:shopping_app_by_ck/screens/Loading.dart';
import 'package:shopping_app_by_ck/screens/shop_home_Screens/ProductDetail.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class CategoryListData extends StatefulWidget {
  
  
  
  String? keywordd;
  CategoryListData(this.keywordd);

  @override
  _CategoryListDataState createState() => _CategoryListDataState();
}

class _CategoryListDataState extends State<CategoryListData> {
  FilterCategoryController con = Get.put(FilterCategoryController());
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), (){
      
      setState(() {
        isLoading = false;
      });
    
    });
  }

  @override
  Widget build(BuildContext context) {

    // FilterCategoryController con = Get.put(FilterCategoryController());

    con.addKeyword(widget.keywordd.toString());
    return isLoading==true?Loading():Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.keywordd}',
          style: GoogleFonts.lato(fontSize: 20.sp, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100.w,
          height: 100.h,
          child: ListView.builder(
            itemCount: con.filterList.length,
            itemBuilder: (context,index){
              // con.filterList[index].pName
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: ()=>Get.to(ProductDetail(con.filterList[index])),
                  child: Container(
                    width: 100.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 2,
                          spreadRadius: 4
                        )
                      ],
                      color: Colors.white
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child:Container(
                            width: 100.w,
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(image: NetworkImage(con.filterList[index].pImg.toString()),fit: BoxFit.cover)
                            )
                          )
                          ),
                        Expanded(
                          flex: 2,
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  con.filterList[index].pName,
                                  maxLines: 1,
                                  style: GoogleFonts.lato(
                                    fontSize:16.sp
                                  ),
                                  
                                  ),
                              ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                  'Price : '+con.filterList[index].pPrice+' Rs',
                                  maxLines: 1,
                                  style: GoogleFonts.lato(
                                    fontSize:14.sp
                                  ),
                                  
                                  ),
                                )
                            ],
                          )
                          ),
                      ],
                    ),
                  ),
                ),
              );
            })
        ),
      ),
    );
  }
}