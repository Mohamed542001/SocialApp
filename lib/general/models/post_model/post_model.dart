
class PostModel {
  PostModel({
    this.name,
    this.uId,
    this.image,
    this.text,
    this.dateTime,
    this.postImage,
  });

  PostModel.fromJson(dynamic json) {
    name = json['username'];
    dateTime = json['dateTime'];
    text = json['text'];
    uId = json['uId'];
    image = json['image'];
    postImage = json['postImage'];
  }
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? text;
  String? postImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = name;
    map['postImage'] = postImage;
    map['dateTime'] = dateTime;
    map['uId'] = uId;
    map['image'] = image;
    map['text'] = text;

    return map;
  }

}