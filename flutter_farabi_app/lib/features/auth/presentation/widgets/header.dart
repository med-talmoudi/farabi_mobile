
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theming/colors.dart';

class Header extends StatelessWidget {
   
  final String text;


   const Header({super.key, 
  
     required this.text,
  });

  @override
  Widget build(BuildContext context) {  
    return Text(
       text,
      style: GoogleFonts.raleway(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: ColorManager.darkGrey,
      ),
    );
  }
}
