import 'package:flutter/material.dart';
import 'package:flutter_farabi_app/features/card/presentation/screens/card_space.dart';

import 'package:flutter_farabi_app/features/card/presentation/screens/menu_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CardHome extends StatefulWidget {
  const CardHome({super.key});

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  final zoomDrawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
     return ZoomDrawer(
      menuBackgroundColor: const Color.fromRGBO(34, 31, 30, 1),
      controller: zoomDrawerController,
      borderRadius: 40.r,
      slideWidth: MediaQuery.of(context).size.width * 0.8,
      angle: -10,
      showShadow: true,
      drawerShadowsBackgroundColor: Colors.pinkAccent,
      menuScreen: const MenuScreen(), mainScreen: const CardSpace());
  
  }
}
