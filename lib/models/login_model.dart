class LoginModel {
  LoginModel({
    required this.loginEmail,
    required this.loginPassword,
  });

  late final String loginEmail;
  late final String loginPassword;

  LoginModel.fromJson(Map<String, dynamic> json) {
    loginEmail = json['login_email'];
    loginPassword = json['login_password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['login_email'] = loginEmail;
    _data['login_password'] = loginPassword;
    return _data;
  }
}
