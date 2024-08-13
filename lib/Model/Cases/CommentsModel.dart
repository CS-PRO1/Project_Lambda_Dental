class CommentsModel {
  bool? status;
  String? message;
  Data? data;

  CommentsModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['comment'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  int? id;
  int? case_id;
  String? comment;
  String? created_at;
  String? updated_at;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    case_id = json['case_id'];
    comment = json['comment'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }
}
