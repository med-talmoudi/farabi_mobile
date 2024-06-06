// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/welcome');
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               10.vs,
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      "assets/img/el_farabi_logo.png",
                    ),
                    width: 140.w,
                    height: 100.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: Image(
                      image: AssetImage(
                        "assets/img/el_farabi_text.png",
                      ),
                      width: 200.w,
                      height: 50.h,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 40.h),
                child: Text(
                  "Powered by Fidness",
                  style: GoogleFonts.raleway(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(66, 56, 56, 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
