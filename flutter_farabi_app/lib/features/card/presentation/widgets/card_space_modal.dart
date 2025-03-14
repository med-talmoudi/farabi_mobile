import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/core/networking/card_network.dart';
import 'package:flutter_farabi_app/features/card/presentation/bloc/delete_card/delete_card_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../../core/theming/colors.dart';

class CustomDelete extends StatefulWidget {
  const CustomDelete({super.key});

  @override
  State<CustomDelete> createState() => _CustomDeleteState();
}

class _CustomDeleteState extends State<CustomDelete> {
   bool isAnimated =false;
  @override
  Widget build(BuildContext context) {

    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          isDismissible: false,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          builder: (BuildContext context) {
            return PopScope(
  canPop: false,
    // or your logic here
   // Prevent the back button from closing the modal
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: const AssetImage("assets/img/delete_card.png"),
                          width: 250.w,
                          height: 150.h,
                        ).animate().fadeIn(
                            duration: const Duration(milliseconds: 300)),
                        Text(
                          "Supprimer la carte",
                          style: GoogleFonts.raleway(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(74, 74, 74, 1),
                          ),
                        ),
                        15.vs,
                        Text(
                          'Voulez-vous vraiment supprimer cette carte ?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(74, 74, 74, 1),
                          ),
                        ),
                        20.vs,
                        BlocProvider(
                          create: (context) => DeleteCardCubit(CardApi()),
                          child: BlocConsumer<DeleteCardCubit, DeleteCardState>(
                            listener: (context, state) {
                              if (state is DeleteCardLoaded) {
                                isAnimated =true;
                                MotionToast.error(
                                  title: const Text("Carte supprimée"),
                                  description: const Text(
                                      "Votre carte a été supprimée avec succès."),
                                  animationType: AnimationType.fromTop,
                                  position: MotionToastPosition.top,
                                  dismissable: false,
                                  toastDuration: const Duration(milliseconds: 1800),
                                ).show(context);

                                // Wait for 2 seconds before navigating to the card generation page
                                Future.delayed(const Duration(milliseconds: 1800), () {

                                  // Check if Navigator is still available
                                  if (Navigator.of(context).canPop()) {
                                    Navigator.pushNamed(context, '/add_card');
                                  }
                                });
                               
                              }
                              if (state is DeleteCardError) {
                                showGeneralDialog(
                                  barrierDismissible: true,
                                  barrierLabel: '',
                                  barrierColor:
                                      const Color.fromARGB(95, 11, 6, 37),
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
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 255, 255),
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
                                                      "assets/img/inbox_icon.png"),
                                                  height: 30.h,
                                                  width: 30.w,
                                                ),
                                              ),
                                            ),
                                            25.vs,
                                            Text(
                                              "Oh non!",
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
                                  transitionBuilder:
                                      (ctx, anim1, anim2, child) =>
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
                                     isAnimated =true;
                                     print("value on click delete $isAnimated");
                                  context.read<DeleteCardCubit>().deleteCard();
                                },
                                child: Container(
                                  height: 50.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: state is DeleteCardLoading
                                        ? const Color.fromRGBO(250, 177, 196, 1)
                                        : ColorManager.lightPink,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Center(
                                    child: state is DeleteCardLoading
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
                                            "Supprimer",
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
                        ),
                        10.vs,
                        GestureDetector(
                          onTap: () {
                             print("value on click keep $isAnimated");
                            if (isAnimated == false ) {
                              Navigator.of(context).pop();
                            }
                            
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
                                "Conserver",
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
                        10.vs
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      icon: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.close,
          size: 20.w,
          color: Colors.red[700],
        ),
      ),
    );
  }
}
