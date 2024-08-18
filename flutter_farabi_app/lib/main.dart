
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_farabi_app/core/helpers/cubit_observer.dart';
import 'package:flutter_farabi_app/core/hive/open_box.dart';
import 'package:flutter_farabi_app/core/routing/app_routes.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box? box;
Future<void> main() async {
  Bloc.observer = MyBlocObserver(); // TODO observer

  String path = "/splach";
  WidgetsFlutterBinding.ensureInitialized();
  box = await openBox("elFarabi");
  await dotenv.load(fileName: ".env");

  if (box!.containsKey('token') && box!.get('token') != null) {
    // Retrieve the value associated with the key "path"
    path = "/card";
  }
  // if (kDebugMode) {
  //   print(path);
  // }
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
