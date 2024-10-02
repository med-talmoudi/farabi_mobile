import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_farabi_app/core/helpers/cubit_observer.dart';
import 'package:flutter_farabi_app/core/helpers/firebase_api.dart';
import 'package:flutter_farabi_app/core/helpers/notification_controller.dart';
import 'package:flutter_farabi_app/core/hive/open_box.dart';
import 'package:flutter_farabi_app/core/routing/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_farabi_app/firebase_options.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/helpers/firebase_messaging_service.dart';

Box? box;
Future<void> main() async {
  Bloc.observer = MyBlocObserver(); // TODO observer

  String path = "/splach";
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize Crashlytics
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  

  box = await openBox("elFarabi");
  await dotenv.load(fileName: ".env");
  await NotificationController.initializeNotifications();

  await NotificationController.requestNotificationPermission();
  if (box!.containsKey('token') && box!.get('token') != null) {
    path = "/card_home";
  }
  // Initialize notifications using the service
  await NotificationService().initializeNotifications();
  ScreenUtil.ensureScreenSize();
  runApp(MyApp(appRouter: AppRouter(), initialRoute: path));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter, required this.initialRoute});
  final String initialRoute;
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          primaryColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: (settings) =>
            appRouter.generateRoute(settings, initialRoute),
      ),
    );
    //go router
  }
}
