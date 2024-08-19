import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';

import '../../../../core/widgets/custom_side_drawer.dart';
import '../../../auth/presentation/widgets/custom_input.dart';

import '../../../auth/presentation/widgets/label_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final RegExp tunisianPhoneNumberRegExp = RegExp(r'^[23459]\d{7}$');
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
        backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
          leading: const CustomSideDrawer(),
          title: Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: SizedBox(
              width: 155.w,
              height: 50.h,
              child: Stack(
                children: [
                  Positioned(
                    top: 3.h,
                    left: 0.w,
                    child: SvgPicture.asset(
                      'assets/img/three_lines.svg',
                      width: 19.w,
                      height: 19.h,
                    ),
                  ),
                  Positioned(
                    bottom: 7.h,
                    right: 0,
                    left: 14.w,
                    child: Text(
                      'Profile',
                      style: GoogleFonts.raleway(
                        color: const Color.fromRGBO(43, 43, 43, 1),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            SizedBox(
              width: 60.w,
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/img/notification_bell_marked.svg',
                  width: 90.w,
                  height: 90.h,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    0.vs,
                    Icon(
                      Icons.supervised_user_circle_sharp,
                      size: 100.h,
                      color: Colors.black,
                    )
                        .animate(delay: const Duration(milliseconds: 300))
                        .fadeIn(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease)
                        .moveY(begin: -10.h, end: 0),
                    5.vs,
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LabelText(text: "Nom")
                              .animate(
                                  delay: const Duration(milliseconds: 400))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                          5.vs,
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor:
                                const Color.fromRGBO(106, 106, 106, 1),
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
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(142, 143, 179, 0.059),
                              hintText: "xxxxxxx",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          )
                              .animate(
                                  delay: const Duration(milliseconds: 400))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                          5.vs,
                          const LabelText(text: "Prénom")
                              .animate(
                                  delay: const Duration(milliseconds: 500))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                          5.vs,
                             TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor:
                                const Color.fromRGBO(106, 106, 106, 1),
                            controller: _prenomController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ce champs est obligatoire';
                              } else if (value.length < 3 ||
                                  value.length > 20) {
                                return 'Le prénom doit contenir entre 3 et 20 caractères';
                              } else if (!RegExp(r'^[a-zA-Z ]+$')
                                  .hasMatch(value)) {
                                return 'Le prénom ne doit contenir que des lettres';
                              }
                              return null;
                            },
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(142, 143, 179, 0.059),
                              hintText: "xxxxxxx",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          )
                             .animate(
                                  delay: const Duration(milliseconds: 500))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                          5.vs,
                          const LabelText(text: "Numéro de téléphone")
                              .animate(
                                  delay: const Duration(milliseconds: 600))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                          5.vs,
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
                              .animate(
                                  delay: const Duration(milliseconds: 400))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                              5.vs,
                          const LabelText(text: "Mot de passe")
                              .animate(
                                  delay: const Duration(milliseconds: 600))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                          5.vs,
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
                              .animate(
                                  delay: const Duration(milliseconds: 600))
                              .fadeIn(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.ease)
                              .moveY(begin: -10.h, end: 0),
                          30.vs,
                          ElevatedButton(
                            onPressed: () {},
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
                              "Enregistrer",
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
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.ease)
                              .moveY(begin: 30.h, end: 0),
                              40.vs
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: const Color.fromRGBO(247, 247, 249, 1),
          child: SizedBox(
            height: 80.h,
            width: MediaQuery.of(context).size.width, // Take full width
            child: const BottomNavBar(
              currentIndex: 3,
            ),
          ),
        ),
      ),
    );
  }
}
