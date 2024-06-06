// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter_farabi_app/core/theming/colors.dart';
import 'package:flutter_farabi_app/features/card/presentation/screens/card_history.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class InsertCard extends StatefulWidget {
  const InsertCard({super.key});

  @override
  State<InsertCard> createState() => _InsertCardState();
}

class _InsertCardState extends State<InsertCard> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _cardNumberController = TextEditingController();
  String _name = '';
  final List<String> _subStrings = List.filled(4, '');

  @override
  void initState() {
    super.initState();
    _updateSubStrings(); // Call the method to set initial values
    _cardNumberController.addListener(_updateSubStrings);
    _nomController.addListener(() {
      setState(() {
        _name =
            _nomController.text.isEmpty ? 'William Smith' : _nomController.text;
      });
    });
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _nomController.dispose();
    super.dispose();
  }

  void _updateSubStrings() {
    String text = _cardNumberController.text;
    for (int i = 0; i < 4; i++) {
      int startIndex = i * 4;
      int endIndex = startIndex + 4;
      if (startIndex < text.length) {
        if (endIndex <= text.length) {
          _subStrings[i] = text.substring(startIndex, endIndex);
        } else {
          _subStrings[i] = text.substring(startIndex);
        }
      } else {
        _subStrings[i] = 'xxxx'; // Set alternative text when substring is empty
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),

        // leading: IconButton(
        //   onPressed: () {},
        //   icon: SvgPicture.asset(
        //     'assets/img/menu_icon.svg',
        //     width: 23,
        //     height: 23,
        //   ),
        // ),
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SizedBox(
            width: 100,
            height: 50,
            child: Stack(
              children: [
                Positioned(
                  top: 6,
                  left: 2,
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/img/three_lines.svg',
                      width: 19,
                      height: 19,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    child: Text(
                      'Carte',
                      style: GoogleFonts.raleway(
                        color: Color.fromRGBO(43, 43, 43, 1),
                        fontSize: 33,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        actions: [
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
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(129, 197, 197, 197).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
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
                                    image: AssetImage(
                                      "assets/img/el_farabi_logo.png",
                                    ),
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Image(
                                      image: AssetImage(
                                        "assets/img/el_farabi_text.png",
                                      ),
                                      width: 110,
                                      height: 50,
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
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                _subStrings[0],
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(43, 43, 43, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                _subStrings[1],
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(43, 43, 43, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                _subStrings[2],
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(43, 43, 43, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                _subStrings[3],
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(43, 43, 43, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(23, 25, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Propriétaire",
                                style: GoogleFonts.raleway(
                                  color: const Color.fromRGBO(149, 149, 149, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                _name.isEmpty ? 'William Smith' : _name,
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(43, 43, 43, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 28,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
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
                          width: 25,
                          height: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Scan your card",
                          style: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.lightPink,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ajout Nouvelle Carte",
                                style: GoogleFonts.raleway(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(66, 67, 71, 1)
                                ),
                              ),
                                SizedBox(
                          height: 25,
                        ),
                              Text(
                                'Nom Sur La Carte',
                                style: GoogleFonts.raleway(
                                  color: const Color.fromRGBO(26, 37, 48, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _nomController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Le nom est requis';
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
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(247, 247, 249, 1),
                                  hintText: "xxxxxxx",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Numéro Carte',
                                style: GoogleFonts.raleway(
                                  color: const Color.fromRGBO(26, 37, 48, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(16),
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                controller: _cardNumberController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Le numéro de la carte est requis';
                                  } else if (value.length != 16) {
                                    return 'Le numéro de la carte doit contenir 16 chiffres';
                                  }
                                  return null;
                                },
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(247, 247, 249, 1),
                                  hintText: "3282  3282  3282  3282",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const CardHistory(),
                                          type: PageTransitionType.fade));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  minimumSize: const Size(double.infinity, 60),
                                  backgroundColor:
                                      const Color.fromRGBO(217, 80, 116, 1),
                                  foregroundColor: Colors.white,
                                  textStyle: GoogleFonts.raleway(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                child: Text(
                                  "Ajout carte",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              )
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
