import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/verify_otp/opt_verification_cubit.dart';

import 'package:flutter_farabi_app/features/auth/presentation/widgets/header.dart';

import 'package:flutter_farabi_app/features/auth/presentation/widgets/sub_header.dart';
import 'package:flutter_farabi_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/theming/colors.dart';

import '../widgets/back_btn.dart';
import '../widgets/error_modal.dart';
import '../widgets/resend_otp.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  bool disableBtn = true;

  final defaultPinTheme = PinTheme(
    width: 90,
    height: 64,
    textStyle: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: const Color.fromRGBO(70, 69, 66, 1),
    ),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(232, 235, 241, 0.37),
      borderRadius: BorderRadius.circular(15),
    ),
  );

  final cursor = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 21,
      height: 1,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(137, 146, 160, 1),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  Color? backgroundColor = const Color.fromRGBO(250, 177, 196, 1);
  void updateBackgroundColor() {
    setState(() {
      backgroundColor =
          controller.text.length < 4 ? const Color.fromRGBO(250, 177, 196, 1) :ColorManager.lightPink;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();

    super.dispose();
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
                          Navigator.pushNamed(
                            context,
                            '/register',
                          );
                        },
                      )
                    ],
                  ),
                  10.vs,
                  const Header(text: "Vérification OTP")
                      .animate(
                        delay: const Duration(milliseconds: 300),
                      )
                      .fade(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(begin: -10, end: 0),
                  15.vs,
                  const SubHeader(
                    text:
                        "Veuillez consulter vos messages (SMS) pour récupérer le code de vérification",
                  )
                      .animate(
                        delay: const Duration(milliseconds: 300),
                      )
                      .fade(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(begin: -10, end: 0),
                  35.vs,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Code OTP',
                        style: GoogleFonts.raleway(
                          color: const Color.fromRGBO(43, 43, 43, 1),
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                          .animate(
                            delay: const Duration(milliseconds: 600),
                          )
                          .fade(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease)
                          .moveY(begin: -10, end: 0),
                      20.vs,
                      Pinput(
                        length: 4,
                        controller: controller,
                        onChanged: (text) {
                          updateBackgroundColor();
                        },
                        focusNode: focusNode,
                        defaultPinTheme: defaultPinTheme,
                        separatorBuilder: (index) => SizedBox(width: 16.w),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(
                                    0, 0, 0, 0.05999999865889549),
                                offset: Offset(0, 3.h),
                                blurRadius: 16.r,
                              ),
                            ],
                          ),
                        ),
                        showCursor: false,
                        cursor: cursor,
                      )
                          .animate(
                            delay: const Duration(milliseconds: 600),
                          )
                          .fade(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease)
                          .moveY(begin: -10, end: 0),
                      30.vs,
                      BlocConsumer<OptVerificationCubit,
                              OptVerificationState>(
                        listener: (context, state) {
                          if (state is OptVerificationLoaded) {
                            Navigator.pushNamed(
                              context,
                              '/accountInformation',
                            );
                          }
                          if (state is OptVerificationError) {
                            CustomErrorModal(
                                    message: state.stringError,
                                    btnText: "Réessayer",
                                    onPressed: () =>
                                        Navigator.of(context).pop())
                                .show(context);
                          }
                        },
                        builder: (context, state) {
                          if (state is OptVerificationLoading) {
                            return ElevatedButton(
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  String otp = controller.text;
    
                                  context
                                      .read<OptVerificationCubit>()
                                      .otpVerification(
                                          box!.get('phone'), otp);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  minimumSize: Size(double.infinity, 50.h),
                                  backgroundColor:
                                      const Color.fromRGBO(250, 177, 196, 1),
                                  // Background color
                                  foregroundColor: ColorManager.white,
                                ),
                                child: SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1,
                                  ),
                                ));
                          }
                          return ElevatedButton(
                            onPressed: () {
                              if (controller.length < 4) {
                              } else {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                String otp = controller.text;
    
                                context
                                    .read<OptVerificationCubit>()
                                    .otpVerification(box!.get('phone'), otp);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r)),
                              minimumSize: Size(double.infinity, 50.h),
                              backgroundColor:
                                  backgroundColor, // Background color
                              foregroundColor: ColorManager.white,
                            ),
                            child: Text(
                              "Vérifier",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      )
                          .animate(
                            delay: const Duration(milliseconds: 900),
                          )
                          .fade(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease)
                          .moveY(begin: 20, end: 0),
                      15.vs,
                      const ResendOtp()
                          .animate(
                            delay: const Duration(milliseconds: 900),
                          )
                          .fade(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease)
                          .moveY(begin: 20, end: 0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
