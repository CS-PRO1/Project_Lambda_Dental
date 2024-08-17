class CommentsModel {
  final String message;
  final List<Comment> comments;
  final int status;

  CommentsModel({
    required this.message,
    required this.comments,
    required this.status,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) {
    return CommentsModel(
      message: json['message'],
      comments: (json['comment'] as List<dynamic>)
          .map((e) => Comment.fromJson(e))
          .toList(),
      status: json['status'],
    );
  }
}

class Comment {
  final int id;
  final int caseId;
  final String comment;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comment({
    required this.id,
    required this.caseId,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      caseId: json['case_id'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
