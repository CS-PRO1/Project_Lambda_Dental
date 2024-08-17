class BillDetailsModel {
  bool? status;
  String? message;
  Data? data;

  BillDetailsModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['Bills'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  int? case_id;
  String? patient_name;
  int? total_price;
  String? created_at;

  Data.fromJson(Map<String, dynamic> json) {
    case_id = json['id'];
    patient_name = json['patient_name'];
    total_price = json['total_price'];
    created_at = json['created_at'];
  }
}
