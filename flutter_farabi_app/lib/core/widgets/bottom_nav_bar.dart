// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter_farabi_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class BottomNavBar extends StatefulWidget {
  final String id;
  const BottomNavBar({super.key, required this.id});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late String id ;
  int currentIndex = 1;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    id = widget.id;  // Initialize 'id' with the value from the widget
  }

  @override
  Widget build(BuildContext context) {
     
  
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(55),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: 80,
              child: Stack(
                // overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.4,
                    child: FloatingActionButton(
                      backgroundColor: ColorManager.lightPink,
                      shape: const CircleBorder(),
                      elevation: 0.1,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (BuildContext context) {
                            return BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 40),
                                      Text(
                                        "QR code",
                                        style: GoogleFonts.raleway(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromRGBO(
                                              74, 74, 74, 1),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Text(
                                          "Présentez ce QR code pour tous vos achats!",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.raleway(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                74, 74, 74, 1),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      // SvgPicture.asset(
                                      //   'assets/img/qr_code.svg',
                                      //   width: 190,
                                      //   height: 190,
                                      // ),

                                      SizedBox(width: 200,
                                      height: 200,
                                        child: 
                                        
                                       
                                        
                                        PrettyQrView.data(
                                          data: id,
                                          decoration: const PrettyQrDecoration(
                                            image: PrettyQrDecorationImage(
                                              scale: 0.35,
                                              image: AssetImage(
                                                
                                                  "assets/img/el_farabi_logo.png"),
                                            ),
                                          ),
                                        ),
                                        
                                      ),
                                      const SizedBox(height: 30),
                                      ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          minimumSize:
                                              const Size(double.infinity, 60),
                                          backgroundColor: const Color.fromRGBO(
                                              217, 80, 116, 1),
                                          foregroundColor: Colors.white,
                                          textStyle: GoogleFonts.raleway(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        child: Text("C'est Bon!",
                                            style: GoogleFonts.raleway(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/img/scan_icon.svg',
                        width: 23,
                        height: 23,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // IconButton(
                        //   icon: Icon(
                        //     Icons.home_sharp,
                        //     color: currentIndex == 0
                        //         ? Colors.orange
                        //         : const Color.fromARGB(255, 255, 255, 255),
                        //   ),
                        //   onPressed: () {
                        //     setBottomBarIndex(0);
                        //   },
                        //   splashColor: Colors.white,
                        // ),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/img/home_icon.svg',
                            width: 23,
                            height: 23,

                            color: currentIndex == 0
                                ? ColorManager.lightPink
                                : null,
                            // Apply color filter to change color
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/img/bag_icon.svg',
                            width: 23,
                            height: 23,
                            color: currentIndex == 1
                                ? ColorManager.lightPink
                                : null,
                            // Apply color filter to change color
                          ),
                          onPressed: () {
                            setBottomBarIndex(1);
                          },
                          splashColor: Colors.white,
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/img/notification_bottom_navbar_icon.svg',
                            width: 23,
                            height: 23,
                            color: currentIndex == 2
                                ? ColorManager.lightPink
                                : null,
                            // Apply color filter to change color
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/img/profile_icon.svg',
                            width: 23,
                            height: 23,
                            color: currentIndex == 3
                                ? ColorManager.lightPink
                                : null,
                            // Apply color filter to change color
                          ),
                          onPressed: () {
                            setBottomBarIndex(3);
                          },
                          splashColor: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 253, 253, 253)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, -25); // Start
    path.quadraticBezierTo(size.width * 0.0, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);

    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 1.00, 0, size.width, -25);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
