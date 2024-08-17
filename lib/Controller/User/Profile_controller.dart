import 'package:get/get.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Model/User/ProfileModel.dart';
import 'package:project_lambda_dental/Services/dio.dart';
import 'package:project_lambda_dental/shared/component/components.dart';

class ProfileController extends GetxController {
  ProfileModel? profileModel;
  void getProfile() {
    var token = CacheHelper.get('token');
    DioHelper.getData('profile_user', token: token)
        .then((value) {
      //profileModel = ProfileModel.fromJson(value?.data);
      if (value?.data != null) {
        profileModel = ProfileModel.fromJson(value?.data);
        //toast(profileModel!.firstName);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void updateProfile(String fname, String lname, String phone) {
    String token = CacheHelper.get('token');
    DioHelper.postData('update_profile',
            {'first_name': fname, 'last_name': lname, 'phone_number': phone},
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        //TODO Handle response to Model
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
