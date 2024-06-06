import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Spacing on num {
  SizedBox get hs => SizedBox(width: this * ScreenUtil().scaleWidth);
  SizedBox get vs => SizedBox(height: this * ScreenUtil().scaleHeight);
}
