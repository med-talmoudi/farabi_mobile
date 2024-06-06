import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HasHistory extends StatelessWidget {
  const HasHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const SizedBox(
          height: 22,
        ),
        const ListItem(
          title: 'Scan Code à bar Para El Farabi lac1',
          subtitle1: '12/03/2024 - 14h30',
        ),
        const SizedBox(
          height: 16,
        ),
          const ListItem(
          title: 'Scan Code à bar Para El Farabi lac1',
          subtitle1: '12/03/2024 - 14h30',
        ),
        const SizedBox(
          height: 16,
        ),
          const ListItem(
          title: 'Scan Code à bar Para El Farabi lac1',
          subtitle1: '12/03/2024 - 14h30',
        ),
        const SizedBox(
          height: 16,
        ),
      
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final String subtitle1;

  const ListItem({
    super.key,
    required this.title,
    required this.subtitle1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/img/barcode_icon.svg', // Path to the SVG file
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 8), // Horizontal spacing between icon and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  color: const Color.fromRGBO(14, 14, 12, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                  height: 8), // Vertical spacing between title and subtitle
              Text(
                subtitle1,
                style: GoogleFonts.inter(
                  color: const Color.fromRGBO(128, 134, 138, 1),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
