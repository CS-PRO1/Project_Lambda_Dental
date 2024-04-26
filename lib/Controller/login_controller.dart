import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Model/LoginModel.dart';
import 'package:project_lambda_dental/Services/theme/dio.dart';

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

  void allow_notifications() {
    //TODO: Add this later to settings
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  void triggerNotifications() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: 'Al_Hamwi Lab',
            body: 'Your case is Ready!'));
  }
}
