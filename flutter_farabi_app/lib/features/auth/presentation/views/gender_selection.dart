

import 'dart:ui';

import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/core/theming/colors.dart';

import 'package:flutter_farabi_app/features/auth/presentation/bloc/complete_register/create_account_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/back_btn.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/header.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/login_text_btn.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../main.dart';
import '../widgets/error_modal.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  late bool _isFemaleSelected;
  late bool _isMaleSelected;
  late String _selectedGender;

  @override
  void initState() {
    super.initState();
    _isFemaleSelected = false;
    _isMaleSelected = false;
    _selectedGender = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  15.vs,
                  Row(
                    children: [
                      BackBtn(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                  15.vs,
                  const Header(text: "Votre genre")
                      .animate(delay: const Duration(milliseconds: 300))
                      .fadeIn(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(begin: -10.h, end: 0),
                  10.vs,
                  const SubHeader(
                          text:
                              "Rejoignez Para El Farabi et bénéficiez d'un monde de promos")
                      .animate(delay: const Duration(milliseconds: 400))
                      .fadeIn(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(begin: -10.h, end: 0),
                  30.vs,
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isFemaleSelected = true;
                        _isMaleSelected = false;
                        _selectedGender = 'Female';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      minimumSize: Size(300.w, 60.h),
                      backgroundColor: _isFemaleSelected
                          ? ColorManager.lightPink
                          : ColorManager.lightGray,
                      // Background color
                      foregroundColor: _isFemaleSelected
                          ? ColorManager.white
                          : ColorManager.darkGrey,
                      // Text color
                      textStyle: GoogleFonts.raleway(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                    child: Text(
                      "Femme",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                      .animate(delay: const Duration(milliseconds: 500))
                      .fadeIn(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(begin: -10.h, end: 0),
                  20.vs,
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isMaleSelected = true;
                        _isFemaleSelected = false;
                        _selectedGender = 'Male';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      minimumSize: Size(300.w, 50.h),
                      backgroundColor: _isMaleSelected
                          ? ColorManager.lightPink
                          : ColorManager.lightGray,
                      // Background color
                      foregroundColor: _isMaleSelected
                          ? ColorManager.white
                          : ColorManager.darkGrey,
                      // Text color
                      textStyle: GoogleFonts.raleway(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                    child: Text(
                      "Homme",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                      .animate(delay: const Duration(milliseconds: 600))
                      .fadeIn(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(begin: -10.h, end: 0),
                  108.vs,
                  BlocConsumer<CreateAccountCubit, CreateAccountState>(
                    listener: (context, state) {
                      if (state is CreateAccountLoaded) {
                        
                        showGeneralDialog(
                          barrierDismissible: false,
                          barrierLabel: '',
                          barrierColor: const Color.fromARGB(95, 11, 6, 37),
                          //Color.fromARGB(95, 11, 6, 37)
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (ctx, anim1, anim2) => GestureDetector(
                            onTap: () {},
                            child: PopScope(
                              canPop: false,
                              child: Lottie.network(
                                'https://lottie.host/0e232e48-4342-4ffe-b839-726d9c5ec636/kHREpu9WWb.json',
                                repeat: false,
                                width: 40.w,
                                height: 40.h,
                              ),
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
                        Future.delayed(const Duration(milliseconds: 3000), () {
                          Navigator.pushNamed(context, '/login');
                        });
                      }
                      if (state is CreateAccountError) {
                        
                        CustomErrorModal(
                                message: state.stringError,
                                btnText: "Réessayer",
                                onPressed: () => Navigator.of(context).pop())
                            .show(context);
                      }
                    },
                    builder: (context, state) {
                      if (state is CreateAccountLoading) {
                        return ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r)),
                              minimumSize: Size(double.infinity, 50.h),

                              backgroundColor:  const Color.fromRGBO(250, 177, 196, 1), // Background color
                              foregroundColor: Colors.white, // Text color
                              textStyle: GoogleFonts.raleway(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            child: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1,
                                ),
                              )
                            );
                      }

                      return ElevatedButton(
                        onPressed: () {
                          if (_selectedGender == '') {
                      
                          } else {
                            String gender = _selectedGender;
                            String name = box!.get('name');
                            String lastName = box!.get('lastName');
                            String password = box!.get('password');
                            String date = box!.get('date');
                            String phone = box!.get('phone');
                            context.read<CreateAccountCubit>().createAccount(
                                phone, name, lastName, password, date, gender);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          minimumSize: Size(double.infinity, 50.h),
                          backgroundColor:  _selectedGender == ''
                              ? const Color.fromRGBO(250, 177, 196, 1)
                              : ColorManager.lightPink, // Background color
                          foregroundColor: Colors.white, // Text color
                          textStyle: GoogleFonts.raleway(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: 
                            Text(
                                "S'inscrire",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      );
                    },
                  ).animate(delay: const Duration(milliseconds: 800))
                      .fadeIn(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(begin: 20.h, end: 0),
                  100.vs,
                  const LoginTextBtn()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
