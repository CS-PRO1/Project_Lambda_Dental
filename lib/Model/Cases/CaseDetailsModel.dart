class CaseDetailsResponse {
  List<CaseDetail>? caseDetails;
  int? status;

  CaseDetailsResponse({this.caseDetails, this.status});

  CaseDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json['case_details'] != null) {
      caseDetails = <CaseDetail>[];
      json['case_details'].forEach((v) {
        caseDetails!.add(CaseDetail.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (caseDetails != null) {
      data['case_details'] = caseDetails!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class CaseDetail {
  int? id;
  int? userId;
  String? patientName;
  int? age;
  String? gender;
  int? needTrial;
  int? repeate;
  String? notes;
  String? shade;
  String? expectDeliveryTime;
  dynamic rate;
  int? status;
  int? confirmDelivery;
  String? createdAt;
  String? updatedAt;
  int? treatmentId;
  int? materialId;
  String? toothNumber;
  int? bridge;
  String? teethNumber;

  CaseDetail(
      {this.id,
      this.userId,
      this.patientName,
      this.age,
      this.gender,
      this.needTrial,
      this.repeate,
      this.notes,
      this.shade,
      this.expectDeliveryTime,
      this.rate,
      this.status,
      this.confirmDelivery,
      this.createdAt,
      this.updatedAt,
      this.treatmentId,
      this.materialId,
      this.toothNumber,
      this.bridge,
      this.teethNumber});

  CaseDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    patientName = json['patient_name'];
    age = json['age'];
    gender = json['gender'];
    needTrial = json['need_trial'];
    repeate = json['repeate'];
    notes = json['notes'];
    shade = json['shade'];
    expectDeliveryTime = json['expect_delivery_time'];
    rate = json['rate'];
    status = json['status'];
    confirmDelivery = json['confirm_delivery'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    treatmentId = json['treatment_id'];
    materialId = json['material_id'];
    toothNumber = json['tooth_number'];
    bridge = json['bridge'];
    teethNumber = json['teeth_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['patient_name'] = patientName;
    data['age'] = age;
    data['gender'] = gender;
    data['need_trial'] = needTrial;
    data['repeate'] = repeate;
    data['notes'] = notes;
    data['shade'] = shade;
    data['expect_delivery_time'] = expectDeliveryTime;
    data['rate'] = rate;
    data['status'] = status;
    data['confirm_delivery'] = confirmDelivery;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['treatment_id'] = treatmentId;
    data['material_id'] = materialId;
    data['tooth_number'] = toothNumber;
    data['bridge'] = bridge;
    data['teeth_number'] = teethNumber;
    return data;
  }
}
