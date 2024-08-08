// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';
import 'package:flutter_farabi_app/features/card/data/menu_item.dart';
import 'package:flutter_farabi_app/features/card/presentation/widgets/drawer_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(34, 31, 30, 1),
        body: Center(
          child: Column(
            children: [
              Column(
                children: [
                  40.vs,
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(34, 31, 30, 1),
                    radius: 60,
                    child: Icon(
                      Icons.supervised_user_circle_sharp,
                      size: 120,
                      color: Color.fromRGBO(238, 238, 238, 1),
                    ),
                  ),
                  20.vs,
                  Text(
                    'User Name',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
                child: Column(
                  children: [
                    DrawerItem(icon: Icons.person_outline, title: "Profile"),
                    27.vs,
                    DrawerItem(icon: Icons.admin_panel_settings_outlined, title: "Utilisateur Pro"),
                    27.vs,
                    DrawerItem(icon: Icons.favorite_border_outlined, title: "Favoris"),
                    27.vs,
                    DrawerItem(icon:  Icons.notifications_outlined, title: "Notifications"),
                    27.vs,
                    DrawerItem(icon: Icons.supervisor_account_outlined, title: "Parrainage"),
                    27.vs,
                    Divider( color: Colors.white, thickness: 2,),
                    27.vs,
                    DrawerItem(icon: Icons.logout, title: "Déconnexion"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) => ListTile(
        minLeadingWidth: 20,
        leading: Icon(item.icon),
        title: Text(
          item.title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {},
      );
}

class MenuItems {
  static var profile = MenuItem('profile', Icons.person_outline_rounded);
  static var profilePro =
      MenuItem('Utilisateur Pro', Icons.admin_panel_settings_outlined);
  static var favoris = MenuItem('Favoris', Icons.favorite_border_outlined);
  static var notifications =
      MenuItem('Notifications', Icons.notifications_outlined);
  static var parrainage =
      MenuItem('parrainage', Icons.supervisor_account_outlined);
  static var histoire = MenuItem('Histoire', Icons.access_time_rounded);
  static var logout = MenuItem('Déconnexion', Icons.logout);

  static var all = <MenuItem>[
    profile,
    profilePro,
    favoris,
    notifications,
    parrainage,
    histoire,
    logout
  ];
}
