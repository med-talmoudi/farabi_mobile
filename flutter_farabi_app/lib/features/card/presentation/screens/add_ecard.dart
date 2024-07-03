// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/core/theming/colors.dart';
import 'package:flutter_farabi_app/features/card/presentation/bloc/create_e_card/create_e_card_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCard extends StatelessWidget {
  final String fullName;
  const AddCard({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(134, 134, 134, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          "assets/img/card.png",
                        ),
                        width: 220.w,
                        height: 130.h,
                      ),
                      Text(
                        "Pas De Cartes Fid!",
                        style: GoogleFonts.raleway(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(74, 74, 74, 1),
                        ),
                      ),
                      10.vs,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "Merci d’ajouter Vos Cartes de Fidélité",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(74, 74, 74, 1),
                          ),
                        ),
                      ),
                      15.vs,
                      BlocConsumer<CreateECardCubit, CreateECardState>(
                        listener: (context, state) {
                          if (state is CreateECardLoaded) {
                           
                            Navigator.pushNamed(context, '/card');
                          }
                          if (state is CreateECardError) {
                            showGeneralDialog(
                              barrierDismissible: false,
                              barrierLabel: '',
                              barrierColor: const Color.fromARGB(95, 11, 6, 37),
                              //Color.fromARGB(95, 11, 6, 37)
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder: (ctx, anim1, anim2) =>
                                  GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0.r)),
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  contentPadding: EdgeInsets.all(20.0.w),
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 60.h,
                                          width: 60.w,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                ColorManager.lightPink,
                                            child: Image(
                                              image: const AssetImage(
                                                "assets/img/inbox_icon.png",
                                              ),
                                              height: 30.h,
                                              width: 30.w,
                                            ),
                                          ),
                                        ),
                                        25.vs,
                                        Text(
                                          "Vérifier Vos Messages",
                                          style: GoogleFonts.raleway(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              color: ColorManager.darkGrey),
                                        ),
                                        10.vs,
                                        Text(
                                          state.stringError,
                                          style: GoogleFonts.poppins(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: ColorManager
                                                  .dejaInscritTextColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        10.vs,
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              transitionBuilder: (ctx, anim1, anim2, child) =>
                                  BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 2 * anim1.value,
                                    sigmaY: 2 * anim1.value),
                                child: FadeTransition(
                                  opacity: anim1,
                                  child: child,
                                ),
                              ),
                              context: context,
                            );
                          }
                        },
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                            
                              // Handle onTap action
                              context.read<CreateECardCubit>().createECard();
                            },
                            child: Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: state is CreateECardLoading
                                    ? const Color.fromRGBO(250, 177, 196, 1)
                                    : ColorManager.lightPink,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Center(
                                child: state is CreateECardLoading?
                                    ? SizedBox(
                                        width: 20.w,
                                        height: 20.h,
                                        child: const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 1,
                                        ),
                                      )
                                    : Text(
                                        "Genérer E-Card",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                      10.vs,
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/insert_card',
                              arguments: fullName);
                        },
                        child: Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: ColorManager.lightPink,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Ajout Carte",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.lightPink,
                              ),
                            ),
                          ),
                        ),
                      ),
                      15.vs
                    ],
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
