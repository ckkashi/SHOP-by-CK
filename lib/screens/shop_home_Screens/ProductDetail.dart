import 'package:flutter/material.dart';
import 'package:shopping_app_by_ck/model/ProductModel.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatelessWidget {
  ProductModel? model;
  ProductDetail(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product - Detail Page',
          style: GoogleFonts.lato(fontSize: 20.sp, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 10.h,
              child: Container(
                width: 100.w,
                // height: 50.h,
                // color: Colors.black,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          width: 100.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(model!.pImg.toString()),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.black,
                    
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          model!.pName.toString(),
                          style: GoogleFonts.lato(
                            fontSize:22.sp,
                            color: Colors.black
                          ),
                          ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [Text('Product Description : ',style: GoogleFonts.ubuntu(
                          fontSize:14.sp
                        ),)],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(model!.pDesc.toString(),style: GoogleFonts.ubuntu(
                          fontSize:16.sp
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [Text('Categories : '+model!.pCat.toString(),style: GoogleFonts.ubuntu(
                          fontSize:14.sp
                        ),)],),
                      ),

                    ],
                  ),
                ),
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: 100.w,
                height: 10.h,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            model!.pPrice.toString() + ' Rs',
                            style: GoogleFonts.ubuntu(
                              fontSize: 22.sp,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                
                              }, child: Text('Add to cart')),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
