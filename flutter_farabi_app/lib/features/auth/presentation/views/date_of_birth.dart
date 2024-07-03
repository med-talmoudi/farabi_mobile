import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/core/widgets/custom_validate_button.dart';

import 'package:flutter_farabi_app/core/widgets/custom_cupertino_date_picker.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/back_btn.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/header.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/login_text_btn.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/sub_header.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main.dart';

class DateOfBirth extends StatefulWidget {
  const DateOfBirth({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  late final DateTime _minDate;
  late final DateTime _maxDate;
  late DateTime _selecteDate;

  @override
  void initState() {
    super.initState();
    final currentDate = DateTime.now();
    _minDate = DateTime(
      currentDate.year - 100,
      currentDate.month,
      currentDate.day,
    );
    _maxDate = DateTime(
      currentDate.year - 17,
      currentDate.month,
      currentDate.day,
    );
    _selecteDate = _maxDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  15.vs,
                  Row(
                    children: [
                      BackBtn(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                  15.vs,
                  const Header(text: "Date de naissance")
                      .animate(delay: const Duration(milliseconds: 300))
                      .fadeIn(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease)
                      .moveY(begin: -10.h, end: 0),
                  10.vs,
                  const SubHeader(
                          text:
                              "Rejoignez Para El Farabi et bénéficiez d'un monde de promos")
                      .animate(delay: const Duration(milliseconds: 400))
                      .fadeIn(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.ease)
                      .moveY(begin: -10.h, end: 0),
                  30.vs,
                  SizedBox(
                          height: 200.h,
                          child: CustomCupertinoDatePicker(
                            disabledStyle: TextStyle(
                              color: const Color.fromRGBO(255, 0, 0, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                            itemExtent: 40.h,
                            minDate: _minDate,
                            maxDate: _maxDate,
                            selectedDate: _selecteDate,
                            selectedStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                                fontSize: 15.sp,
                                fontFamily: 'Inter'),
                            unselectedStyle: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15.sp,
                                fontFamily: 'Inter'),
                            onSelectedItemChanged: (date) =>
                                _selecteDate = date,
                            diameterRatio: 5.0.r,
                            squeeze: 0.6.r,
                            selectionOverlay: Container(
                              width: double.infinity,
                              height: 50.h,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(217, 80, 116, 0.15),

                                //borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ))
                      .animate(delay: const Duration(milliseconds: 600))
                      .fadeIn(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease)
                      .moveY(begin: -10.h, end: 0),
                  50.vs,
                  CustomValidateButton(
                          text: "Suivant",
                          onPressed: () {
                            String month =
                                _selecteDate.month.toString().padLeft(2, '0');
                            String day = 
                                _selecteDate.day.toString().padLeft(2, '0');

                            String formattedDate =
                                "${_selecteDate.year}-$month-$day";
                          

                            box!.put('date', formattedDate);

                            Navigator.pushNamed(
                              context,
                              '/chooseGender',
                            );
                          })
                      .animate(delay: const Duration(milliseconds: 800))
                      .fadeIn(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease)
                      .moveY(begin: 20.h, end: 0),
                  85.vs,
                  const LoginTextBtn()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
