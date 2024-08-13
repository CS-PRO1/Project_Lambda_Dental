class CaseListModel {
  bool? status;
  String? message;
  Data? data;

  CaseListModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data =
        response['All_Cases'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  int? id;
  String? patient_name;
  String? created_at;
  String? updated_at;
  int? case_status;
  bool? confirm_delivary;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patient_name = json['patient_name'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    case_status = json['case_status'];
    confirm_delivary = json['confirm_delivary'];
  }
}
