// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_lambda_dental/Controller/User/Auth_controller.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

// ignore: must_be_immutable
class RegisterScreen extends GetView {
  var formkey = GlobalKey<FormState>();

  var usernamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var phonenumbercontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var confirmpasswordcontroller = TextEditingController();

  RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AuthController(),
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
                            top: MediaQuery.of(context).size.height * 0.1),
                        height: MediaQuery.of(context).size.height,
                        // decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   image:
                        //       AssetImage("assets/images/login/background.jpg"),
                        //   fit: BoxFit.cover,
                        // ),
                        //),
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
                                        myTextField(usernamecontroller, context,
                                            'User Name'.tr, Icon(Icons.person)),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        myTextField(
                                            phonenumbercontroller,
                                            context,
                                            'Phone Number'.tr,
                                            Icon(Icons.phone),
                                            keyboardType: TextInputType.phone),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        myTextField(
                                            addresscontroller,
                                            context,
                                            'Address'.tr,
                                            Icon(Icons.pin_drop_rounded),
                                            keyboardType:
                                                TextInputType.streetAddress),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        myTextField(emailcontroller, context,
                                            'Email'.tr, Icon(Icons.mail),
                                            keyboardType:
                                                TextInputType.emailAddress),
                                        const SizedBox(
                                          height: 25.0,
                                        ),
                                        myTextField(
                                          passwordcontroller,
                                          context,
                                          'Password',
                                          Icon(Icons.lock_rounded),
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
                                        SizedBox(
                                          height: 25,
                                        ),
                                        myTextField(
                                          confirmpasswordcontroller,
                                          context,
                                          'Confirm Password',
                                          Icon(Icons.lock_reset_rounded),
                                          obscureText: !controller.showpassword,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter your password'
                                                  .tr;
                                            }
                                            if (value !=
                                                passwordcontroller.text)
                                              return 'Passwords do not match. Please try again.';
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
                                        // TextButton(
                                        //   onPressed: () {
                                        //     // if (formkey.currentState!
                                        //     //     .validate()) {
                                        //     //   controller.requestLogin(
                                        //     //       emailcontroller.text,
                                        //     //       passwordcontroller.text);
                                        //     // }
                                        //     Get.offAndToNamed('/orderlist');
                                        //   },
                                        //   child: Container(
                                        //     decoration: BoxDecoration(
                                        //       color: Theme.of(context)
                                        //           .primaryColor,
                                        //       borderRadius:
                                        //           BorderRadius.circular(30.0),
                                        //     ),
                                        //     //height: 60,
                                        //     width: 150,
                                        //     padding: const EdgeInsets.all(15),
                                        //     child: Text(
                                        //       'Register'.tr,
                                        //       textAlign: TextAlign.center,
                                        //       style: TextStyle(
                                        //           fontSize: 16,
                                        //           color: Colors.white),
                                        //     ),
                                        //   ),
                                        // ),
                                        defaultButton(
                                          text: 'Register',
                                          textsize: 16,
                                          function: () {
                                            if (formkey.currentState!
                                                .validate()) {
                                              controller.requestLogin(
                                                  emailcontroller.text,
                                                  passwordcontroller.text);
                                            }
                                            Get.offAndToNamed('/home');
                                          },
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Already had an account?'.tr,
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Get.offAndToNamed('/');
                                              },
                                              child: Text(
                                                'Login'.tr,
                                                style: TextStyle(
                                                    color: cyan400,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
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
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
