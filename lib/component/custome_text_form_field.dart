import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeTextFormField extends StatelessWidget {
  CustomeTextFormField.CustomeTextformField(
      {this.obscureText = false,
      this.hintText,
      this.onSaved,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.textColor = Colors.white,
      this.controller,
      this.bordercolor = Colors.white});

  String? hintText;
  String? Function(String?)? validator;
  Function(String)? onSaved;
  bool obscureText;
  IconButton? prefixIcon;
  IconButton? suffixIcon;
  Color bordercolor;
  Color? textColor;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return validator != null ? validator!(value) : null;
        },
        onChanged: onSaved,
        style: TextStyle(
          color: textColor,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText ?? '',
          hintStyle: TextStyle(
            color: textColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordercolor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
