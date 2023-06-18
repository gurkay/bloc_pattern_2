import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  final String email;
  final String password;

  LoginModel(this.email, this.password);

  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginModelToJson(this);
  }
}
