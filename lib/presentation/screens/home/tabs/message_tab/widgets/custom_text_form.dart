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
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(color: ColorsManager.white),
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: ColorsManager.white),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: ColorsManager.white),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: ColorsManager.white) : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.yellow, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
