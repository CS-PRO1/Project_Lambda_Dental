class CommentsModel {
  int? status;
  String message = '';
  List<Comment> data = [];

  CommentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['All Comments'].forEach((element) {
      data.add(Comment.fromJson(element));
    });
  }
}

class Comment {
  int? id;
  int? case_id;
  String? comment;
  String? created_at;
  String? updated_at;



  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    case_id = json['id'] ?? 0;
    comment = json['comment'] ?? '';
    created_at = json['created_at'] ?? '';
    updated_at = json['updated_at'] ?? '';
  }
}
