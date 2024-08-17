import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Model/Cases/CaseDetailsModel.dart';
import 'package:project_lambda_dental/Model/Cases/CaseListModel.dart';
import 'package:project_lambda_dental/Model/Cases/CommentsModel.dart';
import 'package:project_lambda_dental/Services/dio.dart';
import 'package:project_lambda_dental/shared/component/components.dart';

class CasesController extends GetxController {
  CaseListModel? caseListModel;
  void getAllCases() {
    print('Getting cases');
    String token = CacheHelper.get('token');
    DioHelper.getData('all_cases', token: token).then((value) {
      caseListModel = CaseListModel.fromJson(value?.data);
      print(caseListModel.toString());
      update();
    }).catchError((error) {
      print('error: ' + error.toString());
    });
    //update();
  }

  CaseDetailsResponse? caseDetailsModel;
  void getCaseDetails(int case_id) {
    String token = CacheHelper.get('token');
    DioHelper.postData('case_details', {'case_id': case_id}, token: token).then(
      (value) {
        caseDetailsModel = CaseDetailsResponse.fromJson(value?.data);
        update();
      },
    ).catchError((error) {
      toast(commentsModel!.message);
    });
    //update();
  }

  void searchCase(String pname) {
    String token = CacheHelper.get('token');
    DioHelper.postData('case_details', {'patient_name': pname}, token: token)
        .then(
      (value) {
        if (value?.data['status']) {
          caseDetailsModel = CaseDetailsResponse.fromJson(value?.data);
        }
      },
    ).catchError((error) {
      toast(commentsModel!.message);
    });
  }

  var patientName = ''.obs;
  var age = 0.obs;
  var gender = 'male'.obs;
  var needTrial = false.obs;
  var repeat = false.obs;
  var notes = ''.obs;
  var shade = 'A1'.obs;
  var expectedDeliveryDate = DateTime.now().obs;
  var images = <File>[].obs;

  void pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        images.add(File(pickedFile.path));
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void setDate(DateTime date) {
    expectedDeliveryDate.value = date;
  }

  void addCase(var data) {
    String token = CacheHelper.get('token');
    print(data.toString());
    DioHelper.postData('add_case', data, token: token).then((value) {
      print('sent data success');
      print(value?.data['message']);
    }).catchError((error) {
      print(error.toString());
    });
  }

  CommentsModel? commentsModel;

  void getComments() {
    String token = CacheHelper.get('token');
    print('getting comments');
    DioHelper.getData('all_comments', token: token).then((value) {
      print(value?.statusCode);
      print(value?.statusMessage);
      commentsModel = CommentsModel.fromJson(value?.data);
      update();
      print('got comments');
    }).catchError((error) {
      print(error.toString());
    });
      update();
  }

  void addComment(int case_id, String comment) {
    String token = CacheHelper.get('token');
    DioHelper.postData('add_comment', {'case_id': case_id, 'comment': comment},
            token: token)
        .then(
      (value) {
        if (value?.data['status']) {
          commentsModel = CommentsModel.fromJson(value?.data);
          toast(commentsModel!.message);
        }
      },
    ).catchError((error) {
      toast(commentsModel!.message);
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
          commentsModel = CommentsModel.fromJson(value?.data);
          toast(commentsModel!.message);
        }
      },
    ).catchError((error) {
      toast(commentsModel!.message);
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
          commentsModel = CommentsModel.fromJson(value?.data);
          toast(commentsModel!.message);
        }
      },
    ).catchError((error) {
      toast(commentsModel!.message);
    });
  }
}
