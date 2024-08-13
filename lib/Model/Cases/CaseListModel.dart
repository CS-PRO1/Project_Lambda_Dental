class CaseListModel {
  final List<CaseSummary> allCases;
  final int status;

  CaseListModel({
    required this.allCases,
    required this.status,
  });

  factory CaseListModel.fromJson(Map<String, dynamic> json) {
    return CaseListModel(
      allCases: (json['All_Cases'] as List<dynamic>)
          .map((e) => CaseSummary.fromJson(e))
          .toList(),
      status: json['status'],
    );
  }
}

class CaseSummary {
  final int id;
  final String patientName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;
  final int confirmDelivery;

  CaseSummary({
    required this.id,
    required this.patientName,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.confirmDelivery,
  });

  factory CaseSummary.fromJson(Map<String, dynamic> json) {
    return CaseSummary(
      id: json['id'],
      patientName: json['patient_name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      status: json['status'],
      confirmDelivery: json['confirm_delivery'],
    );
  }
}
