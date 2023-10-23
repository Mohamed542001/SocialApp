
class RegisterModel {
  RegisterModel({
      this.name,
      this.email,
      this.phone,
      this.uId,
      this.image,
      this.bio,
      this.isEmailVerification,
  });

  RegisterModel.fromJson(dynamic json) {
    name = json['username'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    bio = json['bio'];
    isEmailVerification = json['isEmailVerification'];
  }
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  String? bio;
  bool? isEmailVerification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['uId'] = uId;
    map['image'] = image;
    map['bio'] = bio;
    map['isEmailVerification'] = isEmailVerification;

    return map;
  }

}