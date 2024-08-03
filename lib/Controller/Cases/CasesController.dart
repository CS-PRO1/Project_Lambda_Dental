import 'dart:io';

import 'package:get/get.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Services/theme/dio.dart';

class CasesController extends GetxController {
  void getAllCases() {
    String token = CacheHelper.get('token');
    DioHelper.getData('all_cases', token: token).then((value) {
      if (value?.data['status']) {
// TODO handle data
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void getCaseDetails(int case_id) {
    String token = CacheHelper.get('token');
    DioHelper.postData('case_details', {'case_id': case_id}, token: token).then(
      (value) {
        if (value?.data['status']) {
          //TODO handle data
        }
      },
    ).catchError((error) {
      print(error.toString());
    });
  }

  void searchCase(String pname) {
    String token = CacheHelper.get('token');
    DioHelper.postData('case_details', {'patient_name': pname}, token: token)
        .then(
      (value) {
        if (value?.data['status']) {
          //TODO handle data
        }
      },
    ).catchError((error) {
      print(error.toString());
    });
  }

  void addCase(String pname, int age, String gender, bool nt, bool re,
      String note, String shade, DateTime date, Set<File> images) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'add_case',
            {
              'patient_name': pname,
              'age': age,
              'gender': gender,
              'need_trial': nt,
              'repeat': re,
              'notes': note,
              'shade': shade,
              'expect_delivery_time': date,
              'images': images,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void getComments() {
    String token = CacheHelper.get('token');
    DioHelper.getData('all_comments', token: token).then((value) {
      if (value?.data['status']) {
// TODO handle data
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void addComment(int case_id, String comment) {
    String token = CacheHelper.get('token');
    DioHelper.postData('add_comment', {'case_id': case_id, 'comment': comment},
            token: token)
        .then(
      (value) {
        if (value?.data['status']) {
          //TODO handle data
        }
      },
    ).catchError((error) {
      print(error.toString());
    });
  }

  void updateComment(int case_id, int comment_id, String newcomment) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'update_comment',
            {
              'case_id': case_id,
              'comment_id': comment_id,
              'comment': newcomment
            },
            token: token)
        .then(
      (value) {
        if (value?.data['status']) {
          //TODO handle data
        }
      },
    ).catchError((error) {
      print(error.toString());
    });
  }

  void deleteComment(int case_id, int comment_id) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'delete_comment', {'case_id': case_id, 'comment_id': comment_id},
            token: token)
        .then(
      (value) {
        if (value?.data['status']) {
          //TODO handle data
        }
      },
    ).catchError((error) {
      print(error.toString());
    });
  }
}
