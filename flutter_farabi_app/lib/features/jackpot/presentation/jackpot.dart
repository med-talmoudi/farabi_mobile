import 'package:circular_seek_bar/circular_seek_bar.dart';



import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/core/theming/colors.dart';

import 'package:flutter_farabi_app/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class Jackpot extends StatefulWidget {
  const Jackpot({super.key});

  @override
  State<Jackpot> createState() => _JackpotState();
}

class _JackpotState extends State<Jackpot> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier<double>(25.0);
  @override
  void initState() {
    // print(box!.get("token"));
    super.initState();
  }

  @override
  void dispose() {
    
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(247, 247, 249, 1),

          // backgroundColor: Colors.amber,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
            leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/img/menu_icon.svg',
                width: 23.w,
                height: 23.h,
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: SizedBox(
                width: 155.w,
                height: 50.h,
                child: Stack(
                  children: [
                    Positioned(
                      top: 3.h,
                      left: 0.w,
                      child: SvgPicture.asset(
                        'assets/img/three_lines.svg',
                        width: 19.w,
                        height: 19.h,
                      ),
                    ),
                    Positioned(
                      bottom: 7.h,
                      right: 0,
                      child: Text(
                        'Cagnotte',
                        style: GoogleFonts.raleway(
                          color: const Color.fromRGBO(43, 43, 43, 1),
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            centerTitle: true,
            actions: [
              SizedBox(
                width: 60.w,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/img/notification_bell_marked.svg',
                    width: 90.w,
                    height: 90.h,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        CircularSeekBar(
                          interactive: true,
                          trackColor: const Color.fromRGBO(234, 233, 240, 1),
                          width: double.infinity,
                          height: 350.h,
                          valueNotifier: _valueNotifier,
                          progress: _valueNotifier.value,
                          barWidth: 10.w,
                          startAngle: 90,
                          sweepAngle: 180,
                          strokeCap: StrokeCap.round,
                          progressGradientColors: [
                            Colors.pink.shade100, // Same as background color
                            Colors.pink.shade400, // Example transition color
                            Colors.pink.shade700 // Example transition color
                          ],
                          dashWidth: 50.w,
                          dashGap: 7.w,
                          animation: true,
                          child: Column(
                            children: [
                              Column(children: [
                                80.vs,
                                // Text(
                                //   '1 Point = 1 DT de réduction',
                                //   style: GoogleFonts.dmSans(
                                //     color:
                                //         const Color.fromRGBO(144, 139, 166, 1),
                                //     fontSize: 16.sp,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                              
                              
                                ValueListenableBuilder(
                                    valueListenable: _valueNotifier,
                                    builder: (_, double value, __) => Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                _valueNotifier.value
                                                    .toInt()
                                                    .toString(),
                                                style: GoogleFonts.dmSans(
                                                  color: const Color.fromRGBO(
                                                      44, 38, 70, 1),
                                                  fontSize: 55.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                '+6pts',
                                                style: GoogleFonts.dmSans(
                                                  color: const Color.fromRGBO(
                                                      217, 80, 116, 1),
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ])),
                              ]),
                              15.vs,
                              Row(
                                children: [
                                  Text(
                                    'Les cadeaux en point de vente',
                                    style: GoogleFonts.raleway(
                                      color:
                                          const Color.fromRGBO(14, 14, 12, 1),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              15.vs,
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  //TODO
                                  children: [
                                    10.hs,
                                    SizedBox(height: 106.h,
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 80.h,
                                                width: 300.w,
                                                decoration: BoxDecoration(
                                                  color: ColorManager.lightPink,
                                                  border: Border.all(
                                                    color: ColorManager.lightPink,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/img/present.svg',
                                                        width: 29.w,
                                                        height: 29.h,
                                                      ),
                                                      8.hs,
                                                      Text(
                                                        "1 Point = 1 DT de réduction",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      elevation: 0,
                                                      shape: const CircleBorder(),
                                                      padding:
                                                          EdgeInsets.all(5.r),
                                                      backgroundColor: const Color.fromRGBO(247, 247, 249, 1), // <-- Button color
                                                    ),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        //TODO
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              ColorManager
                                                                  .lightPink,
                                                          shape:
                                                              const CircleBorder()),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0.r),
                                                        child: SvgPicture.asset(
                                                          'assets/img/lock.svg',
                                                          width: 30.w,
                                                          height: 30.h,
                                                        ),
                                                      ),
                                                    ))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  
                                    10.hs,
                                  SizedBox(height: 106.h,
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 80.h,
                                                width: 300.w,
                                                decoration: BoxDecoration(
                                                  color: ColorManager.lightPink,
                                                  border: Border.all(
                                                    color: ColorManager.lightPink,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/img/present.svg',
                                                        width: 29.w,
                                                        height: 29.h,
                                                      ),
                                                      8.hs,
                                                      Text(
                                                        "Convertissez vos points",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      elevation: 0,
                                                      shape: const CircleBorder(),
                                                      padding:
                                                          EdgeInsets.all(5.r),
                                                      backgroundColor: const Color.fromRGBO(247, 247, 249, 1), // <-- Button color
                                                    ),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        //TODO
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              ColorManager
                                                                  .lightPink,
                                                          shape:
                                                              const CircleBorder()),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0.r),
                                                        child: SvgPicture.asset(
                                                          'assets/img/lock.svg',
                                                          width: 30.w,
                                                          height: 30.h,
                                                        ),
                                                      ),
                                                    ))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  
                                    10.hs,
                                   // TODO  change the icon route of bottom nav
                                   SizedBox(height: 106.h,
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 80.h,
                                                width: 250.w,
                                                decoration: BoxDecoration(
                                                  color: ColorManager.lightPink,
                                                  border: Border.all(
                                                    color: ColorManager.lightPink,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20.r),
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/img/present.svg',
                                                        width: 29.w,
                                                        height: 29.h,
                                                      ),
                                                      8.hs,
                                                      Text(
                                                        "Bon d’achat de 20 DT",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      elevation: 0,
                                                      shape: const CircleBorder(),
                                                      padding:
                                                          EdgeInsets.all(5.r),
                                                      backgroundColor: const Color.fromRGBO(247, 247, 249, 1), // <-- Button color
                                                    ),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        //TODO
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              ColorManager
                                                                  .lightPink,
                                                          shape:
                                                              const CircleBorder()),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0.r),
                                                        child: SvgPicture.asset(
                                                          'assets/img/lock.svg',
                                                          width: 30.w,
                                                          height: 30.h,
                                                        ),
                                                      ),
                                                    ))),
                                          ),
                                        ],
                                      ),
                                    ),
                                   
                                    10.hs,
                                  ],
                                ),
                              ),
                              15.vs,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        30.vs,
                      ],
                    ),
                  ),
                ],
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
               
                currentIndex: 1,
              ),
            ),
          ),
        ));
  }
}
