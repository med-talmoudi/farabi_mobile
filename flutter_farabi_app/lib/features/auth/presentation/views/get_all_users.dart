// // ignore_for_file: prefer_const_constructors


// import 'package:flutter_farabi_app/features/sign_up/business_logic/sign_up_logic/sign_up_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

// class GetAllUserInfoScreen extends StatefulWidget {
//   const GetAllUserInfoScreen({Key? key}) : super(key: key);

//   @override
//   State<GetAllUserInfoScreen> createState() => _GetAllUserInfoScreenState();
// }

// class _GetAllUserInfoScreenState extends State<GetAllUserInfoScreen> {


//   @override
//   void initState() {
//     super.initState();
  
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Container(
//                       width: 60,
//                       height: 60,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color.fromRGBO(247, 247, 249, 1),
//                       ),
//                       child: IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         iconSize: 30,
//                         icon: const Icon(Icons.arrow_back_ios_new_rounded),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Get All Users Information",
//                   style: GoogleFonts.raleway(
//                     fontSize: 32,
//                     fontWeight: FontWeight.w700,
//                     color: const Color.fromRGBO(43, 43, 43, 1),
//                   ),
//                 ),
//                 SizedBox(height: 50,),

//                 Row(children: [
//                     Text("Phone Number:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)), SizedBox(width: 10,) ,Text(context.read<FormDataProvider>().user.phoneNumber, style: TextStyle(fontSize: 20)),
//                 ],),
//                 SizedBox(height: 20,),
//                 Row(children: [
//                     Text("Name:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),SizedBox(width: 10,) , Text(context.read<FormDataProvider>().user.name, style: TextStyle(fontSize: 20)),
//                 ],),
//                   SizedBox(height: 20,),
//                 Row(children: [
//                     Text("Last Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(width: 10,) ,Text(context.read<FormDataProvider>().user.lastName, style: TextStyle(fontSize: 20)),
//                 ],),
//                   SizedBox(height: 20,),
//                 Row(children: [
//                     Text("Password:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)), SizedBox(width: 10,) ,Text(context.read<FormDataProvider>().user.password, style: TextStyle(fontSize: 20)),
//                 ],),
//                   SizedBox(height: 20,),
//                 Row(children: [
//                     Text("Date Of Birth:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),SizedBox(width: 10,) , Text(context.read<FormDataProvider>().user.dateOfBirth, style: TextStyle(fontSize: 20)),
//                 ],),
//                   SizedBox(height: 20,),
//                 Row(children: [
//                     Text("Gender:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),SizedBox(width: 10,) , Text(context.read<FormDataProvider>().user.gender, style: TextStyle(fontSize: 20)),
//                 ],),

//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
