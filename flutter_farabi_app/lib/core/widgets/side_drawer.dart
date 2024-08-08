import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomSideDrawer extends StatefulWidget {
  const CustomSideDrawer({super.key});

  @override
  State<CustomSideDrawer> createState() => _CustomSideDrawerState();
}

class _CustomSideDrawerState extends State<CustomSideDrawer> {
  @override
  Widget build(BuildContext context) {
    return  IconButton(
              onPressed: () { 
                if (ZoomDrawer.of(context)!.isOpen()) {
                  ZoomDrawer.of(context)!.close();
                }else{ZoomDrawer.of(context)!.open();}
                
                
              },
              icon: SvgPicture.asset(
                'assets/img/menu_icon.svg',
                width: 23.w,
                height: 23.h,
              ),
            )
           ;
  }
}