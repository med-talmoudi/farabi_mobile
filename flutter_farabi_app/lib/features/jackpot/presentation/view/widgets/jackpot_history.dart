import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_farabi_app/core/helpers/time_convertion.dart';

import 'package:flutter_farabi_app/features/jackpot/presentation/bloc/get_jackpot_history/get_jackpot_history_cubit.dart';
import 'package:flutter_farabi_app/features/jackpot/presentation/view/widgets/no_jackpot_history.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class JackpotHistory extends StatelessWidget {
  const JackpotHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetJackpotHistoryCubit, GetJackpotHistoryState>(
        builder: (context, state) {
      if (state is GetJackpotHistoryLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is GetJackpotHistoryError) {
        return Center(child: Text(state.errorString));
      } else if (state is GetJackpotHistoryLoaded) {
        final historyList = state.data["history"] as List<dynamic>;
        if (historyList.isNotEmpty) {
          for (var historyItem in historyList) {
            return DecoratedBox(
              decoration: ShapeDecoration(
                // color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x28D4D4D4),
                    blurRadius: 40,
                    offset: Offset(0, 20),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: List.generate(historyList.length, (index) {
                  var historyItem = historyList[index];
                  DateTime dateAchat = DateTime.parse(historyItem["dateAchat"]);

                  // String montantAchat = historyItem["montantAchat"] ?? "Amount not available";
                  String points =
                      historyItem["points"] ?? "Points not available";
                  String pointDeVente = historyItem["pointDeVente"] ??
                      "pointDeVente not available";

                  return DecoratedBox(
                    decoration: ShapeDecoration(
                      // add color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.r), // Set the border radius
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x28D4D4D4), // Set the shadow color
                          blurRadius: 40,
                          offset: Offset(0, 20),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 6.h),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: ListTile(
                          minVerticalPadding: 12.h, // Set vertical padding
                          titleAlignment:
                              ListTileTitleAlignment.center, // Center the title
                          minLeadingWidth:
                              0, // Min width for the leading widget
                          leading: SizedBox(
                            height: double.infinity, // Fill available height
                            child: SvgPicture.asset(
                              'assets/img/barcode_icon.svg', // Path to the SVG file
                              width: 25.w, // Set width for the icon
                              height: 25.h, // Set height for the icon
                            ),
                          ),
                          title: Padding(
                            padding: EdgeInsets.only(
                                bottom: 6.h), // Add padding below the title
                            child: Text(
                              "Vous avez converti $points points fid à $pointDeVente", // Update title text
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                  // color: AppConst.textPrimaryColor, // Set text color
                                  fontSize: 14.sp, // Set font size
                                  fontWeight:
                                      FontWeight.w500, // Set font weight
                                ),
                              ),
                            ),
                          ),
                          subtitle: dateAchat == null
                              ? null // Check if dateAchat is null
                              : Text(
                                  TimeConvertion.historyConvert(
                                      dateAchat), // Convert date
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      // color: AppConst.textSecondaryColor,
                                      fontSize: 12.sp, // Set subtitle font size
                                    ),
                                  ),
                                ),
                        ),
                      ).animate(
                                  delay: const Duration(milliseconds: 400),
                                )
                                .fade(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                )
                                .moveX(
                                  begin: -10,
                                  end: 0,
                                  duration: const Duration(milliseconds: 200),
                                )
                   
                    ),
                  );
                }),
              ),
            );
          }
        } else {
          print("No history items available.");
          return const NoJackpotHistory();
        }
      }

      return const Text("No data available");
    });
  }
}
