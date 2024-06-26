import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Stack(
                children: [
                  // background image have opacity
                  Container(
                    color: const Color.fromARGB(255, 255, 254, 254),
                    child: Opacity(
                      opacity: 0.06,
                      child: Image(
                        height: 600.h,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        image: const AssetImage("assets/img/woman_image.jpg"),
                      ),
                    ),
                  ),
                  // croped image
                  ClipPath(
                    clipper: NativeClipper(),
                    child: Image(
                      height: 600.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      image: const AssetImage("assets/img/woman_image.jpg"),
                    ),
                  ),
                ],
              ),
            ),
            // row that have logo and text El Farabi
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(
                    "assets/img/el_farabi_logo.png",
                  ),
                  width: 80.w,
                  height: 90.h,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 25.h, left: 5.w),
                    child: Image(
                      image: const AssetImage(
                        "assets/img/el_farabi_text.png",
                      ),
                      width: 140.w,
                      height: 50.h,
                    )),
              ],
            ),

            Column(
              children: [
                Text(
                  "Bienvenue",
                  style: GoogleFonts.raleway(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                10.vs,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Text(
                    "Bienvenue à Para El farabi, où la beauté rencontre la sérénité",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 15.sp,
                      height: 1.5.h,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
                25.vs,
                Container(
                  width: 400.w,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/register',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      minimumSize: Size(double.infinity, 50.h),
                      backgroundColor: const Color.fromRGBO(
                          217, 80, 116, 1), // Background color
                      foregroundColor: Colors.white, // Text color
                      textStyle: GoogleFonts.nunito(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: Text(
                      "Commencer",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                30.vs,
                Text(
                  "Powered by Fidness",
                  style: GoogleFonts.raleway(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(66, 56, 56, 1),
                  ),
                )
              ],
            ),
            15.vs,
          ],
        ),
      ),
    ).animate(delay: const Duration(milliseconds: 500)).fadeIn(
        duration: const Duration(milliseconds: 800), curve: Curves.ease);
  }
}

// class that do the woman image cropping
class NativeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height + 60, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
