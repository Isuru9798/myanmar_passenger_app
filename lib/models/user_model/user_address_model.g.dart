// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddressModel _$UserAddressModelFromJson(Map<String, dynamic> json) =>
    UserAddressModel(
      addressLine1: json['address_line_1'] as String,
      addressLine2: json['address_line_2'] as String,
      district: json['district'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$UserAddressModelToJson(UserAddressModel instance) =>
    <String, dynamic>{
      'address_line_1': instance.addressLine1,
      'address_line_2': instance.addressLine2,
      'district': instance.district,
      'city': instance.city,
    };
