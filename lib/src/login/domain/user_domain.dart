class AppUser {
  String? email;
  String? password;

  AppUser({
    required this.email,
    required this.password,
  });

  AppUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.email;

    return data;
  }
}
