// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // Added for input formatters
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:simple_barcode_scanner/enum.dart';
// import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

// class AddCardWidget extends StatefulWidget {
//   const AddCardWidget({super.key}); // Fixed the constructor

//   @override
//   State<AddCardWidget> createState() => _AddCardWidgetState();
// }

// class _AddCardWidgetState extends State<AddCardWidget> {
//   final TextEditingController _cardNumberController = TextEditingController();
//   final TextEditingController _nomController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height:
//           MediaQuery.of(context).size.height * 0.8, // Added height constraint
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: () async {
//               var res = await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const SimpleBarcodeScannerPage(
//                     isShowFlashIcon: true,
//                     scanType: ScanType.barcode,
//                   ),
//                 ),
//               );
//               setState(() {
//                 if (res is String) {
//                   _cardNumberController.text =
//                       res; // Update result with scanned value
//                 }
//               });
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   'assets/img/barcode_icon.svg',
//                   width: 25,
//                   height: 25,
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Text(
//                   "Scan your card",
//                   style: GoogleFonts.raleway(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors
//                         .pink, // Changed to a color for testing, replace with your desired color
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Nom Sur La Carter',
//                         style: GoogleFonts.raleway(
//                           color: const Color.fromRGBO(26, 37, 48, 1),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         controller: _nomController,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Le nom est requis';
//                           } else if (value.length < 3 || value.length > 20) {
//                             return 'Le nom doit contenir entre 3 et 20 caractères';
//                           } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
//                             return 'Le nom ne doit contenir que des lettres';
//                           }
//                           return null;
//                         },
//                         style: GoogleFonts.poppins(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         keyboardType: TextInputType.name,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: const Color.fromRGBO(247, 247, 249, 1),
//                           hintText: "xxxxxxx",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         'Numéro Carte',
//                         style: GoogleFonts.raleway(
//                           color: const Color.fromRGBO(26, 37, 48, 1),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(16),
//                           FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                         ],
//                         controller: _cardNumberController,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Le numéro de la carte est requis';
//                           } else if (value.length != 16) {
//                             return 'Le numéro de la carte doit contenir 16 chiffres';
//                           }
//                           return null;
//                         },
//                         style: GoogleFonts.poppins(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: const Color.fromRGBO(247, 247, 249, 1),
//                           hintText: "3282  3282  3282  3282",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           minimumSize: const Size(double.infinity, 60),
//                           backgroundColor:
//                               const Color.fromRGBO(217, 80, 116, 1),
//                           foregroundColor: Colors.white,
//                           textStyle: GoogleFonts.raleway(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         child: Text(
//                           "Ajout carte",
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.raleway(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
