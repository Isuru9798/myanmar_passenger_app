class LoginResModel {
  LoginResModel({
    required this.status,
    required this.message,
    required this.token,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final String token;
  late final Data data;

  LoginResModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    token = json['token'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['token'] = token;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.userAddress,
    required this.id,
    required this.userFirstName,
    required this.userLastName,
    required this.userImage,
    required this.userStatus,
    required this.userStatusString,
  });
  late final UserAddress userAddress;
  late final String id;
  late final String userFirstName;
  late final String userLastName;
  late final String userImage;
  late final bool userStatus;
  late final String userStatusString;

  Data.fromJson(Map<String, dynamic> json){
    userAddress = UserAddress.fromJson(json['user_address']);
    id = json['_id'];
    userFirstName = json['user_first_name'];
    userLastName = json['user_last_name'];
    userImage = json['user_image'];
    userStatus = json['user_status'];
    userStatusString = json['user_status_string'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_address'] = userAddress.toJson();
    _data['_id'] = id;
    _data['user_first_name'] = userFirstName;
    _data['user_last_name'] = userLastName;
    _data['user_image'] = userImage;
    _data['user_status'] = userStatus;
    _data['user_status_string'] = userStatusString;
    return _data;
  }
}

class UserAddress {
  UserAddress({
    required this.addressLine_1,
    required this.addressLine_2,
    required this.district,
    required this.city,
  });
  late final String addressLine_1;
  late final String addressLine_2;
  late final String district;
  late final String city;

  UserAddress.fromJson(Map<String, dynamic> json){
    addressLine_1 = json['address_line_1'];
    addressLine_2 = json['address_line_2'];
    district = json['district'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address_line_1'] = addressLine_1;
    _data['address_line_2'] = addressLine_2;
    _data['district'] = district;
    _data['city'] = city;
    return _data;
  }
}