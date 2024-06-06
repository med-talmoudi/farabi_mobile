import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';



class NoHistoryWidget extends StatelessWidget {
  const NoHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text(
            "Historique",
            style: GoogleFonts.raleway(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(14, 14, 12, 1),
            ),
          ),
        ],
      ),
      SvgPicture.asset(
        'assets/img/no_history_image.svg',
        width: 226,
        height: 181,
      ),
      Text(
        "Pas d’Historique de Scan",
        style: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: const Color.fromRGBO(74, 74, 74, 1),
        ),
      ),
      Text(
        "Voir les dernières Offres",
        style: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(74, 74, 74, 1),
        ),
      ),
    ]);
  }
}
