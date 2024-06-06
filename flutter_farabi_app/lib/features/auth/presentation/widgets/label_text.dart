import 'package:flutter_farabi_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelText extends StatelessWidget {
    final String text;


   const LabelText({super.key, 
  
     required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.raleway(
        color: ColorManager.darkGrey,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
