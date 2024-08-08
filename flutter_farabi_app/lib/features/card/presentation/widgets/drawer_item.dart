import 'package:flutter/material.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const DrawerItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          15.hs,
          Text(
            title,
            style: GoogleFonts.raleway(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
