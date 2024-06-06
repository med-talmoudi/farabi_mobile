import 'package:flutter_farabi_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class LoginTextBtn extends StatelessWidget {
  const LoginTextBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(bottom: 20.h),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/login',
          );
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Déjà inscrit(e) ",
                style: GoogleFonts.raleway(
                    fontSize: 15.sp,
                  color: ColorManager.dejaInscritTextColor, // Light grey color
                ),
              ),
              TextSpan(
                text: "Se connecter",
                style: GoogleFonts.raleway(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600, // Bold
                    color: ColorManager.seConnecterTextColor // Black color
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
