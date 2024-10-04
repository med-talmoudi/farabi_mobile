import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_farabi_app/core/extensions/datetime_extensions.dart';

import 'package:flutter_farabi_app/core/helpers/time_convertion.dart';

import 'package:flutter_farabi_app/features/card/presentation/widgets/no_history.dart';
import 'package:flutter_farabi_app/features/history/presentation/bloc/get_all_history/get_all_history_cubit.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AllHistory extends StatelessWidget {
  const AllHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllHistoryCubit, GetAllHistoryState>(
        builder: (context, state) {
      if (state is GetAllHistoryLoading) {
        return  SafeArea(
            child: Center(child: Padding(
              padding: EdgeInsets.only(top: 70.h),
              child: const CircularProgressIndicator(),
            )));
      } else if (state is GetAllHistoryError) {
        return Center(child: Text(state.errorString));
      } else if (state is GetAllHistoryLoaded) {
        final notificationList = state.data["notifications"] as List<dynamic>;
        if (notificationList.isNotEmpty) {
          for (var notificationItem in notificationList) {
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
                children: List.generate(notificationList.length, (index) {
                  var notificationItem = notificationList[index];
                  DateTime date = DateTime.parse(notificationItem["date"]);

                 
                  int oldPoints =
                      notificationItem["additionalData"]["oldPoints"];
                  int newPoints =
                      notificationItem["additionalData"]["newPoints"];

                  String body =
                      notificationItem["body"] ?? "Body not available";
                

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
                              titleAlignment: ListTileTitleAlignment
                                  .center, // Center the title
                              minLeadingWidth:
                                  0, // Min width for the leading widget
                              leading: SizedBox(
                                height:
                                    double.infinity, // Fill available height
                                child: SvgPicture.asset(
                                  'assets/img/barcode_icon.svg', // Path to the SVG file
                                  width: 25.w, // Set width for the icon
                                  height: 25.h, // Set height for the icon
                                ),
                              ),
                              title: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                   Text(
                                      date.timeAgo, // Update title text
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                          // color: AppConst.textPrimaryColor, // Set text color
                                          fontSize: 14.sp, // Set font size
                                          color: const Color.fromARGB(255, 175, 175, 175),
                                          fontWeight:
                                              FontWeight.w500, // Set font weight
                                        ),
                                      ),
                                    ),
                                  ],),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 10.h,
                                        bottom: 6.h), // Add padding below the title
                                    child: Text(
                                      body, // Update title text
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
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "$oldPoints pts",
                                    style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "$newPoints pts",
                                    style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )),
                        )
                            .animate(
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
                            )),
                  );
                }),
              ),
            );
          }
        } else {
        
          return Padding(
            padding:  EdgeInsets.only(top: 50.h),
            child: const Center(child:  NoHistoryWidget()),
          );
        }
      }

      return const Text("No data available");
    });
  }
}
