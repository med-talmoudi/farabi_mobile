// ignore_for_file: prefer_const_constructors

import 'package:flutter_farabi_app/core/theming/colors.dart';
import 'package:flutter_farabi_app/features/card/presentation/screens/insert_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckCard extends StatelessWidget {
  const CheckCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(134, 134, 134, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage(
                          "assets/img/card.png",
                        ),
                        width: 250,
                        height: 200,
                      ),
                      Text(
                        "Pas De Cartes Fid!",
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(74, 74, 74, 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Merci d’ajouter Vos Cartes de Fidélité",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(74, 74, 74, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle onTap action
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 80, 116, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Genérer E-Card",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                         const InsertCard()));
                        },
                        child: Container(
                          height: 60,
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
                              "Ajout Carte",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.lightPink,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 45,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
