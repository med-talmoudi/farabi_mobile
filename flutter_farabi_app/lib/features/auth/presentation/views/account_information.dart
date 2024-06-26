import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/header.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/label_text.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/sub_header.dart';

import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../main.dart';
import '../widgets/custom_input.dart';
import '../widgets/login_text_btn.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _AccountInformationState createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscure = true;
  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.vs,
                  const Header(text: "Création de compte")
                      .animate(delay: const Duration(milliseconds: 200))
                      .fadeIn(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease)
                      .moveY(begin: -10.h, end: 0),
                  10.vs,
                  const SubHeader(
                          text:
                              "Rejoignez Para El Farabi et bénéficiez d'un monde de promos")
                      .animate(delay: const Duration(milliseconds: 300))
                      .fadeIn(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(begin: -10.h, end: 0),
                  20.vs,
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LabelText(text: "Nom")
                                .animate(delay: const Duration(milliseconds: 400))
                                .fadeIn(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.ease)
                                .moveY(begin: -10.h, end: 0),
                            10.vs,
                            CustomInputTextField(
                                keyboardType: TextInputType.text,
                              action: TextInputAction.next,
                              controller: _nomController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Ce champs est obligatoire';
                                } else if (value.length < 3 ||
                                    value.length > 20) {
                                  return 'Le nom doit contenir entre 3 et 20 caractères';
                                } else if (!RegExp(r'^[a-zA-Z ]+$')
                                    .hasMatch(value)) {
                                  return 'Le nom ne doit contenir que des lettres';
                                }
                                return null;
                              },
                              hintText: "xxxxxxx",
                            )
                                .animate(delay: const Duration(milliseconds: 400))
                                .fadeIn(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.ease)
                                .moveY(begin: -10.h, end: 0),
                            10.vs,
                            const LabelText(text: "Prénom")
                                .animate(delay: const Duration(milliseconds: 500))
                                .fadeIn(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease)
                                .moveY(begin: -10.h, end: 0),
                            10.vs,
                            CustomInputTextField(
                                keyboardType: TextInputType.text,
                              action: TextInputAction.next,
                              controller: _prenomController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Ce champs est obligatoire ';
                                } else if (value.length < 3 ||
                                    value.length > 20) {
                                  return 'Le prénom doit contenir entre 3 et 20 caractères';
                                } else if (!RegExp(r'^[a-zA-Z ]+$')
                                    .hasMatch(value)) {
                                  return 'Le prénom ne doit contenir que des lettres';
                                }
                                return null;
                              },
                              hintText: "xxxxxxx",
                            )
                                .animate(delay: const Duration(milliseconds: 500))
                                .fadeIn(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease)
                                .moveY(begin: -10.h, end: 0),
                            10.vs,
                            const LabelText(text: "Mot de passe")
                                .animate(delay: const Duration(milliseconds: 600))
                                .fadeIn(
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.ease)
                                .moveY(begin: -10.h, end: 0),
                            10.vs,
                            CustomInputTextField(
                              keyboardType: TextInputType.text,
                              action: TextInputAction.done,
                              controller: _passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Ce champs est obligatoire';
                                } else if (value.length < 8) {
                                  return 'Le mot de passe doit contenir au moins 8 characteres';
                                } else if (value.length > 16) {
                                  return "Le mot de passe ne doit pas dépasser 16 caractères";
                                } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                  return 'Le mot de passe doit contenir au moins une majuscule';
                                } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                                  return 'Le mot de passe doit contenir au moins une minuscule';
                                } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                                  return 'Le mot de passe doit contenir au moins un chiffre';
                                } else if (!RegExp(r'(?=.*[\W_])')
                                    .hasMatch(value)) {
                                  return 'Le mot de passe doit contenir au moins un charactere special';
                                }
                                return null;
                              },
                              hintText: "* * * * * * * *",
                              obscureText: isObscure,
                            )
                                .animate(delay: const Duration(milliseconds: 600))
                                .fadeIn(
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.ease)
                                .moveY(begin: -10.h, end: 0),
                            30.vs,
                            ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                if (_formKey.currentState!.validate()) {
                                  final String name = _nomController.text
                                      .toString()
                                      .trim()
                                      .toLowerCase();
                                  final String lastName = _prenomController.text
                                      .toString()
                                      .trim()
                                      .toLowerCase();
                                  final String password =
                                      _passwordController.text.toString().trim();
                                  box!.put('name', name);
                                  box!.put('lastName', lastName);
      
                                  box!.put('password', password);
      
                                  Navigator.pushNamed(
                                    context,
                                    '/datepicker',
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                minimumSize: Size(double.infinity, 50.h),
                                backgroundColor:
                                    const Color.fromRGBO(217, 80, 116, 1),
                                foregroundColor: Colors.white,
                                textStyle: GoogleFonts.raleway(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              child: Text(
                                "Suivant",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                                .animate(delay: const Duration(milliseconds: 800))
                                .fadeIn(
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.ease)
                                .moveY(begin: 30.h, end: 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Expanded(flex: 0, child: LoginTextBtn())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
