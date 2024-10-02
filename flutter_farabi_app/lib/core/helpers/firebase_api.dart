
// import 'package:flutter/material.dart';
// import 'package:flutter_farabi_app/main.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> initializeNotifications() async {
//     // Request permission to show notifications
//     NotificationSettings settings = await _firebaseMessaging.requestPermission();

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//     } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
//       print('User denied permission');
//     }

//     // Get the FCM token
//     final fcmToken = await _firebaseMessaging.getToken();
//     await box!.put("fcmToken", fcmToken);
//     print(fcmToken.toString());

//     // Listen for foreground messages
//    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   print('Received a message in the foreground!');

//   // Log the entire message object for detailed information
//   print('Message data: ${message.data}');
  
//   // Check if the message contains a notification payload
//   if (message.notification != null) {
//     print('Message notification title: ${message.notification?.title}');
//     print('Message notification body: ${message.notification?.body}');
//   } else {
//     print('No notification payload in the message.');
//   }

//   // Additional debug information
//   print('Message ID: ${message.messageId}');
//   print('Sent time: ${message.sentTime}');
//   print('From: ${message.from}');
  
//   // Handle the message or show notification UI (example)
//   showDialog(
//     context: Get.context!, // Ensure you have a valid context
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(message.notification?.title ?? 'Notification'),
//         content: Text(message.notification?.body ?? 'No message content'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//             },
//             child: Text('OK'),
//           ),
//         ],
//       );
//     },
//   );
// });

//     // Listen for when the notification is opened while app is in background
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('A notification was opened!');
//       // Handle the notification tap
//     });

//     // Set the background message handler
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }

//   // Define the background message handler
//   static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     print('Handling a background message: ${message.messageId}');
//     // Handle background message processing here
//   }
// }
