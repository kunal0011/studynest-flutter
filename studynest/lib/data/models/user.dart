import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String name;
  final String email;
  final String? mobile;
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.mobile,
    this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
