import 'package:flutter/material.dart';

import '../data/model/contacts/User.dart';

class ContactUsProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void setUserData(User userData) {
    firstNameController.text = userData.firstname ?? '';
    lastNameController.text = userData.lastname ?? '';
    mobileController.text = userData.mobile ?? '';
    addressController.text = userData.address ?? '';
    emailController.text = userData.email ?? '';
    titleController.text = userData.title ?? '';
    messageController.text = userData.message ?? '';
    notifyListeners();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    addressController.dispose();
    emailController.dispose();
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }
}
