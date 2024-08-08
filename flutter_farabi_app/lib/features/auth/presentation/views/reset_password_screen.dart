import 'dart:ui';

import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/core/theming/colors.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/reset_pwd/reset_password_cubit.dart';

import 'package:flutter_farabi_app/features/auth/presentation/widgets/back_btn.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/error_modal.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/header.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
                              _numberController.clear();
                              showGeneralDialog(
                                barrierDismissible: true,
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
                                            "Vérifiez vos messages",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                color: ColorManager.darkGrey),
                                          ),
                                          10.vs,
                                          Text(
                                            "On vous a envoyé un mot de passe provisoire sur votre téléphone",
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
                        
                           CustomErrorModal(
                                message: state.stringError,
                                btnText: "Réessayer",
                                onPressed: () => Navigator.of(context).pop())
                            .show(context);
                         }
                          },
                          builder: (context, state) {
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
