import 'package:flutter/material.dart';
import 'package:info_tech/core/colors_manager.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({super.key, required this.hintText, this.validator, this.controller,required this.onChanged});
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth*0.8,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: TextStyle(
          color: ColorsManager.yellow
        ),
        validator: widget.validator,
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  const BorderSide(width: 2, color:ColorsManager.yellow),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  const BorderSide(width: 2, color: ColorsManager.yellow),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  const BorderSide(width: 2, color: ColorsManager.yellow),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: Colors.red),
          ),
          hintText: widget.hintText,
          filled: true,
          fillColor: ColorsManager.mainAppColor,
          hintStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorsManager.yellow,
          ),
        ),
      ),
    );
  }
}
