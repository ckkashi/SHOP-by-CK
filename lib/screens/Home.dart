import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_by_ck/controller/ProductsController.dart';
import 'package:shopping_app_by_ck/controller/UserController.dart';
import 'package:shopping_app_by_ck/screens/shop_home_Screens/shop_cart.dart';
import 'package:shopping_app_by_ck/screens/shop_home_Screens/shop_fav.dart';
import 'package:shopping_app_by_ck/screens/shop_home_Screens/shop_home.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  UserController userCon = Get.put(UserController());

  bool isLoggedIn = false;

  var drawerButtonStyle = GoogleFonts.ubuntu(
                  fontSize: 16.sp,
                  letterSpacing: 0.5,
                  color: Colors.indigoAccent
                );

  ProductsController controller = Get.put(ProductsController());

    int selectedIndex = 0 ;

    var pages = [ShopHome(),ShopFav(),ShopCart()] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: shop_appbar(),
      drawer: shop_drawer(),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index ;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_outlined),
            label: 'Favourite'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart'
          ),
        ],
      ),
    );
  }

  Container shop_drawer() {
    return Container(
      width: 80.w,
      height: 60.h,
      child: Column(
        children: [
          drawerHeader(),
          SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
            onTap:(){},
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'View previous orders',
                    style: drawerButtonStyle 
                    ),
                ),
                Divider(),
              ],
            ),
          ),
          GestureDetector(
            onTap:(){},
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'About',
                    style: drawerButtonStyle 
                    ),
                ),
                Divider(),
              ],
            ),
          ),
          GestureDetector(
            onTap:(){},
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Policies',
                    style: drawerButtonStyle 
                    ),
                ),
                Divider(),
              ],
            ),
          ),
              ],
            ),
          ),
          
        ],
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 4
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight:Radius.circular(8.0),bottomRight:Radius.circular(8.0))
      ),
    );
  }

  Container drawerHeader() {
    return Container(
            
            width: 80.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.only(topRight:Radius.circular(8.0),bottomRight:Radius.circular(0.0))
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(flex: 1,child: CircleAvatar(
                    maxRadius: 8.w,
                    child: userCon.isLoggedIn==false?Icon(Icons.person,color:Colors.white,size: 10.w,):Container(),
                    
                  )),
                  Expanded(flex: 2,child: isLoggedIn==false?Row(
                    children: [
                      TextButton(onPressed: (){
                        Get.toNamed('/login');
                      }, child: Text(
                        'Login',
                        style: GoogleFonts.lato(
                          fontSize: 20.sp,
                          color: Colors.white
                        ),
                        )),
                    ],
                  ):Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'User',
                        maxLines: 1,
                        style: GoogleFonts.lato(
                          fontSize: 18.sp,
                          color: Colors.white
                        ),
                        ),
                      Text(
                        'user@user.com',
                        maxLines: 1,
                        style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          color: Colors.white
                        ),)
                    ],
                  )),
                ],
              ),
            ),
          );
  }

  AppBar shop_appbar() {
    return AppBar(
      backgroundColor: Colors.indigoAccent,
      title: Text(
        'SHOP by CK',
        style: GoogleFonts.lato(
          fontSize: 20.sp,
          color: Colors.white
        ),
        ),
        centerTitle: true,
    );
  }
}
