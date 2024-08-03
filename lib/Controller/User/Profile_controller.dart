import 'package:get/get.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Model/User/ProfileModel.dart';
import 'package:project_lambda_dental/Services/theme/dio.dart';

class ProfileController extends GetxController {
  ProfileModel? profileModel;
  void getProfile() {
    DioHelper.getData('profile', token: CacheHelper.get('token')).then((value) {
      profileModel = ProfileModel.fromJson(value?.data);
      if (value?.data['status']) {
        //TODO Handle response to Model
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
