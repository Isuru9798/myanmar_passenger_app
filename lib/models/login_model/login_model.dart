import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginModel {
  @JsonKey(name: "login_email")
  String loginEmail;
  @JsonKey(name: "login_password")
  String loginPassword;
  @JsonKey(name: "login_mobile")
  String loginMobile;
  @JsonKey(name: "login_type")
  String loginType;

  LoginModel({
    required this.loginEmail,
    required this.loginPassword,
    required this.loginMobile,
    required this.loginType,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
