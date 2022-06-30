import 'package:json_annotation/json_annotation.dart';

part 'user_address_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserAddressModel {
  @JsonKey(name: 'address_line_1')
  String addressLine1;
  @JsonKey(name: 'address_line_2')
  String addressLine2;
  String district;
  String city;

  UserAddressModel({
    required this.addressLine1,
    required this.addressLine2,
    required this.district,
    required this.city,
  });

  factory UserAddressModel.fromJson(Map<String, dynamic> json) =>
      _$UserAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressModelToJson(this);
}
