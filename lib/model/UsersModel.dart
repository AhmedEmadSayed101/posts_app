// ignore_for_file: file_names

class User {
  final int id;
  final String userName;
  final String account;
  final String password;
  final String image;

  User({
    required this.id,
    required this.userName,
    required this.account,
    required this.password,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
      account: json['account'],
      password: json['password'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'account': account,
      'password': password,
      'image': image,
    };
  }
}
