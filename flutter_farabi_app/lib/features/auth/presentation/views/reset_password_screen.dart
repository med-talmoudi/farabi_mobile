// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/core/theming/colors.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/reset_pwd/reset_password_cubit.dart';

import 'package:flutter_farabi_app/features/auth/presentation/widgets/back_btn.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/header.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final RegExp tunisianPhoneNumberRegExp = RegExp(r'^[23459]\d{7}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
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
                          Navigator.pushNamed(
                            context,
                            "/login",
                          );
                        },
                      ),
                    ],
                  ),
                  10.vs,
                  const Header(text: "Mot de passe oublié")
                      .animate(delay: const Duration(milliseconds: 300))
                      .fadeIn(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(begin: -10.h, end: 0),
                  10.vs,
                  const SubHeader(
                          text:
                              "Veuillez saisir votre numéro de téléphone pour réinitialiser votre mot de passe")
                      .animate(delay: const Duration(milliseconds: 400))
                      .fadeIn(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(begin: -10.h, end: 0),
                  20.vs,
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.vs,
                        TextFormField(
                          controller: _numberController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez saisir votre numéro de téléphone';
                            } else if (!tunisianPhoneNumberRegExp
                                .hasMatch(value)) {
                              return 'Veuillez saisir votre numéro de téléphone ';
                            }

                            return null;
                          },
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(247, 247, 249, 1),
                            hintText: "20 000 000",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        )
                            .animate(delay: const Duration(milliseconds: 600))
                            .fadeIn(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease)
                            .moveY(begin: -10.h, end: 0),
                        50.vs,
                        BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                          listener: (context, state) {
                            if (state is ResetPasswordLoaded) {
                              showGeneralDialog(
                                barrierDismissible: false,
                                barrierLabel: '',
                                barrierColor:
                                    const Color.fromARGB(95, 11, 6, 37),
                                //Color.fromARGB(95, 11, 6, 37)
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                pageBuilder: (ctx, anim1, anim2) =>
                                    GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: SimpleDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0.r)),
                                    backgroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    contentPadding: EdgeInsets.all(20.0.r),
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
                                            "On Vous a envoyé un Mot de Passe Provisoire Sur Votre Mobile",
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
                            if (state is ResetPasswordError) {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20.r)),
                                ),
                                builder: (BuildContext context) {
                                  return BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          topRight: Radius.circular(20.r),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.w),
                                        child: Column(
                                          children: [
                                            10.vs,
                                            Image(
                                              image: const AssetImage(
                                                  "assets/img/ohno.png"),
                                              width: 250.w,
                                              height: 200.h,
                                            ),
                                            Text(
                                              "Oh non!",
                                              style: GoogleFonts.raleway(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700,
                                                color: const Color.fromRGBO(
                                                    74, 74, 74, 1),
                                              ),
                                            )
                                                .animate(
                                                    delay: const Duration(
                                                        milliseconds: 600))
                                                .shake(),
                                            20.vs,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0),
                                              child: Text(
                                                state.stringError,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.raleway(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromRGBO(
                                                      74, 74, 74, 1),
                                                ),
                                              ),
                                            ),
                                            50.vs,
                                            ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.r),
                                                ),
                                                minimumSize: Size(
                                                    double.infinity.w, 50.h),
                                                backgroundColor:
                                                    const Color.fromRGBO(
                                                        217, 80, 116, 1),
                                                foregroundColor: Colors.white,
                                                textStyle: GoogleFonts.raleway(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              child: Text(
                                                "Réessayer",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.raleway(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is ResetPasswordLoading) {
                              // return ElevatedButton(
                              //     style: ElevatedButton.styleFrom(
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(20)),
                              //       minimumSize:
                              //           const Size(double.infinity, 60),
                              //       backgroundColor: ColorManager
                              //           .lightPink, // Background color
                              //       foregroundColor: ColorManager.white,
                              //     ),
                              //     child: const CircularProgressIndicator(
                              //       color: Colors.white,
                              //     ),
                              //     onPressed: () {});
                            }
                            return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      minimumSize:
                                          Size(double.infinity.w, 50.h),
                                      backgroundColor:
                                          state is ResetPasswordLoading
                                              ? const Color.fromRGBO(
                                                  250, 177, 196, 1)
                                              : ColorManager.lightPink,
                                      foregroundColor: ColorManager.white,
                                    ),
                                    child: state is ResetPasswordLoading
                                        ? SizedBox(
                                            width: 20.w,
                                            height: 20.h,
                                            child:
                                                const CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 1,
                                            ),
                                          )
                                        : Text(
                                            "Réinitialiser le mot de passe",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.raleway(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                    onPressed: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      if (_formKey.currentState!.validate()) {
                                        String phone = _numberController.text;

                                        context
                                            .read<ResetPasswordCubit>()
                                            .resetPassword(phone);
                                      }
                                    })
                                .animate(
                                    delay: const Duration(milliseconds: 800))
                                .fadeIn(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease)
                                .moveY(begin: 20.h, end: 0);
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      )),
    );
  }
}
