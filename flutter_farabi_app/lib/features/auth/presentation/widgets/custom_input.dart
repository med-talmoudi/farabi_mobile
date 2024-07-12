

import 'package:flutter_farabi_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String hintText;
  final TextInputAction action;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomInputTextField({
    super.key,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.hintText = "",
    required this.action,
    required this.keyboardType,
    this.inputFormatters,
  });

  @override
  CustomInputTextFieldState createState() => CustomInputTextFieldState();
}

class CustomInputTextFieldState extends State<CustomInputTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.action,
      cursorColor: const Color.fromRGBO(106, 106, 106, 1),
      controller: widget.controller,
      validator: widget.validator,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText ? isObscure : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.lightGray,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: const Color.fromRGBO(106, 106, 106, 1),
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
      ),
    );
  }
}
