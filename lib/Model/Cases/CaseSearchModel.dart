class CaseSearchModel {
  String patient_name = '';
  int age = 0;
  String gender = '';
  int confirm_delivery = 0;
  int status = 0;
  CaseSearchModel.fromJson(Map<String, dynamic> json) {
      Map<String, dynamic> data = json['case'];

    patient_name = data["patient_name"];
    gender = data["gender"];
    age = data["age"];
    confirm_delivery = data["confirm_delivery"];
    status = data["status"];
  }
}
