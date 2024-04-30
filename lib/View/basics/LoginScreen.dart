// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_lambda_dental/Controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

// ignore: must_be_immutable
class LoginScreen extends GetView {
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginController(),
        builder: (controller) {
          controller.allow_notifications();
          return Scaffold(
            //appBar: AppBar(),
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [cyan600, cyan100, cyan500],
                  ),
                ),
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.5),
                        height: MediaQuery.of(context).size.height,
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //     image: AssetImage(
                        //         "assets/images/login/background.jpg"),
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: bglight,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.0),
                                  topRight: Radius.circular(50.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Form(
                                  key: formkey,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 0,
                                        ),
                                        myTextField(
                                          emailcontroller,
                                          context,
                                          'Email'.tr,
                                          Icon(Icons.mail),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter your Email'
                                                  .tr;
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        myTextField(
                                          passwordcontroller,
                                          context,
                                          'Password',
                                          Icon(Icons.password),
                                          obscureText: !controller.showpassword,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter your password'
                                                  .tr;
                                            }
                                            return null;
                                          },
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          postfixicon: IconButton(
                                            icon: controller.passeyeicon,
                                            onPressed: () {
                                              controller.controlPassword();
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // if (formkey.currentState!
                                            //     .validate()) {
                                            //   controller.requestLogin(
                                            //       emailcontroller.text,
                                            //       passwordcontroller.text);
                                            // }
                                            Get.offAndToNamed('/orderlist');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            //height: 60,
                                            width: 150,
                                            padding: const EdgeInsets.all(15),
                                            child: Text(
                                              'Login'.tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      isDismissible: true,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          50),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          50))),
                                                      builder: (context) =>
                                                          forgotPasswordEmailBuilder(
                                                              context));
                                                },
                                                child: Text(
                                                  'Forgot Password ? '.tr,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )),
                                            TextButton(
                                              onPressed: () {
                                                Get.toNamed('/register');
                                              },
                                              child: Text(
                                                'Register'.tr,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 150, left: 50),
                        child: Column(
                          children: [
                            Icon(
                              CupertinoIcons.tortoise_fill,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'Login'.tr,
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget forgotPasswordEmailBuilder(context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              'Forgot Password?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Enter your email for the verification process, \nwe will send a 6 digit code to your email',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            SizedBox(
              height: 35,
            ),
            myTextField(
              emailcontroller,
              context,
              'Email',
              Icon(Icons.mail_lock),
            ),
            SizedBox(
              height: 45,
            ),
            defaultButton(
                text: 'Continue',
                function: () {
                  Navigator.pop(context);

                  showModalBottomSheet(
                      context: context,
                      builder: (context) => forgotPasswordCodeBuilder(context));
                })
          ],
        ),
      ),
    );
  }

  Widget forgotPasswordCodeBuilder(context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              'Enter 6-Digit Code',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Enter the 6-Digit code that you\'ve received on your Email.',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumInput(context),
                SizedBox(
                  width: 10,
                ),
                NumInput(context),
                SizedBox(
                  width: 10,
                ),
                NumInput(context),
                SizedBox(
                  width: 10,
                ),
                NumInput(context),
                SizedBox(
                  width: 10,
                ),
                NumInput(context),
                SizedBox(
                  width: 10,
                ),
                NumInput(context),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            defaultButton(
                text: 'Continue',
                function: () {
                  Navigator.pop(context);

                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container();
                      });
                })
          ],
        ),
      ),
    );
  }
}
