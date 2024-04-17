import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:flutter_application_3_getx/Cache/CacheHelper.dart';
import 'package:flutter_application_3_getx/Model/LoginModel.dart';
import 'package:flutter_application_3_getx/Services/dio.dart';

class LoginController extends GetxController {
  bool loginsuccess = false;
  bool showpassword = false;
  Icon passeyeicon = Icon(CupertinoIcons.eye_slash_fill);
  LoginModel? loginModel;
  void controlPassword() {
    if (showpassword) {
      showpassword = false;
      passeyeicon = const Icon(CupertinoIcons.eye_slash_fill);
      update();
    } else {
      showpassword = true;
      passeyeicon = const Icon(CupertinoIcons.eye_fill);
      update();
    }
  }

  void requestLogin(String email, String password) {
    DioHelper.postData('login', {'email': email, 'password': password})
        .then((value) {
      loginModel = LoginModel.fromJson(value?.data);
      if (value?.data['status'] == true) {
        CacheHelper.setString('token', loginModel!.data!.token!);
        CacheHelper.setString('password', password);
        Fluttertoast.showToast(msg: loginModel!.message!);
        loginsuccess = true;
        update();
      } else {
        Fluttertoast.showToast(msg: loginModel!.message!);
      }
    }).catchError((error) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }
}
