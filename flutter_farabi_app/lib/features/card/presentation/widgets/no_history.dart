import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';



class NoHistoryWidget extends StatelessWidget {
  const   NoHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
     
      SvgPicture.asset(
        'assets/img/no_history_image.svg',
        width: 226.w,
        height: 120.h,
        fit: BoxFit.contain,
      ).animate(delay: const Duration(milliseconds: 400))
                        .fadeIn(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease).moveX(begin: -10.w, end: 0),
      Text(
        "Pas d’historique d'achat",
        style: GoogleFonts.raleway(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: const Color.fromRGBO(74, 74, 74, 1),
        ),
      ).animate(delay: const Duration(milliseconds: 400))
                        .fadeIn(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease).moveX(begin: -10.w, end: 0),
      Text(
        "Voir les dernières offres",
        style: GoogleFonts.raleway(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(74, 74, 74, 1),
        ),
      ).animate(delay: const Duration(milliseconds: 400))
                        .fadeIn(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease).moveX(begin: -10.w, end: 0),
    ]);
  }
}
