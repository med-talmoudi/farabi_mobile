import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NoJackpotHistory extends StatelessWidget {
  const NoJackpotHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/img/no_history_image.svg',
          width: 226.w,
          height: 120.h,
          fit: BoxFit.contain,
        ).animate(delay: const Duration(milliseconds: 400)).fadeIn(
            duration: const Duration(milliseconds: 200), curve: Curves.ease),
        Text(
          "Pas d’historique de conversion",
          style: GoogleFonts.raleway(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(74, 74, 74, 1),
          ),
        ).animate(delay: const Duration(milliseconds: 400)).fadeIn(
            duration: const Duration(milliseconds: 200), curve: Curves.ease),
        Text(
          "Voir les dernières offres",
          style: GoogleFonts.raleway(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(74, 74, 74, 1),
          ),
        ).animate(delay: const Duration(milliseconds: 400)).fadeIn(
            duration: const Duration(milliseconds: 200), curve: Curves.ease),
      ],
    );
  }
}
