import 'package:get/get.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Model/Bills/BillDetailsModel.dart';
import 'package:project_lambda_dental/Model/Bills/BillsListModel.dart';
import 'package:project_lambda_dental/Services/theme/dio.dart';

class BillsController extends GetxController {
  BillsListModel? billsListModel;
  void getAllBills() {
    String token = CacheHelper.get('token');
    DioHelper.getData('all_bills', token: token).then((value) {
      if (value?.data['status']) {
        billsListModel = BillsListModel.fromJson(value?.data);
      }
      {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void searchBill(DateTime start, DateTime end) {
    String token = CacheHelper.get('token');
    DioHelper.postData('search_bills', {'start_date': start, 'end_date': end},
            token: token)
        .then((value) {
      if (value?.data['status']) {
        //TODO handle response
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  BillDetailsModel? billDetailsModel;
  void getBillDetails() {
    //TODO
  }
}
