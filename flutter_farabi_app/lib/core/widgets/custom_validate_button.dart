import 'package:flutter_farabi_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomValidateButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomValidateButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize:  Size(double.infinity, 50.h),
        backgroundColor: ColorManager.lightPink, // Background color
        foregroundColor: ColorManager.white,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.raleway(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
