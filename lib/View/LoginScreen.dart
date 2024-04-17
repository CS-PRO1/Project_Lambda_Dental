import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3_getx/Controller/login_controller.dart';
import 'package:get/get.dart';

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
          return Scaffold(
            //appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.5),
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/login/background.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                      TextFormField(
                                        controller: emailcontroller,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter your email address';
                                          }
                                          return null;
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          label: const Text('Email'),
                                          prefixIcon: const Icon(Icons.mail),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 2.0),
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 3.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
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
                                        height: 30.0,
                                      ),
                                      TextFormField(
                                        controller: passwordcontroller,
                                        obscureText: !controller.showpassword,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter your password';
                                          }
                                          return null;
                                        },
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        onFieldSubmitted: (value) {},
                                        decoration: InputDecoration(
                                          label: const Text('Password'),
                                          prefixIcon: const Icon(
                                              Icons.password_rounded),
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
                                                  BorderRadius.circular(30.0)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 3.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
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
                                          if (formkey.currentState!
                                              .validate()) {
                                            controller.requestLogin(
                                                emailcontroller.text,
                                                passwordcontroller.text);
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          //height: 60,
                                          width: 150,
                                          padding: const EdgeInsets.all(15),
                                          child: const Text(
                                            'Login',
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
                                                Get.toNamed('/reset-password');
                                              },
                                              child: const Text(
                                                'Forgot Password',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )),
                                          TextButton(
                                            onPressed: () {
                                              Get.toNamed('/register');
                                            },
                                            child: const Text(
                                              'Register',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
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
                          const Text(
                            'Login',
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
          );
        });
        
        
  }
}
