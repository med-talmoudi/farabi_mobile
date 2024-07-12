
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final InputBorder? focusedBorder;
  final TextInputType textInputType;
  final LengthLimitingTextInputFormatter lengthLimitingTextInputFormatter;
  final String hintText;
  final int? minLength;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.textInputType,
    required this.lengthLimitingTextInputFormatter,
    required this.hintText,
    this.minLength,
    this.maxLength,
    this.focusedBorder
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
       
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: textInputType,
      
      inputFormatters: [
        lengthLimitingTextInputFormatter,
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      decoration: InputDecoration(

        

        filled: true,
        fillColor: const Color.fromRGBO(247, 247, 249, 1),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
