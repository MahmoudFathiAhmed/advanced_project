
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

}

@JsonSerializable()
class CustomerResponse{
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;

  CustomerResponse(this.id, this.name, this.numOfNotifications);
  //from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) => _$CustomerResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse{
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;

  ContactsResponse(this.phone, this.email, this.link);
  //from json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) => _$ContactsResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer, this.contacts);

  /*
  * in terminal implement this command
  * flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
  * then add this line
  * part 'responses.g.dart';
  * re-implement command
  * flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
  * */

  //from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) => _$AuthenticationResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse{
  @JsonKey(name: "support")
  String? support;

  ForgotPasswordResponse(this.support);

  //from json
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);

}


@JsonSerializable()
class ServicesResponse{
    @JsonKey(name: "id")
    int? id;

    @JsonKey(name: "title")
    String? title;

    @JsonKey(name: "image")
    String? image;

    ServicesResponse(this.id, this.title, this.image);

    //from json
    factory ServicesResponse.fromJson(Map<String, dynamic> json) => _$ServicesResponseFromJson(json);
    //to json
    Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
}


@JsonSerializable()
class BannersResponse{
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "link")
  String? link;

  BannersResponse(this.id, this.title, this.image, this.link);

  //from json
  factory BannersResponse.fromJson(Map<String, dynamic> json) => _$BannersResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$BannersResponseToJson(this);
}

@JsonSerializable()
class StoreResponse{
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "image")
  String? image;

  StoreResponse(this.id, this.title, this.image);

  //from json
  factory StoreResponse.fromJson(Map<String, dynamic> json) => _$StoreResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$StoreResponseToJson(this);
}


@JsonSerializable()
class HomeDataResponse{
  @JsonKey(name: "services")
  List<ServicesResponse>? services;

  @JsonKey(name: "banners")
  List<BannersResponse>? banners;

  @JsonKey(name: "stores")
  List<StoreResponse>? stores;

  HomeDataResponse(this.services, this.banners, this.stores);

  //from json
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) => _$HomeDataResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);
}

@JsonSerializable()
class HomeResponse extends BaseResponse{
  @JsonKey(name: "data")
  HomeDataResponse? data;


  HomeResponse(this.data);

  //from json
  factory HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);

}