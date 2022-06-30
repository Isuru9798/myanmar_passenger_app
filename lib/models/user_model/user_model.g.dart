// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['_id'] as String,
      userFirstName: json['user_first_name'] as String,
      userLastName: json['user_last_name'] as String,
      userImage: json['user_image'] as String,
      userStatus: json['user_status'] as bool,
      userStatusString: json['user_status_string'] as String,
      userAddress: UserAddressModel.fromJson(
          json['user_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'user_first_name': instance.userFirstName,
      'user_last_name': instance.userLastName,
      'user_image': instance.userImage,
      'user_status': instance.userStatus,
      'user_status_string': instance.userStatusString,
      'user_address': instance.userAddress.toJson(),
    };
