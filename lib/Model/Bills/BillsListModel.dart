class BillsListModel {
  String? message = '';
  List<Bill> data = [];

  BillsListModel.fromJson(Map<String, dynamic> json) {
    json['Bills'].forEach((element) {
      data.add(Bill.fromJson(element));
    });
  }
}

class Bill {
  int? case_id;
  String? patient_name;
  int? total_price;
  String? created_at;

  Bill.fromJson(Map<String, dynamic> json) {
    case_id = json['case_id'];
    patient_name = json['patient_name'];
    total_price = json['total_price'];
    created_at = json['created_at'];
  }
}
