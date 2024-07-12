

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/core/theming/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_farabi_app/features/card/presentation/bloc/insert_card/insert_card_cubit.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../auth/presentation/widgets/error_modal.dart';

class InsertCard extends StatefulWidget {
  final String fullName;
  const InsertCard({super.key, required this.fullName});

  @override
  State<InsertCard> createState() => _InsertCardState();
}

class _InsertCardState extends State<InsertCard> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _cardNumberController = TextEditingController();

  final List<String> _subStrings = List.filled(4, '');

  @override
  void initState() {
    super.initState();
    _nomController.text = widget.fullName;

    _updateSubStrings(); // Call the method to set initial values
    _cardNumberController.addListener(_updateSubStrings);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _nomController.dispose();
    super.dispose();
  }

  void _updateSubStrings() {
    String text = _cardNumberController.text;
    // Ensure the text is exactly 13 characters long, padding with 'x' if necessary
    if (text.length < 13) {
      text = text.padRight(13, 'x');
    }

    // Initialize sub-strings for "x", "xxxx", "xxxx", "xxxx"
    _subStrings[0] = text.substring(0, 1); // The first character
    _subStrings[1] = text.substring(1, 5); // The next four characters
    _subStrings[2] = text.substring(5, 9); // The next four characters
    _subStrings[3] = text.substring(9, 13); // The last four characters

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),

        // leading: IconButton(
        //   onPressed: () {},
        //   icon: SvgPicture.asset(
        //     'assets/img/menu_icon.svg',
        //     width: 23,
        //     height: 23,
        //   ),
        // ),
        title: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: SizedBox(
            width: 100.w,
            height: 50.h,
            child: Stack(
              children: [
                Positioned(
                  top: 9.h,
                  left: 2.w,
                  child: SvgPicture.asset(
                    'assets/img/three_lines.svg',
                    width: 19.w,
                    height: 19.h,
                  ),
                ),
                Positioned(
                  bottom: 0.h,
                  right: 0.w,
                  child: Text(
                    'Carte',
                    style: GoogleFonts.raleway(
                      color: const Color.fromRGBO(43, 43, 43, 1),
                      fontSize: 33.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        actions: const [
          // IconButton(
          //   onPressed: () {},
          //   icon: SvgPicture.asset(
          //     'assets/img/notification_bell_marked.svg',
          //     width: 44,
          //     height: 44,
          //   ),
          // ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.vs,
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(129, 197, 197, 197).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3.h), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Row(
                              children: [
                                Image(
                                  image: const AssetImage(
                                    "assets/img/el_farabi_logo.png",
                                  ),
                                  width: 50.w,
                                  height: 50.h,
                                ),
                                6.hs,
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Image(
                                    image: const AssetImage(
                                      "assets/img/el_farabi_text.png",
                                    ),
                                    width: 110.w,
                                    height: 50.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     Icons.close,
                          //     size: 20,
                          //   ),
                          // ),
                        ],
                      ),
                      10.vs,
                      Padding(
                        padding: EdgeInsets.only(right: 40.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _subStrings[0],
                              style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(43, 43, 43, 1),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              _subStrings[1],
                              style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(43, 43, 43, 1),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              _subStrings[2],
                              style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(43, 43, 43, 1),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              _subStrings[3],
                              style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(43, 43, 43, 1),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(23.w, 20.h, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Propriétaire",
                              style: GoogleFonts.raleway(
                                color: const Color.fromRGBO(149, 149, 149, 1),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              _nomController.text,
                              style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(43, 43, 43, 1),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            18.vs
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              25.vs,
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      var res = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SimpleBarcodeScannerPage(
                            isShowFlashIcon: true,
                            scanType: ScanType.barcode,
                          ),
                        ),
                      );
                      setState(() {
                        if (res is String) {
                          _cardNumberController.text =
                              res; // Update result with scanned value
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/img/barcode_icon.svg',
                          width: 25.w,
                          height: 25.h,
                        ),
                        5.hs,
                        Text(
                          "Scan your card",
                          style: GoogleFonts.raleway(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.lightPink,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.vs,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      children: [
                        20.vs,
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ajout Nouvelle Carte",
                                style: GoogleFonts.raleway(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(66, 67, 71, 1)),
                              ),
                              25.vs,
                              Text(
                                'Nom Sur La Carte',
                                style: GoogleFonts.raleway(
                                  color: const Color.fromRGBO(26, 37, 48, 1),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              10.vs,
                              TextFormField(
                                controller: _nomController,
                                enabled: false,
                                readOnly: true,
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(247, 247, 249, 1),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              10.vs,
                              Text(
                                'Numéro Carte',
                                style: GoogleFonts.raleway(
                                  color: const Color.fromRGBO(26, 37, 48, 1),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              10.vs,
                              TextFormField(
                                maxLength: 13,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(13),
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                controller: _cardNumberController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Le numéro de la carte est requis';
                                  } else if (value.length != 13) {
                                    return 'Le numéro de la carte doit contenir 13 chiffres';
                                  }
                                  return null;
                                },
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(247, 247, 249, 1),
                                  hintText: "3 3282  3282  3282",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              30.vs,
                              BlocConsumer<InsertCardCubit, InsertCardState>(
                                listener: (context, state) {
                                  if (state is InsertCardLoaded) {
                                    Navigator.pushNamed(context, '/card');
                                  }
                                  if (state is InsertCardError) {
                                    CustomErrorModal(
                                            message: state.stringError,
                                            btnText: "Réessayer",
                                            onPressed: () =>
                                                Navigator.of(context).pop())
                                        .show(context);
                                  }
                                },
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      if (_formKey.currentState!.validate()) {
                                        context.read<InsertCardCubit>().addCard(
                                            _cardNumberController.text
                                                .toString());
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      minimumSize: Size(double.infinity, 50.h),
                                      backgroundColor:
                                          state is InsertCardLoading
                                              ? const Color.fromRGBO(
                                                  250, 177, 196, 1)
                                              : ColorManager.lightPink,
                                      foregroundColor: Colors.white,
                                      textStyle: GoogleFonts.raleway(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    child: state is InsertCardLoading
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
                                            "Ajout carte",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.raleway(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
