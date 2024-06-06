// ignore_for_file: avoid_print

import 'package:flutter_farabi_app/core/hive/open_box.dart';
import 'package:flutter_farabi_app/core/routing/app_routes.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


Box? box;
Future<void> main() async {
  String path = "/splach";
  WidgetsFlutterBinding.ensureInitialized();
  box = await openBox("elFarabi");
  if (box!.containsKey('path')) {
    // Retrieve the value associated with the key "path"
     path = box!.get('path');
    print('The value associated with the key "path" is: $path');
  }
  ScreenUtil.ensureScreenSize();
  runApp(MyApp(appRouter: AppRouter(), initialRoute: "/splach"));
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
      
          child: MaterialApp(
            theme: ThemeData(
              useMaterial3: false,
              primaryColor: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
          
            initialRoute: initialRoute,
            onGenerateRoute: (settings) => appRouter.generateRoute(settings, "/splach"),
          ),
        );
       //go router
    
  }
}
