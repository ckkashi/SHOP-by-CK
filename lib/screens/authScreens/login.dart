import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app_by_ck/controller/UserController.dart';
import 'package:shopping_app_by_ck/screens/authScreens/UserProfile.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {

  TextEditingController emailCon = TextEditingController();

  TextEditingController passCon = TextEditingController();

  var form_text_style = TextStyle(fontSize: 22.sp);

  var form_label_style = TextStyle(fontSize: 15.sp);

  var field_border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(width: 2.w, style: BorderStyle.solid));

      UserController con = Get.put(UserController());

      bool isUserLogin = false;

  @override
  Widget build(BuildContext context) {
    return isUserLogin
        ? USerProfile()
        : Scaffold(
            appBar: AppBar(title: Text('Login'), centerTitle: true),
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
                              height: 15.h,
                            ),
                            Icon(
                              Icons.cloud_circle_rounded,
                              size: 100.sp,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: TextFormField(
                                controller: emailCon,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (!GetUtils.isEmail(value!))
                                    return "Email is not valid";
                                  else
                                    return null;
                                },
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: passCon,
                                style: form_text_style,
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: 'Enter Password',
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
                                        Get.snackbar(
                                            'Error', 'Fill all fields.',
                                            snackPosition:
                                                SnackPosition.BOTTOM);
                                      } else {
                                        if (passCon.text == '') {
                                          Get.snackbar(
                                              'Error', 'Fill all fields.',
                                              snackPosition:
                                                  SnackPosition.BOTTOM);
                                        } else {
                                          String pass = passCon.text;
                                          if (pass.length >= 7) {
                                            con.login(emailCon.text, passCon.text);
                                          } else {
                                            Get.snackbar('Error',
                                                'Password must be of 8 Character',
                                                snackPosition:
                                                    SnackPosition.BOTTOM);
                                          }
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'Login',
                                        style: TextStyle(fontSize: 18.sp),
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    top: 80.h,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed('/register');
                            },
                            child: Text(
                              'Create Account ?',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold)),
                            )))),
              ],
            ),
          );
  }
}