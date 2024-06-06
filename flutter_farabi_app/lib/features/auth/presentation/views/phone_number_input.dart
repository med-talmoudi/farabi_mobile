// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/pre_register/phone_register_cubit.dart';
import 'package:flutter_farabi_app/features/auth/data/repositories/auth_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_farabi_app/features/auth/sign_up/business_logic/sign_up_logic/verify_phone_number.dart';

import '../../../../main.dart';
import '../widgets/error_modal.dart';
import '../widgets/header.dart';
import '../widgets/label_text.dart';
import '../widgets/login_text_btn.dart';
import '../widgets/sub_header.dart';
import '../../../../core/networking/auth_network.dart';

// ignore: must_be_immutable
class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({super.key});

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  bool numberIsvalid = false;

  bool isLoading = false;
  final _phoneNumberController = TextEditingController();
  final _formKeyRegister = GlobalKey<FormState>();
  final RegExp tunisianPhoneNumberRegExp = RegExp(r'^[23459]\d{7}$');
  AuthRepository phoneRegisterRepository = AuthRepository(RegisterApi());

  @override
  void dispose() {
    _phoneNumberController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.vs,
                  Header(
                    text: "Création de compte",
                  )
                      .animate(delay: const Duration(milliseconds: 300))
                      .fade(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(
                          begin: -10,
                          end: 0,
                          duration: const Duration(microseconds: 300),
                          curve: Curves.ease),
                  20.vs,
                  SubHeader(
                    text:
                        "Veuillez saisir un numéro de téléphone \n pour vous s'inscrire",
                  )
                      .animate(
                        delay: const Duration(milliseconds: 300),
                      )
                      .fadeIn(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      )
                      .moveY(begin: -10, end: 0),
                  30.vs,
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKeyRegister,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelText(
                              text: "Numéro de téléphone",
                            )
                                .animate(
                                  delay: const Duration(milliseconds: 600),
                                )
                                .fade(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                )
                                .moveY(begin: -10, end: 0),
                            10.vs,
                            BlocBuilder<VerifyPhoneNumberCubit, String>(
                              builder: (context, state) {
                                if (state.isEmpty) {
                                  // Render TextFormField without any border color
                                  return TextFormField(
                                    controller: _phoneNumberController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Ce champs est obligatoire";
                                      } else if (!tunisianPhoneNumberRegExp
                                          .hasMatch(value)) {
                                        return 'Veuillez saisir un numéro de téléphone valide';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      context
                                          .read<VerifyPhoneNumberCubit>()
                                          .updatePhoneNumber(value);
                                    },
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(8),
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromRGBO(
                                          247, 247, 249, 1),
                                      hintText: "20 000 000",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  )
                                      .animate(
                                        delay:
                                            const Duration(milliseconds: 600),
                                      )
                                      .fade(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      )
                                      .moveY(begin: -10, end: 0);
                                } else if (state.length < 8) {
                                  // Render TextFormField with red border color
                                  return TextFormField(
                                    controller: _phoneNumberController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Ce champs est obligatoire";
                                      } else if (!tunisianPhoneNumberRegExp
                                          .hasMatch(value)) {
                                        return 'Veuillez saisir un numéro de téléphone valide';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      context
                                          .read<VerifyPhoneNumberCubit>()
                                          .updatePhoneNumber(value);
                                    },
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(8),
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    decoration: InputDecoration(
                                      suffixIcon: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2.w,
                                          color: Color.fromRGBO(217, 80, 116,
                                              1), // Pink color in focused state
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                    ),
                                  )
                                      .animate(
                                        delay:
                                            const Duration(milliseconds: 600),
                                      )
                                      .fade(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      )
                                      .moveY(begin: -10, end: 0);
                                } else {
                                  // Render TextFormField with green border color and success icon
                                  return TextFormField(
                                    controller: _phoneNumberController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Ce champs est obligatoire";
                                      } else if (!tunisianPhoneNumberRegExp
                                          .hasMatch(value)) {
                                        return 'Veuillez saisir un numéro de téléphone valide';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      context
                                          .read<VerifyPhoneNumberCubit>()
                                          .updatePhoneNumber(value);
                                      numberIsvalid = true;
                                    },
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(8),
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromRGBO(
                                          247, 247, 249, 1),
                                      suffixIcon: const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            50.vs,
                            BlocBuilder<VerifyPhoneNumberCubit, String>(
                                    builder: (context, state) {
                              return BlocConsumer<PhoneRegisterCubit,
                                  PhoneRegisterState>(
                                listener: (context, registerState) {
                                  if (registerState is PhoneRegisterLoaded) {
                                    isLoading = false;
                                    final String phone =
                                        _phoneNumberController.text;
                                    box!.put("phone", phone);
                                    switch (registerState.stringStatus) {
                                      case "unverified":
                                        Navigator.pushNamed(context, '/otp');

                                        break;
                                      case "incompleted":
                                        Navigator.pushNamed(
                                            context, '/accountInformation');
                                      case "completed":
                                      default:
                                        Navigator.pushNamed(context, '/otp');
                                    }
                                  }

                                  if (registerState is PhoneRegisterError) {
                                    isLoading = false;
                                    print(registerState.stringError);
                                    if (registerState.stringError ==
                                        "L'utilisateur existe déjà") {
                                      CustomErrorModal(
                                          message: registerState.stringError,
                                          btnText: "Aller à la connexion",
                                          onPressed: () => Navigator.pushNamed(
                                              context, '/login')).show(context);
                                    } else {
                                      CustomErrorModal(
                                          message: registerState.stringError,
                                          btnText: "Réessayer",
                                          onPressed: () => Navigator.of(context)
                                              .pop()).show(context);
                                    }
                                  }
                                },
                                builder: (context, registerState) {
                                  if (registerState is PhoneRegisterLoading) {
                                    isLoading = true;
                                    return ElevatedButton(
                                        onPressed: () {
                                          print("initial clicked");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r)),
                                          minimumSize:
                                              Size(double.infinity.w, 50.h),
                                          backgroundColor: Color.fromRGBO(250,
                                              177, 196, 1), // Background color
                                          foregroundColor: Colors.white,
                                          textStyle: GoogleFonts.raleway(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                          ), // Text color
                                        ),
                                        child: SizedBox(
                                          width: 20.w,
                                          height: 20.h,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 1,
                                          ),
                                        ));
                                  }

                                  return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r)),
                                        minimumSize:
                                            Size(double.infinity.w, 50.h),
                                        backgroundColor:
                                            Color.fromRGBO(217, 80, 116, 1),

                                        // Background color

                                        foregroundColor:
                                            Colors.white, // Text color
                                        textStyle: GoogleFonts.raleway(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      onPressed: () {
                                        print("initial clicked");
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        if (_formKeyRegister.currentState!
                                            .validate()) {
                                          final String phone =
                                              _phoneNumberController.text;
                                          context
                                              .read<PhoneRegisterCubit>()
                                              .phoneRegister(phone);

                                          /// not rebuilding
                                        }
                                      },
                                      child: Text(
                                        "Continuer",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ));
                                },
                              );
                            })
                                .animate(
                                  delay: const Duration(milliseconds: 900),
                                )
                                .fade(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                )
                                .moveY(begin: 20, end: 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const LoginTextBtn()
                      .animate(
                        delay: const Duration(milliseconds: 200),
                      )
                      .fadeIn(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
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
