
class CommentModel {
  CommentModel({
    this.comment,

  });

  CommentModel.fromJson(dynamic json) {
    comment = json['comment'];

  }
  String? comment;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['comment'] = comment;

    return map;
  }

}