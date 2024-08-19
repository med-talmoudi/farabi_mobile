import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';

import 'package:flutter_farabi_app/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_farabi_app/core/widgets/custom_side_drawer.dart';

import 'package:flutter_farabi_app/features/card/presentation/bloc/card_details/card_details_cubit.dart';
import 'package:flutter_farabi_app/features/card/presentation/widgets/card_space_modal.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';


import '../widgets/has_history.dart';
import '../widgets/no_history.dart';

class CardSpace extends StatefulWidget {
  const CardSpace({super.key});

  @override
  State<CardSpace> createState() => _CardSpaceState();
}

class _CardSpaceState extends State<CardSpace> {
  bool isToggled = false;
  @override
  void initState() {
    super.initState();
    context.read<CardDetailsCubit>().cardDetails();
  }
   Future<void> _refreshPage() async {
    context.read<CardDetailsCubit>().cardDetails(); // Trigger refresh
    
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
          leading:  const CustomSideDrawer(),
          title: Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: SizedBox(
              width: 100.w,
              height: 50.h,
              child: Stack(
                children: [
                  Positioned(
                    top: 4.h,
                    left: 2.w,
                    child: SvgPicture.asset(
                      'assets/img/three_lines.svg',
                      width: 19.w,
                      height: 19.h,
                    ),
                  ),
                  Positioned(
                    bottom: 5.h,
                    right: 0,
                    child: Text(
                      'Carte',
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
        body: SafeArea(
            child: BlocConsumer<CardDetailsCubit, CardDetailsState>(
                listener: (context, state) {
          if (state is CardDetailsError) {
            // if (state.statusCode == 404) {
            Navigator.pushNamed(
              context,
              '/login',
            );
            // }
          }
        }, builder: (context, state) {
          if (state is CardDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CardDetailsLoaded) {
            return RefreshIndicator(
              onRefresh: _refreshPage,
              child: (SingleChildScrollView(
                 physics: const AlwaysScrollableScrollPhysics(),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          40.vs,
                          Padding(
                            padding: EdgeInsets.all(8.0.h),
                            child: Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/img/card_flower_bg.jpg"),
                                    fit: BoxFit.fill),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(129, 197, 197, 197)
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.fromLTRB(20, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Image(
                                              image: const AssetImage(
                                                "assets/img/el_farabi_logo.png",
                                              ),
                                              width: 60.w,
                                              height: 50.h,
                                            ),
                                            6.hs,
                                            Padding(
                                              padding: EdgeInsets.only(top: 10.h),
                                              child: Image(
                                                image: const AssetImage(
                                                  "assets/img/el_farabi_text.png",
                                                ),
                                                width: 100.w,
                                                height: 40.h,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const CustomDelete()
                                    ],
                                  ),
                                  20.vs,
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 0, 100, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          state.cardNumber.substring(0, 1),
                                          style: GoogleFonts.poppins(
                                            color:
                                                const Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          state.cardNumber.substring(1, 5),
                                          style: GoogleFonts.poppins(
                                            color:
                                                const Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          state.cardNumber.substring(5, 9),
                                          style: GoogleFonts.poppins(
                                            color:
                                                const Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          state.cardNumber.substring(9, 13),
                                          style: GoogleFonts.poppins(
                                            color:
                                                const Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(23, 20, 0, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Propriétaire",
                                          style: GoogleFonts.raleway(
                                            color: const Color.fromARGB(
                                                255, 87, 87, 87),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          state.fullName,
                                          style: GoogleFonts.poppins(
                                            color:
                                                const Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        20.vs,
                                      ],
                                    ),
                        
                                    ////////////////////////////////////////////////
                                  ),
                                ],
                              ),
                            ).animate(delay: const Duration(milliseconds: 300))
                        .fadeIn(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.ease).moveY(begin: -10.h, end: 0),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                30.vs,
                                // Transform.scale(
                                //   scale: 1.2,
                                //   child: Switch(
                                //     activeColor: ColorManager.lightPink,
                                //     value: isToggled,
                                //     onChanged: (value) {
                                //       setState(() {
                                //         isToggled = !isToggled;
                                //       });
                                //     },
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.h, vertical: 10.h),
                              child: isToggled
                                  ? const HasHistory()
                                  : const NoHistoryWidget()),
                        ],
                      ),
                    ],
                  ))),
            );
          } else if (state is CardDetailsError) {
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
                    )
                        .animate()
                        .fadeIn(duration: const Duration(milliseconds: 800)),
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
                        context.read<CardDetailsCubit>().cardDetails();
                      },
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
        })),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: const Color.fromRGBO(247, 247, 249, 1),
          child: SizedBox(
            height: 80.h,
            width: MediaQuery.of(context).size.width, // Take full width
            child: const BottomNavBar(
              currentIndex: 0,
            ),
          ),
        ),
      ),
    );
  }
}
