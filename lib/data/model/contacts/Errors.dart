class Errors {
  Errors({
      this.message,});

  Errors.fromJson(dynamic json) {
    message = json['message'] != null ? json['message'].cast<String>() : [];
  }
  List<String>? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}