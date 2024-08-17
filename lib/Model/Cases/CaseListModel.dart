class CaseListModel {
  int? status;
  List<Case> data = [];

  CaseListModel.fromJson(Map<String, dynamic> json) {
    json['All_Cases'].forEach((element) {
      data.add(Case.fromJson(element));
    });
  }
}

class Case {
  int? id = 0;
  String? patient_name = '';
 String? created_at = DateTime.now().toString();
  String? updated_at = DateTime.now().toString();
  int? status = 0;
  int? confirm_delivery = 9;
  Case.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    patient_name = json['patient_name'] ?? '';
    created_at = json['created_at'] ?? DateTime.now().toString();
    updated_at = json['updated_at'] ?? DateTime.now().toString();
    status = json['status'] ?? 0;
    confirm_delivery = json['confirm_delivery'] ?? 0;
  }
}
