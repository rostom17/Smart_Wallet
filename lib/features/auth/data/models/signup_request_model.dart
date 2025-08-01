class SignupRequestModel {
  final String email;
  final String password;
  final String userName;

  SignupRequestModel({
    required this.email,
    required this.password,
    required this.userName,
  });

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password, "fullName": userName};
  }
}
