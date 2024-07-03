// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';

import 'package:flutter_farabi_app/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return
     BlocConsumer<CardDetailsCubit, CardDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CardDetailsLoading) {
            return Scaffold(
              body: SafeArea(
                  child: Center(
                child: CircularProgressIndicator(),
              )),
            );
          } else if (state is CardDetailsLoaded) {
        return Scaffold(
       backgroundColor: Color.fromRGBO(247, 247, 249, 1),
    
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(247, 247, 249, 1),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/img/menu_icon.svg',
            width: 23.w,
            height: 23.h,
          ),
        ),
        title: Padding(
          padding:  EdgeInsets.only(top: 5.h),
          child: SizedBox(
            width: 100.w,
            height: 50.h,
            child: Stack(
              children: [
                Positioned(
                  top: 9.h,
                  left: 2.w,
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/img/three_lines.svg',
                      width: 19.w,
                      height: 19.h,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    child: Text(
                      'Carte',
                      style: GoogleFonts.raleway(
                        color: Color.fromRGBO(43, 43, 43, 1),
                        fontSize: 33.sp,
                        fontWeight: FontWeight.w700,
                      ),
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
      body:
             SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          40.vs,
                          Padding(
                            padding: EdgeInsets.all(8.0.h),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/img/card_flower_bg.jpg"),
                                    fit: BoxFit.fill),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(129, 197, 197, 197)
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 0, 0),
                                          child: Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                  "assets/img/el_farabi_logo.png",
                                                ),
                                                width: 60.w,
                                                height: 50.h,
                                              ),
                                             6.hs,
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10.h),
                                                child: Image(
                                                  image: AssetImage(
                                                    "assets/img/el_farabi_text.png",
                                                  ),
                                                  width: 100.w,
                                                  height: 40.h,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CustomDelete()
                                      ],
                                    ),
                                    20.vs,
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          6, 0, 100, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            state.cardNumber.substring(0, 1),
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            state.cardNumber.substring(1, 5),
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            state.cardNumber.substring(5, 9),
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            state.cardNumber.substring(9, 13),
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          23, 20, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Propriétaire",
                                            style: GoogleFonts.raleway(
                                              color: Color.fromARGB(
                                                  255, 87, 87, 87),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            state.fullName,
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
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
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: 20.w),
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
                              padding:
                                   EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                              child:
                                  isToggled ? HasHistory() : NoHistoryWidget()),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          
       
    bottomNavigationBar: BottomAppBar(
      elevation: 0,
      color:Color.fromRGBO(247, 247, 249, 1),
      child: SizedBox(
        height: 80.h,
        width: MediaQuery.of(context)
            .size
            .width, // Take full width
        child: BottomNavBar(id: state.id),
      ),
    ),
    );
    }
     else {
            return Scaffold(body: Text(" no data "));
          }

  }
  )
  ;
  }
 
   
}