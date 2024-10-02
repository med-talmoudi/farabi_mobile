import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theming/colors.dart';

class SideScroller extends StatefulWidget {
  const SideScroller({super.key});

  @override
  State<SideScroller> createState() => _SideScrollerState();
}

class _SideScrollerState extends State<SideScroller> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
       
        children: [
          10.hs,
          SizedBox(
            height: 92.h,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 60.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: ColorManager.lightPink,
                        border: Border.all(
                          color: ColorManager.lightPink,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/img/present.svg',
                              width: 29.w,
                              height: 29.h,
                            ),
                            8.hs,
                            Text(
                              "1 Point = 1 DT de réduction",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
                Positioned.fill(
                  bottom: 0,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: const CircleBorder(),
                            padding: EdgeInsets.all(5.r),
                            backgroundColor: const Color.fromRGBO(
                                247, 247, 249, 1), // <-- Button color
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              //TODO
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.lightPink,
                                shape: const CircleBorder()),
                            child: Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: SvgPicture.asset(
                                'assets/img/lock.svg',
                                width: 25.w,
                                height: 25.h,
                              ),
                            ),
                          ))),
                ),
              ],
            ),
          ),

        
        ],
      )
          .animate(delay: const Duration(milliseconds: 200))
          .fadeIn(
              duration: const Duration(milliseconds: 500), curve: Curves.ease)
          .moveY(begin: -10.h, end: 0),
    );
  }
}
