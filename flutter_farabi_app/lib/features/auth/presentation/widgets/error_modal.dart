import 'dart:ui';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomErrorModal extends StatelessWidget {
  const CustomErrorModal({
    super.key,
    this.message,
    this.btnText,
    required this.onPressed,
  });

  final String? message;
  final String? btnText;
  final VoidCallback onPressed;

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                   Image(
                    image: const AssetImage("assets/img/ohno.png"),
                    width: 250.w,
                    height: 180.h,
                  ).animate().fadeIn(duration: const Duration(milliseconds: 800)),
                  Text(
                    "Oh non!",
                    style: GoogleFonts.raleway(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(74, 74, 74, 1),
                    ),
                  ).animate(delay: const Duration(milliseconds: 600)).shake(),
                  15.vs,
                  Text(
                    message ?? '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(74, 74, 74, 1),
                    ),
                  ),
                  20.vs,
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      minimumSize:  Size(double.infinity, 50.h),
                      backgroundColor: const Color.fromRGBO(217, 80, 116, 1),
                      foregroundColor: Colors.white,
                      textStyle: GoogleFonts.raleway(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: Text(
                      btnText ?? 'Réessayer',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  30.vs
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Return an empty container or any other widget if you need to display something initially
    return Container();
  }
}

// Usage
// Wherever you need to show the bottom sheet, you can call `CustomErrorModal().show(context);`
// For example, from a button press:


