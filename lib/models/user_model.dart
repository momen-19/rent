class UserModel {
  late String uId;
  late String name;
  late String? email;
  late String phone;
  late String image;
  late bool role;

  UserModel({
     required this.uId,
     required this.name,
     required this.email,
     required this.phone,
     required this.image,
    this.role = false,
  });

  UserModel.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    uId = map['uId'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    image = map['image'];
    role = map['role'];
  }

  toJson(){
    return {
      'uId' : uId,
      'name' : name,
      'email' : email,
      'phone' : phone,
      'image' : image,
      'role' : role,
    };
  }
}
