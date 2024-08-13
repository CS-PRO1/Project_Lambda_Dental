class CaseDetailsModel {
  int? id;
  int? userId;
  String? patientName;
  int? age;
  String? gender;
  bool? needTrial;
  bool? repeat;
  String? notes;
  String? shade;
  String? expectDeliveryTime;
  int? rate;
  bool? status;
  bool? confirmDelivery;
  String? createdAt;
  int? treatmentId;
  int? materialId;
  int? toothNumber;
  bool? bridge;
  List<int>? teethNumber;

  CaseDetailsModel({
    this.id,
    this.userId,
    this.patientName,
    this.age,
    this.gender,
    this.needTrial,
    this.repeat,
    this.notes,
    this.shade,
    this.expectDeliveryTime,
    this.rate,
    this.status,
    this.confirmDelivery,
    this.createdAt,
    this.treatmentId,
    this.materialId,
    this.toothNumber,
    this.bridge,
    this.teethNumber,
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
      expectDeliveryTime: json['expect_delivery_time'],
      rate: json['rate'],
      status: json['status'],
      confirmDelivery: json['confirm_delivery'],
      createdAt: json['created_at'],
      treatmentId: json['treatment_id'],
      materialId: json['material_id'],
      toothNumber: json['tooth_number'],
      bridge: json['bridge'],
      teethNumber: json['teeth_number'] != null ? List<int>.from(json['teeth_number']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'patient_name': patientName,
      'age': age,
      'gender': gender,
      'need_trial': needTrial,
      'repeat': repeat,
      'notes': notes,
      'shade': shade,
      'expect_delivery_time': expectDeliveryTime,
      'rate': rate,
      'status': status,
      'confirm_delivery': confirmDelivery,
      'created_at': createdAt,
      'treatment_id': treatmentId,
      'material_id': materialId,
      'tooth_number': toothNumber,
      'bridge': bridge,
      'teeth_number': teethNumber,
    };
  }
}
