// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

// import 'package:flutter_farabi_app/core/widgets/bottom_nav_bar.dart';
// import 'package:flutter/material.dart';


// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../../core/theming/colors.dart';
// import '../../presentation/widgets/has_history.dart';
// import '../../presentation/widgets/no_history.dart';


// class CardHistory extends StatefulWidget {
//   const CardHistory({super.key});

//   @override
//   State<CardHistory> createState() => _CardHistoryState();
// }

// class _CardHistoryState extends State<CardHistory> {
//    bool isToggled = false;

   
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(247, 247, 249, 1),

//       // backgroundColor: Colors.amber,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color.fromRGBO(247, 247, 249, 1),
//         leading: IconButton(
//           onPressed: () {},
//           icon: SvgPicture.asset(
//             'assets/img/menu_icon.svg',
//             width: 23,
//             height: 23,
//           ),
//         ),
//         title: Padding(
//           padding: const EdgeInsets.only(top: 5),
//           child: SizedBox(
//             width: 100,
//             height: 50,
          
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: 6,
//                   left: 2,
//                   child: Container(
//                     child: SvgPicture.asset(
//                       'assets/img/three_lines.svg',
//                       width: 19,
//                       height: 19,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: Container(
//                     child: Text(
//                       'Carte',
//                       style: GoogleFonts.raleway(
//                         color: Color.fromRGBO(43, 43, 43, 1),
//                         fontSize: 33,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
                    
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           SizedBox(
//             width: 60,
//             child: IconButton(
//               onPressed: () {},
//               icon: SvgPicture.asset(
//                 'assets/img/notification_bell_marked.svg',
//                 width: 90,
//                 height: 90,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Container(
//               child: Column(
//                 children: [
                
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 255, 255, 255),
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color.fromARGB(129, 197, 197, 197)
//                                 .withOpacity(0.5),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(20, 10, 0, 0),
//                                   child: Row(
//                                     children: [
//                                       Image(
//                                         image: AssetImage(
//                                           "assets/img/el_farabi_logo.png",
//                                         ),
//                                         width: 50,
//                                         height: 50,
//                                       ),
//                                       SizedBox(
//                                         width: 6,
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(top: 10),
//                                         child: Image(
//                                           image: AssetImage(
//                                             "assets/img/el_farabi_text.png",
//                                           ),
//                                           width: 110,
//                                           height: 50,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.close,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 30),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     "3289",
//                                     style: GoogleFonts.poppins(
//                                       color:
//                                           const Color.fromRGBO(43, 43, 43, 1),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   Text(
//                                     "3289",
//                                     style: GoogleFonts.poppins(
//                                       color:
//                                           const Color.fromRGBO(43, 43, 43, 1),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   Text(
//                                     "3289",
//                                     style: GoogleFonts.poppins(
//                                       color:
//                                           const Color.fromRGBO(43, 43, 43, 1),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   Text(
//                                     "3289",
//                                     style: GoogleFonts.poppins(
//                                       color:
//                                           const Color.fromRGBO(43, 43, 43, 1),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(23, 25, 0, 0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Propriétaire",
//                                     style: GoogleFonts.raleway(
//                                       color: const Color.fromRGBO(
//                                           149, 149, 149, 1),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   Text(
//                                     'William Smith',
//                                     style: GoogleFonts.poppins(
//                                       color:
//                                           const Color.fromRGBO(43, 43, 43, 1),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 28,
//                                   ),
//                                 ],
//                               ),

//                               ////////////////////////////////////////////////
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                          Transform.scale(
//                           scale: 1.2,
//                            child: Switch(
                            
//                             activeColor: ColorManager.lightPink,
//                                   value: isToggled,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       isToggled = !isToggled;
//                                     });
//                                   },
//                                 ),
//                          ),
//                       ],
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 20,
//                   // ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: isToggled ?  HasHistory() : NoHistoryWidget() 
                    
                    
                    
                    
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               child: SizedBox(
//                 height: 80,
//                 width: MediaQuery.of(context).size.width, // Take full width
//                 child: BottomNavBar(id: "d",),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
