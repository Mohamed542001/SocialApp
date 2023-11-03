
class MessageModel {
  MessageModel({
    this.senderId,
    this.receiverId,
    this.dateTime,
    this.text,

  });

  MessageModel.fromJson(dynamic json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = json['dateTime'];
    text = json['text'];

  }
  String? senderId;
  String? receiverId;
  String? dateTime;
  String? text;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['senderId'] = senderId;
    map['receiverId'] = receiverId;
    map['dateTime'] = dateTime;
    map['text'] = text;

    return map;
  }

}