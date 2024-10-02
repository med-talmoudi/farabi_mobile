import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../core/widgets/bottom_nav_bar.dart';

import '../../../../core/widgets/custom_side_drawer.dart';
import '../../../auth/presentation/widgets/header.dart';

import '../../../auth/presentation/widgets/sub_header.dart';

class Sponsorship extends StatefulWidget {
  const Sponsorship({super.key});

  @override
  State<Sponsorship> createState() => _SponsorshipState();
}

class _SponsorshipState extends State<Sponsorship> {
  bool isObscure = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
          appBar:  AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
            leading:  const CustomSideDrawer(),
            
            
            actions: [
            Padding(
              padding:  EdgeInsets.only(top: 8.h),
              child: Center(
                child: Container(
                  width: 80.0.w, 
                  height: 80.0.h, 
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, 
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add, 
                      color: Colors.black, 
                      size: 24.0.w, 
                    ),
                  ),
                ),
              ),
            )

            ],
          ),
             
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    30.vs,
                    const Header(text: "Mes parrainages")
                        .animate(delay: const Duration(milliseconds: 200))
                        .fadeIn(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease)
                        .moveY(begin: -10.h, end: 0),
                    10.vs,
                    const SubHeader(
                            text:
                                "Débloquez le pouvoir de la collaboration et élevez votre parcours.")
                        .animate(delay: const Duration(milliseconds: 250))
                        .fadeIn(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease)
                        .moveY(begin: -10.h, end: 0),
                    50.vs,
                    SvgPicture.asset(
                      'assets/img/group.svg',
                      width: 180.w,
                      height: 140.h,
                    )
                        .animate(delay: const Duration(milliseconds: 300))
                        .fadeIn(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease)
                        .moveY(begin: -10.h, end: 0),
                    30.vs,
                    Text(
                      "Pas De Parrainages",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    )
                        .animate(delay: const Duration(milliseconds: 350))
                        .fadeIn(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease)
                        .moveY(begin: -10.h, end: 0),
                    20.vs,
                    Text(
                      "Commencez à parrainer et gagner 5% des montants d’achats de vos parrainés.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(80, 80, 81, 1),
                      ),
                    )
                        .animate(delay: const Duration(milliseconds: 400))
                        .fadeIn(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease)
                        .moveY(begin: -10.h, end: 0),
                    40.vs,
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        minimumSize: Size(double.infinity, 50.h),
                        backgroundColor: const Color.fromRGBO(217, 80, 116, 1),
                        foregroundColor: Colors.white,
                        textStyle: GoogleFonts.raleway(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: Text(
                        "Parrainer!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                        .animate(delay: const Duration(milliseconds: 450))
                        .fadeIn(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease)
                        .moveY(begin: 30.h, end: 0),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: const Color.fromRGBO(247, 247, 249, 1),
            child: SizedBox(
              height: 80.h,
              width: MediaQuery.of(context).size.width, // Take full width
              child: const BottomNavBar(
                currentIndex: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
