// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      loginEmail: json['login_email'] as String,
      loginPassword: json['login_password'] as String,
      loginMobile: json['login_mobile'] as String,
      loginType: json['login_type'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'login_email': instance.loginEmail,
      'login_password': instance.loginPassword,
      'login_mobile': instance.loginMobile,
      'login_type': instance.loginType,
    };
