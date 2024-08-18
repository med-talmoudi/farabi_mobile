// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_farabi_app/core/extensions/spacing.dart';

import 'package:flutter_farabi_app/features/card/presentation/widgets/drawer_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../main.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final dynamic userName= box!.get('userName');
   String capitalizeFirstLetterOfEachWord(String str) {
    return str.split(' ').map((word) {
      if (word.isEmpty) return word;
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).join(' ');


  }

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(34, 31, 30, 1),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    10.vs,
                    Padding(
                      padding: const EdgeInsets.only(left: 20,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          
                          IconButton(
                              onPressed: (){
                                if (ZoomDrawer.of(context)!.isOpen()) {
                  ZoomDrawer.of(context)!.close();
                }else{}
                              },
                              icon:Icon(Icons.arrow_back_ios, color: Colors.white, size:36 ,), 
                              //replace with our own icon data.
                          ),
                          ]
                      ),
                    ),
                    0.vs,
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
                    Padding(
                      padding:  EdgeInsets.only(left: 8.w),
                      child: Text(
                        capitalizeFirstLetterOfEachWord(userName.toString()) ,
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w700,
                        ),
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
                      DrawerItem(
                          icon: Icons.admin_panel_settings_outlined,
                          title: "Utilisateur Pro"),
                      27.vs,
                      DrawerItem(
                          icon: Icons.favorite_border_outlined, title: "Favoris"),
                      27.vs,
                      DrawerItem(
                          icon: Icons.notifications_outlined,
                          title: "Notifications"),
                      27.vs,
                      DrawerItem(
                          icon: Icons.supervisor_account_outlined,
                          title: "Parrainage"),
                      27.vs,
                      Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      17.vs,
                      
                      InkWell(
                         splashFactory: InkRipple.splashFactory,
                        onTap: () {
                          box!.put('token', null);
                           Navigator.pushNamed(
                                context,
                                '/login',);
                          
                        },
                      splashColor: Colors.white.withOpacity(0.3),
                      
                        child: SizedBox(
                          height: 40.h,
                          child: Row(
                            children: [
                              Icon(Icons.logout ,color: Colors.white,),
                              15.hs,
                              Text(
                                "Déconnexion",
                                style: GoogleFonts.raleway(
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

