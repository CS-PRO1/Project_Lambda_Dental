import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Model/User/LoginModel.dart';
import 'package:project_lambda_dental/Services/theme/dio.dart';
import 'package:project_lambda_dental/shared/component/components.dart';

class AuthController extends GetxController {
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

  void register(
      String fname, String lname, String phone, String email, String password) {
    print(fname);
    print(lname);
    print(phone);
    print(email);
    print(password);
    DioHelper.postData('register_user', {
      'first_name': fname,
      'last_name': lname,
      'phone_number': phone,
      'email': email,
      'password': password
    }).then((value) {
      if (value?.data['status'] == true) {
        loginModel = LoginModel.fromJson(value?.data);
        CacheHelper.setString('token', loginModel!.data!.token!);
        CacheHelper.setString('password', password);
        toast(value?.data['message']);
      } else {
        toast(value?.data['message']);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
  
void forgotpassword(String email) {
    DioHelper.postData('forgot_password', {'email': email})
        .then((value) {
          if (value?.data['status'] == true) {
            // TODO handle response data in Model
          }
        })
        .then((value) {})
        .catchError((error) {
          print(error.toString());
        });
  }

  void resetpassword(String email, String otp, String password) {
    DioHelper.postData('reset_password',
        {'email': email, 'otp': otp, 'password': password}).then((value) {
      if (value?.data['status'] == true) {
        // TODO handle response data in Model
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void emailverification(String email, String otp) {
    DioHelper.postData('email', {'email': email, 'otp': otp}).then((value) {
      if (value?.data['status'] == true) {
        // TODO handle response data in Model
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void logout() {
    DioHelper.getData('logout', token: CacheHelper.get('token')).then((value) {
      CacheHelper.removeString('token').catchError((error) {
        print(error.toString());
      });
    });
  }

}
