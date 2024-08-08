import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/phone_Input_field/phone_input_field_cubit.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/pre_register/phone_register_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../main.dart';
import '../widgets/error_modal.dart';
import '../widgets/header.dart';
import '../widgets/label_text.dart';
import '../widgets/login_text_btn.dart';
import '../widgets/sub_header.dart';

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
                  const Header(
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
                  const SubHeader(
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
                            const LabelText(
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
                            

                            BlocConsumer<PhoneInputFieldCubit,
                                    PhoneInputFieldState>(
                              listener: (context, state) {
                                if (state is PhoneInputFieldValid) {
                                   FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                }
                              },
                              builder: (context, state) {
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
                                        .read<PhoneInputFieldCubit>()
                                        .phoneField(value);
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
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(
                                          163, 163, 163, 1),
                                    ),
                                    suffixIcon: state is PhoneInputFieldInitial
                                        ? null
                                        : state is PhoneInputFieldInvalid
                                            ? const Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                              )
                                            : const Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              ),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(247, 247, 249, 1),
                                    hintText: "20 000 000",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                      borderSide:  state
                                              is PhoneInputFieldInvalid
                                          ? BorderSide(
                                              width: 1.w,
                                              color: const Color.fromRGBO(
                                                  221, 44, 87, 1), // Pink color
                                            )
                                          : BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                      borderSide:  state
                                              is PhoneInputFieldInvalid
                                          ? BorderSide(
                                              width: 1.w,
                                              color: const Color.fromRGBO(
                                                  221, 44, 87, 1), // Pink color
                                            )
                                          : BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                      borderSide: state
                                              is PhoneInputFieldInvalid
                                          ? BorderSide(
                                              width: 1.w,
                                              color: const Color.fromRGBO(
                                                  221, 44, 87, 1), // Pink color
                                            )
                                          : BorderSide.none,
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                      borderSide: state
                                              is PhoneInputFieldInvalid
                                          ? BorderSide(
                                              width: 1.w,
                                              color: const Color.fromRGBO(
                                                  221, 44, 87, 1), // Pink color
                                            )
                                          : BorderSide.none,
                                    ),
                                  ),
                                );
                              },
                            )
                                .animate(
                                  delay: const Duration(milliseconds: 600),
                                )
                                .fade(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                )
                                .moveY(begin: -10, end: 0),
                            50.vs,
                            BlocConsumer<PhoneRegisterCubit,
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

                                  if (registerState.stringError ==
                                      "L'utilisateur existe déjà") {
                                    CustomErrorModal(
                                        message: registerState.stringError,
                                        btnText: "Se connecter",
                                        onPressed: () => Navigator.pushNamed(
                                            context, '/login')).show(context);
                                  } else {
                                    CustomErrorModal(
                                            message: registerState.stringError,
                                            btnText: "Réessayer",
                                            onPressed: () =>
                                                Navigator.of(context).pop())
                                        .show(context);
                                  }
                                }
                              },
                              builder: (context, registerState) {
                                if (registerState is PhoneRegisterLoading) {
                                  isLoading = true;
                                  return ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r)),
                                        minimumSize:
                                            Size(double.infinity, 50.h),
                                        backgroundColor: const Color.fromRGBO(
                                            250,
                                            177,
                                            196,
                                            1), // Background color
                                        foregroundColor: Colors.white,
                                        textStyle: GoogleFonts.raleway(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                        ), // Text color
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
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      minimumSize: Size(double.infinity, 50.h),
                                      backgroundColor:
                                          const Color.fromRGBO(217, 80, 116, 1),

                                      // Background color

                                      foregroundColor:
                                          Colors.white, // Text color
                                      textStyle: GoogleFonts.raleway(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () {
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
                            )
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
