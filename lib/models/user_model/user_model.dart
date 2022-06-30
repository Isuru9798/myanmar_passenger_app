import 'package:json_annotation/json_annotation.dart';
import './user_address_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'user_first_name')
  String userFirstName;
  @JsonKey(name: 'user_last_name')
  String userLastName;
  @JsonKey(name: 'user_image')
  String userImage;
  @JsonKey(name: 'user_status')
  bool userStatus;
  @JsonKey(name: 'user_status_string')
  String userStatusString;
  @JsonKey(name: 'user_address')
  UserAddressModel userAddress;

  UserModel({
    required this.id,
    required this.userFirstName,
    required this.userLastName,
    required this.userImage,
    required this.userStatus,
    required this.userStatusString,
    required this.userAddress,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
