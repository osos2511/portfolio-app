import 'package:flutter/material.dart';

import '../../../../core/colors_manager.dart';

class TextFormFieldWidget extends StatefulWidget {
  TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.isSecure = false,
  });

  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isSecure;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late bool _obSecureText;

  @override
  void initState() {
    super.initState();
    _obSecureText = widget.isSecure;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        validator: widget.validator,
        controller: widget.controller,
        obscureText: _obSecureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: ColorsManager.yellow),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: ColorsManager.yellow),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: ColorsManager.yellow),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: ColorsManager.yellow),
          ),
          hintText: widget.hintText,
          errorStyle: TextStyle(
            color: ColorsManager.yellow
          ),
          //filled: true,
          //fillColor: Colors.white,
          hintStyle:  TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: ColorsManager.white,
          ),
          suffixIcon: widget.isSecure
              ? IconButton(
            icon: Icon(
              _obSecureText ? Icons.visibility_off : Icons.visibility,color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _obSecureText = !_obSecureText;
              });
            },
          )
              : null,
        ),
      ),
    );
  }
}
