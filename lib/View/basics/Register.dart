// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_lambda_dental/Controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

// ignore: must_be_immutable
class Register extends GetView {
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  Register({super.key});
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
                color: cyan500,
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
                                        myTextField(emailcontroller, context,
                                            'User Name'.tr, Icon(Icons.person)),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        myTextField(
                                            emailcontroller,
                                            context,
                                            'Phone Number'.tr,
                                            Icon(Icons.phone)),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        myTextField(
                                            emailcontroller,
                                            context,
                                            'Address'.tr,
                                            Icon(Icons.pin_drop_rounded)),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        myTextField(emailcontroller, context,
                                            'Email'.tr, Icon(Icons.mail)),
                                        const SizedBox(
                                          height: 25.0,
                                        ),
                                        TextFormField(
                                          controller: passwordcontroller,
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
                                          onFieldSubmitted: (value) {},
                                          decoration: InputDecoration(
                                            label: Text('Password'.tr),
                                            prefixIcon: const Icon(Icons.lock),
                                            suffixIcon: IconButton(
                                              icon: controller.passeyeicon,
                                              onPressed: () {
                                                controller.controlPassword();
                                                if (controller.loginsuccess) {
                                                  Get.toNamed('/home');
                                                }
                                              },
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    width: 3.0),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.redAccent,
                                                  width: 2.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        TextFormField(
                                          controller: passwordcontroller,
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
                                          onFieldSubmitted: (value) {},
                                          decoration: InputDecoration(
                                            label: Text('Confirm Password'.tr),
                                            prefixIcon:
                                                const Icon(Icons.lock_reset),
                                            suffixIcon: IconButton(
                                              icon: controller.passeyeicon,
                                              onPressed: () {
                                                controller.controlPassword();
                                                if (controller.loginsuccess) {
                                                  Get.toNamed('/home');
                                                }
                                              },
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    width: 3.0),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.redAccent,
                                                  width: 2.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
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
                                              'Register'.tr,
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
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Already had an account ?'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Get.toNamed('/');
                                              },
                                              child: Text(
                                                'Login'.tr,
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
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
