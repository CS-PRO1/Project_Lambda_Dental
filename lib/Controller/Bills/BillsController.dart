import 'package:get/get.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Model/Bills/BillDetailsModel.dart';
import 'package:project_lambda_dental/Model/Bills/BillsListModel.dart';
import 'package:project_lambda_dental/Services/dio.dart';

class BillsController extends GetxController {
  BillsListModel? billsListModel;
  void getAllBills() {
    String token = CacheHelper.get('token');
    DioHelper.getData('all_bills', token: token).then((value) {
      billsListModel = BillsListModel.fromJson(value?.data);
      update();
    }).catchError((error) {
      print(error.toString());
    });
  }

  BillsListModel? searchbillsListModel;
  void searchBill(DateTime start, DateTime end) {
    String token = CacheHelper.get('token');
    print(
      start.toString().substring(0, 10),
    );
    print(end);
    DioHelper.postData(
            'search_bills',
            {
              'start_date': start.toString().substring(0, 10),
              'end_date': end.toString().substring(0, 10)
            },
            token: token)
        .then((value) {
      print(value?.data);
      searchbillsListModel = BillsListModel.fromJson(value?.data);
      update();
    }).catchError((error) {
      print(error.toString());
    });
  }

  BillDetailsModel? billDetailsModel;
  void getBillDetails() {
    //TODO
  }
}
