

import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/user_login/user_login_cubit.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/header.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/custom_input.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/label_text.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/sub_header.dart';
import 'package:flutter_farabi_app/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theming/colors.dart';
import '../widgets/back_btn.dart';
import '../widgets/error_modal.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();
  // final _codeController = TextEditingController();
  final RegExp tunisianPhoneNumberRegExp = RegExp(r'^[23459]\d{7}$');
  bool isObscurePwd = true;
  bool isObscureCode = true;
   String capitalizeFirstLetterOfEachWord(String str) {
  return str.split(' ').map((word) {
    if (word.isEmpty) return word;
    return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
  }).join(' ');}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    12.vs,
                    Row(
                      children: [
                        BackBtn(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              "/register",
                            );
                          },
                        )
                      ],
                    ),
                    5.vs,
                    const Header(text: "Bienvenue!")
                        .animate(delay: const Duration(milliseconds: 200))
                        .fadeIn(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease)
                        .moveY(begin: -10.h, end: 0),
                    10.vs,
                    const SubHeader(
                            text:
                                "Veuillez saisir vos identifiants pour accéder à votre compte")
                        .animate(delay: const Duration(milliseconds: 300))
                        .fadeIn(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease)
                        .moveY(begin: -10.h, end: 0),
                    25.vs,
                    Form(
                      key: _loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              LabelText(text: "Numéro de téléphone"),
                              Text(
                                '*', // Asterisk indicating required field
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          )
                              .animate(delay: const Duration(milliseconds: 400))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                          10.vs,
                          CustomInputTextField(
                            action: TextInputAction.next,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(8),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            keyboardType: TextInputType.number,
                            hintText: "20 000 000",
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
                          )
                              .animate(delay: const Duration(milliseconds: 400))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                          10.vs,
                          const Row(
                            children: [
                              LabelText(text: "Mot de passe"),
                              Text(
                                '*', // Asterisk indicating required field
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          )
                              .animate(delay: const Duration(milliseconds: 600))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                          10.vs,
                          CustomInputTextField(
                            keyboardType: TextInputType.text,
                            action: TextInputAction.done,
                            hintText: "* * * * * * * *",
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez saisir votre mot de passe';
                              }
                             
                              return null;
                            },
                            obscureText: isObscurePwd,
                          )
                              .animate(delay: const Duration(milliseconds: 600))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                          10.vs,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/reset',
                                  );
                                },
                                child: Text(
                                  "Mot de passe oublié ?",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(112, 123, 129, 1),
                                  ),
                                ),
                              )
                                  .animate(
                                      delay: const Duration(milliseconds: 700))
                                  .fadeIn(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease)
                                  .moveX(begin: 30.w, end: 0),
                            ],
                          ),
                          // const LabelText(text: "Code parrainage")
                          //     .animate(delay: const Duration(milliseconds: 800))
                          //     .fadeIn(
                          //         duration: const Duration(milliseconds: 300),
                          //         curve: Curves.ease)
                          //     .moveY(begin: -10.h, end: 0),
                          // 10.vs,
                          // TextFormField(
                          //   textInputAction: TextInputAction.done,
                          //   controller: _codeController,
                          //   style: GoogleFonts.poppins(
                          //     fontSize: 16.sp,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          //   obscureText: isObscureCode,
                          //   keyboardType: TextInputType.text,
                          //   enabled: false,
                          //   decoration: InputDecoration(
                          //     hintText: "* * * * * * * *",
                          //     filled: true,
                          //     fillColor: const Color.fromRGBO(247, 247, 249, 1),
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(20.r),
                          //       borderSide: BorderSide.none,
                          //     ),
                          //     suffixIcon: IconButton(
                          //       icon: isObscureCode
                          //           ? const Icon(Icons.visibility_off_outlined,
                          //               color: Color.fromRGBO(106, 106, 106, 1))
                          //           : const Icon(Icons.visibility,
                          //               color: Color.fromRGBO(106, 106, 106, 1)),
                          //       onPressed: () {
                          //         setState(() {
                          //           isObscureCode = !isObscureCode;
                          //         });
                          //       },
                          //     ),
                          //   ),
                          // )
                          //     .animate(delay: const Duration(milliseconds: 800))
                          //     .fadeIn(
                          //         duration: const Duration(milliseconds: 300),
                          //         curve: Curves.ease)
                          //     .moveY(begin: -10.h, end: 0),
                          30.vs,
                          BlocConsumer<UserLoginCubit, UserLoginState>(
                            listener: (context, state) {
                              if (state is UserLoginLoaded) {
                               
                                box!.put('token', state.token);
                                box!.put('userName', state.fullName);
                                print(state.token);
                                  print(state.fullName);
                                if (state.hasCard == true) {
                                  Navigator.pushNamed(
                                    context,
                                    '/card_home',
                                   
                                  );
                                  
                                } else {
                                  String fullName = capitalizeFirstLetterOfEachWord(state.fullName.toString());
                                  
                                  Navigator.pushNamed(context, '/add_card',
                                      arguments: fullName);
                                
                                }
                              }
                              if (state is UserLoginError) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                CustomErrorModal(
                                        message: state.stringError,
                                        btnText: "Réessayer",
                                        onPressed: () =>
                                            Navigator.of(context).pop())
                                    .show(context);
                              }
                            },
                            builder: (context, state) {
                              if (state is UserLoginLoading) {
                               
                              }
                              return ElevatedButton(
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  if (_loginFormKey.currentState!.validate()) {
                                    context.read<UserLoginCubit>().userLogin(
                                        _numberController.text,
                                        _passwordController.text);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  minimumSize: Size(double.infinity, 50.h),
                                  backgroundColor: state is UserLoginLoading
                                      ? const Color.fromRGBO(250, 177, 196, 1)
                                      : ColorManager
                                          .lightPink, // Background color
                                  foregroundColor: Colors.white, // Text color
                                  textStyle: GoogleFonts.raleway(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                child: state is UserLoginLoading
                                    ? SizedBox(
                                        width: 20.w,
                                        height: 20.h,
                                        child: const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 1,
                                        ),
                                      )
                                    : Text(
                                        "Se Connecter",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              )
                                  .animate(
                                      delay: const Duration(milliseconds: 800))
                                  .fadeIn(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease)
                                  .moveY(begin: 20.h, end: 0);
                            },
                          ),
                        ],
                      ),
                    ),
                    120.vs,
                    Container(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/register',
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Nouvel utilisateur? ",
                                style: GoogleFonts.raleway(
                                  fontSize: 15.sp,
                                  color: const Color.fromRGBO(
                                      106, 106, 106, 1), // Light grey color
                                ),
                              ),
                              TextSpan(
                                text: "Création de compte",
                                style: GoogleFonts.raleway(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600, // Bold
                                  color: const Color.fromRGBO(
                                      26, 29, 30, 1), // Black color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                        .animate(
                          delay: const Duration(milliseconds: 200),
                        )
                        .fadeIn(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                        ),
                  ]),
            ),
          ),
        )),
      ),
    );
  }
}
