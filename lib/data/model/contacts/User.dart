class User {
  final String firstname;
  final String lastname;
  final String mobile;
  final String address;
  final String email;
  final String title;
  final String message;

  User({
    required this.firstname,
    required this.lastname,
    required this.mobile,
    required this.address,
    required this.email,
    required this.title,
    required this.message,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      mobile: json['mobile'] ?? '',
      address: json['address'] ?? '',
      email: json['email'] ?? '',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'mobile': mobile,
      'address': address,
      'email': email,
      'title': title,
      'message': message,
    };
  }
}
