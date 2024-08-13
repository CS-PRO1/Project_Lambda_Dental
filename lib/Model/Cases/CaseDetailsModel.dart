class CaseDetailsModel {
  final int id;
  final int userId;
  final String patientName;
  final int age;
  final String gender;
  final bool needTrial;
  final bool repeat;
  final String notes;
  final String shade;
  final DateTime expectDeliveryTime;
  final dynamic rate;
  final bool status;
  final bool confirmDelivery;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int treatmentId;
  final int materialId;
  final int toothNumber;
  final int bridge;
  final List<int> teethNumber;

  CaseDetailsModel({
    required this.id,
    required this.userId,
    required this.patientName,
    required this.age,
    required this.gender,
    required this.needTrial,
    required this.repeat,
    required this.notes,
    required this.shade,
    required this.expectDeliveryTime,
    this.rate,
    required this.status,
    required this.confirmDelivery,
    required this.createdAt,
    required this.updatedAt,
    required this.treatmentId,
    required this.materialId,
    required this.toothNumber,
    required this.bridge,
    required this.teethNumber,
  });

  factory CaseDetailsModel.fromJson(Map<String, dynamic> json) {
    return CaseDetailsModel(
      id: json['id'],
      userId: json['user_id'],
      patientName: json['patient_name'],
      age: json['age'],
      gender: json['gender'],
      needTrial: json['need_trial'],
      repeat: json['repeat'],
      notes: json['notes'],
      shade: json['shade'],
      expectDeliveryTime: DateTime.parse(json['expect_delivery_time']),
      rate: json['rate'],
      status: json['status'],
      confirmDelivery: json['confirm_delivery'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      treatmentId: json['treatment_id'],
      materialId: json['material_id'],
      toothNumber: json['tooth_number'],
      bridge: json['bridge'],
      teethNumber:
          (json['teeth_number'] as List<dynamic>).map((e) => e as int).toList(),
    );
  }
}

class CaseResponse {
  final List<CaseDetailsModel> caseDetails;
  final List<String> image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;

  CaseResponse({
    required this.caseDetails,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory CaseResponse.fromJson(Map<String, dynamic> json) {
    return CaseResponse(
      caseDetails: (json['case_details'] as List<dynamic>)
          .map((e) => CaseDetailsModel.fromJson(e))
          .toList(),
      image: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      status: json['status'],
    );
  }
}
