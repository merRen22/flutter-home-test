import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.email,
    required this.name,
    required this.password,
    required this.jobTitle,
  });

  /// Email field
  final String email;

  /// Name field
  final String name;

  /// Password field
  final String password;

  /// Job title field
  final String jobTitle;

  /// Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Method to convert User to JSON
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
