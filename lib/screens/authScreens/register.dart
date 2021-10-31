import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app_by_ck/controller/UserController.dart';
import 'package:shopping_app_by_ck/model/User.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  TextEditingController usernameCon = TextEditingController();
  TextEditingController usercontactCon = TextEditingController();
  TextEditingController useraddressCon = TextEditingController();
  TextEditingController userprofileCon =
      TextEditingController(text: 'no image selected');
  TextEditingController bankCon = TextEditingController();
  TextEditingController cardnoCon = TextEditingController();

  var form_text_style = TextStyle(fontSize: 22.sp);

  var form_label_style = TextStyle(fontSize: 15.sp);

  var field_border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(width: 2.w, style: BorderStyle.solid));

      UserController con = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register'), centerTitle: true),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: 100.w,
                height: 100.h,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Icon(
                        Icons.cloud_circle_rounded,
                        size: 100.sp,
                        color: Colors.indigoAccent,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (!GetUtils.isEmail(value!))
                              return "Email is not valid";
                            else
                              return null;
                          },
                          controller: emailCon,
                          style: form_text_style,
                          decoration: InputDecoration(
                              labelText: 'Enter E-mail',
                              labelStyle: form_label_style,
                              border: field_border),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: TextFormField(
                          controller: passCon,
                          style: form_text_style,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Enter Password',
                              labelStyle: form_label_style,
                              border: field_border),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: TextFormField(
                          controller: usernameCon,
                          style: form_text_style,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelText: 'Enter Username',
                              labelStyle: form_label_style,
                              border: field_border),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: TextFormField(
                          controller: useraddressCon,
                          style: form_text_style,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelText: 'Enter address',
                              labelStyle: form_label_style,
                              border: field_border),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: TextFormField(
                          controller: usercontactCon,
                          style: form_text_style,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelText: 'Enter contact',
                              labelStyle: form_label_style,
                              border: field_border),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 10, vertical: 8),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         flex: 2,
                      //         child: Text(userprofileCon.text)),
                      //         Expanded(
                      //         flex: 1,
                      //         child: ElevatedButton(onPressed: (){}, child: Text('Choose Image'))),
                      //     ],
                      //   ),
                      // ),\
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: TextFormField(
                          controller: bankCon,
                          style: form_text_style,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelText: 'Enter bank name',
                              labelStyle: form_label_style,
                              border: field_border),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: TextFormField(
                          controller: cardnoCon,
                          style: form_text_style,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Enter card no',
                              labelStyle: form_label_style,
                              border: field_border),
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                if (emailCon.text == '') {
                                  Get.snackbar('Error', 'Fill all fields.',
                                      snackPosition: SnackPosition.BOTTOM);
                                } else {
                                  if (passCon.text == '') {
                                    Get.snackbar('Error', 'Fill all fields.',
                                        snackPosition: SnackPosition.BOTTOM);
                                  } else {
                                    String pass = passCon.text;
                                    if (pass.length >= 7) {
                                      if (usernameCon.text == '' &&
                                          usercontactCon.text == '' &&
                                          useraddressCon.text == '' &&
                                          bankCon.text == '' &&
                                          cardnoCon.text == '') {
                                        Get.snackbar(
                                            'Error', 'Fill all fields.',
                                            snackPosition:
                                                SnackPosition.BOTTOM);
                                      } else {
                                        // { "bank":bankCon.text,"card no":cardnoCon.text};
                                        UserPaymentDetail bank = UserPaymentDetail(bank:bankCon.text,cardNo:cardnoCon.text);
                                        User obj = new User(sId: '',email: emailCon.text,pass: passCon.text,username: usernameCon.text,userContact:usercontactCon.text,userAddress: useraddressCon.text,userProfileUrl: '',userPaymentDetail:bank );
                                        con.register(obj);
                                        
                                      }
                                    } else {
                                      Get.snackbar('Error',
                                          'Password must be of 8 Character',
                                          snackPosition: SnackPosition.BOTTOM);
                                    }
                                  }
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ))),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
