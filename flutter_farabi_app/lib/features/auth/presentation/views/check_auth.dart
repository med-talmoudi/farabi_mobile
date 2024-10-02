import 'package:flutter/material.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:  Colors.grey[300]!,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              10.vs,
              Stack(
                alignment: Alignment.center,
                children: [
                  // Shimmer Effect Behind the Images
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 340.w,
                      height: 100.h,
                      color: Colors.grey,
                    ),
                  ),
                  // Images on Top of the Shimmer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                SvgPicture.asset(
                    'assets/img/splach_logo.svg',
                   
                  ),

                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: Text(
                  "Powered by Fidness",
                  style: GoogleFonts.raleway(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(66, 56, 56, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
