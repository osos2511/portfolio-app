import 'Errors.dart';
import 'User.dart';

class ContactUsResponse {
  String? status;
  String? message;
  Errors? errors;
  User? user;
  ContactUsResponse({
    this.status,
    this.message,
    this.errors,
    this.user,
  });

  ContactUsResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    user = json['contact'] != null ? User.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    if (user != null) {
      map['contact'] = user?.toJson();
    }
    return map;
  }
}
