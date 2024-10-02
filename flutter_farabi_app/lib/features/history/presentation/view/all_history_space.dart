import 'package:flutter/material.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/back_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AllHistorySpace extends StatelessWidget {
  const AllHistorySpace({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: BackBtn(onPressed: () {
              Navigator.of(context).pop();
          },
        ),
        title:  Text(
                        "Notifications",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
      ),
      
      
      body: SafeArea(child: SingleChildScrollView(
        
      )) ,
      ),
    )
    ;
  }
}