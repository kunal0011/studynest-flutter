import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;
  // OR mobile/otp if applicable
  final String? mobile;
  final String? otp;

  LoginRequest({
    this.email = '',
    this.password = '',
    this.mobile,
    this.otp,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
