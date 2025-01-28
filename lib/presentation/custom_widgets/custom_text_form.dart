import 'package:flutter/material.dart';
import 'package:info_tech/core/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final String? labelText;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(color: ColorsManager.white), // Text color
      decoration: InputDecoration(
        hintStyle: TextStyle(color: ColorsManager.white), // Hint text color
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: ColorsManager.white), // Label text color
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: ColorsManager.white) : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.white), // Default border color (white)
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.yellow, width: 2), // Focused border color (yellow)
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
