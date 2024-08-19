
import 'package:flutter/material.dart';

import 'package:flutter_farabi_app/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackBtn extends StatelessWidget {
  final VoidCallback onPressed;
  const BackBtn({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      width: 50.w,
      height: 50.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.lightGray,
      ),
      child: IconButton(
        onPressed: onPressed,
        iconSize: 25.w,
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
