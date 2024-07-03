import 'package:flutter/material.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(14, 14, 12, 1),
              ),
            ),
          ],
        ),
        22.vs,
        const ListItem(
          title: 'Scan Code à bar Para El Farabi lac1',
          subtitle1: '12/03/2024 - 14h30',
        ),
        16.vs,
          const ListItem(
          title: 'Scan Code à bar Para El Farabi lac1',
          subtitle1: '12/03/2024 - 14h30',
        ),
        16.vs,
          const ListItem(
          title: 'Scan Code à bar Para El Farabi lac1',
          subtitle1: '12/03/2024 - 14h30',
        ),
        16.vs,
      
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
      padding:  EdgeInsets.all(16.0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/img/barcode_icon.svg', // Path to the SVG file
            width: 25.w,
            height: 25.h,
          ),
          8.vs , // Horizontal spacing between icon and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  color: const Color.fromRGBO(14, 14, 12, 1),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.vs, // Vertical spacing between title and subtitle
              Text(
                subtitle1,
                style: GoogleFonts.inter(
                  color: const Color.fromRGBO(128, 134, 138, 1),
                  fontSize: 11.sp,
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
