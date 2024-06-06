import 'dart:async';
import 'dart:ui';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/resend_otp/resend_otp_cubit.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/error_modal.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theming/colors.dart';
import '../../../../main.dart';

class ResendOtp extends StatefulWidget {
  const ResendOtp({super.key});

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  static const int initialTime = 18;
  int timeLeft = initialTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr =
        (remainingSeconds < 10) ? '0$remainingSeconds' : '$remainingSeconds';
    return '$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Renvoyer code dans",
          style: GoogleFonts.raleway(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(125, 132, 141, 1),
          ),
        ),
        BlocConsumer<ResendOtpCubit, ResendOtpState>(
          listener: (context, state) {
            if (state is ResendOtpLoaded) {
              {
                showGeneralDialog(
                  barrierDismissible: false,
                  barrierLabel: '',
                  barrierColor: const Color.fromARGB(95, 11, 6, 37),
                  //Color.fromARGB(95, 11, 6, 37)
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (ctx, anim1, anim2) => GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SimpleDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0.r)),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      contentPadding: EdgeInsets.all(20.0.w),
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 60.h,
                              width: 60.w,
                              child: CircleAvatar(
                                backgroundColor: ColorManager.lightPink,
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
                              "On Vous a envoyé un autre code OTP par SMS",
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.dejaInscritTextColor),
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
                        sigmaX: 2 * anim1.value, sigmaY: 2 * anim1.value),
                    child: FadeTransition(
                      opacity: anim1,
                      child: child,
                    ),
                  ),
                  context: context,
                );
              }
            }
            if (state is ResendOtpError) {
              CustomErrorModal(
                  message: state.stringError,
                  btnText: "Réessayer",
                  onPressed: () => Navigator.of(context).pop()).show(context);
            }
            
          },
          builder: (context, state) {
            if (state is ResendOtpLoading) {
              return const CircularProgressIndicator(color: ColorManager.lightPink,);
            }
            return TextButton(
              
                onPressed: () {
                  if (timeLeft == 0) {
                    context.read<ResendOtpCubit>().resendOtp(box!.get('phone'));
                    setState(() {
                      timeLeft = initialTime;
                    });
                    startTimer();
                  }
                },
                child: timeLeft == 0
                    ? Text(
                        "Renvoyer",
                        style: GoogleFonts.raleway(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.lightPink
                        ),
                      )
                    : Text(
                        formatTime(timeLeft),
                        style: GoogleFonts.raleway(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(125, 132, 141, 1),
                        ),
                      ));
          },
        ),
      ],
    );
  }
}
