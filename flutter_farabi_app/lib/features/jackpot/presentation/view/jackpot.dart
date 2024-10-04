import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_farabi_app/core/extensions/spacing.dart';

import 'package:flutter_farabi_app/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_farabi_app/features/jackpot/presentation/bloc/get_jackpot_history/get_jackpot_history_cubit.dart';
import 'package:flutter_farabi_app/features/jackpot/presentation/bloc/get_points/get_points_cubit.dart';
import 'package:flutter_farabi_app/features/jackpot/presentation/view/widgets/jackpot_history.dart';

import 'package:flutter_farabi_app/features/jackpot/presentation/view/widgets/scroller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widgets/custom_side_drawer.dart';

class Jackpot extends StatefulWidget {
  const Jackpot({super.key});

  @override
  State<Jackpot> createState() => _JackpotState();
}

class _JackpotState extends State<Jackpot> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier<double>(0.0);
  double maxPoints = 0.0;

  @override
  void initState() {
    // print(box!.get("token"));
    super.initState();
    context.read<GetPointsCubit>().getPoints();
    context.read<GetJackpotHistoryCubit>().getJackpotHistory();
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  Future<void> _refreshPage() async {
    context.read<GetPointsCubit>().getPoints();
    context.read<GetJackpotHistoryCubit>().getJackpotHistory();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
            leading: const CustomSideDrawer(),
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
             Padding(
              padding:  EdgeInsets.only(top: 6.h),
              child: SizedBox(
                width: 60.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                       Navigator.pushNamed(
                                  context,
                                  '/all_history',
                  
                                  
                                );
                    },
                    icon: Icon(Icons.notifications_outlined, color: Colors.black,size: 25.h,),
                  ),
                ),
              ),
            ),
            ],
          ),
          body: SafeArea(
            child: BlocConsumer<GetPointsCubit, GetPointsState>(
              listener: (context, state) {
                if (state is GetPointsLoaded) {
                  _valueNotifier.value = state.points;
                  maxPoints = state.maxPoints;
                }
              },
              builder: (context, state) {
                if (state is GetPointsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GetPointsLoaded) {
                  return RefreshIndicator(
                    onRefresh: _refreshPage,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          5.vs,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 270.h,
                                  width: double.infinity,
                                  child: Stack(children: [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: CircularSeekBar(
                                        interactive: false,
                                        trackColor: const Color.fromRGBO(
                                            234, 233, 240, 1),
                                        width: double.infinity,
                                        height: 250.h,
                                        maxProgress: maxPoints,
                                        valueNotifier: _valueNotifier,
                                        progress: _valueNotifier.value,
                                        barWidth: 10.w,
                                        startAngle: 90,
                                        sweepAngle: 180,
                                        strokeCap: StrokeCap.round,
                                        progressGradientColors: [
                                          Colors.pink
                                              .shade100, // Same as background color
                                          Colors.pink
                                              .shade400, // Example transition color
                                          Colors.pink
                                              .shade700 // Example transition color
                                        ],
                                        dashWidth: 50.w,
                                        dashGap: 7.w,
                                        animation: true,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 60.h),
                                                  child: ValueListenableBuilder(
                                                    valueListenable:
                                                        _valueNotifier,
                                                    builder:
                                                        (_, double value, __) =>
                                                            Text(
                                                      _valueNotifier.value
                                                          .toInt()
                                                          .toString(),
                                                      style: GoogleFonts.dmSans(
                                                        color: const Color
                                                            .fromRGBO(
                                                            44, 38, 70, 1),
                                                        fontSize: 55.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                          .animate(
                                              delay: const Duration(
                                                  milliseconds: 200))
                                          .fadeIn(
                                              duration: const Duration(
                                                  milliseconds: 600),
                                              curve: Curves.ease),
                                    ),
                                    Positioned(
                                      bottom: 115.h,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Les cadeaux en point de vente',
                                            style: GoogleFonts.raleway(
                                              color: const Color.fromRGBO(
                                                  14, 14, 12, 1),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            softWrap: true,
                                          )
                                              .animate(
                                                  delay: const Duration(
                                                      milliseconds: 200))
                                              .fadeIn(
                                                  duration: const Duration(
                                                      milliseconds: 200),
                                                  curve: Curves.ease)
                                              .moveX(begin: -10.w, end: 0),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                            top: 170.h,
                                            child: const SideScroller())
                                        .animate(
                                            delay: const Duration(
                                                milliseconds: 300))
                                        .fadeIn(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            curve: Curves.ease)
                                        .moveY(begin: -10.h, end: 0),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Historique",
                                  style: GoogleFonts.raleway(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(14, 14, 12, 1),
                                  ),
                                )
                                    .animate(
                                        delay:
                                            const Duration(milliseconds: 350))
                                    .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.ease)
                                    .moveX(begin: -10.w, end: 0),
                                const Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: const JackpotHistory(),
                          )
                        ],
                      ),
                    ),
                  );
                } else if (state is GetPointsError) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/img/ohno.svg',
                            width: 250.w,
                            height: 200.h,
                          ).animate().fadeIn(
                              duration: const Duration(milliseconds: 800)),
                          Text(
                            "Oh non!",
                            style: GoogleFonts.raleway(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(74, 74, 74, 1),
                            ),
                          )
                              .animate(delay: const Duration(milliseconds: 600))
                              .shake(),
                          15.vs,
                          Text(
                            state.errorString,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(74, 74, 74, 1),
                            ),
                          ),
                          20.vs,
                          ElevatedButton(
                            onPressed: () {
                              context.read<GetPointsCubit>().getPoints();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              minimumSize: Size(double.infinity, 50.h),
                              backgroundColor:
                                  const Color.fromRGBO(217, 80, 116, 1),
                              foregroundColor: Colors.white,
                              textStyle: GoogleFonts.raleway(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            child: Text(
                              'Réessayer',
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
                  );
                } else {
                  return const Text("");
                }
              },
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
