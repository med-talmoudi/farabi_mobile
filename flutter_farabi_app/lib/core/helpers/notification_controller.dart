
import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
// import 'package:eric_kayser/core/helpers/local_data.dart';
// import 'package:eric_kayser/core/router/router.dart';
// import 'package:eric_kayser/core/router/shell_route.dart';
// import 'package:eric_kayser/core/widgets/convertion_dicition.dart';
// import 'package:eric_kayser/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_farabi_app/core/routing/app_routes.dart';
import 'package:flutter_farabi_app/firebase_options.dart';

enum NotifType {
  conversion(notifType: 'CONVERSION', screenName: 'card'),
  jackpot(notifType: 'JACKPOT', screenName: '');

  const NotifType({
    required this.notifType,
    required this.screenName,
  });

  final String notifType;
  final String screenName;
}

///  *********************************************
///     NOTIFICATION CONTROLLER
///  *********************************************
///
class NotificationController extends ChangeNotifier {
  /// *********************************************
  ///   SINGLETON PATTERN
  /// *********************************************

  static final NotificationController _instance =
      NotificationController._internal();

  factory NotificationController() {
    return _instance;
  }

  NotificationController._internal();

  /// *********************************************
  ///  OBSERVER PATTERN
  /// *********************************************

  String _firebaseToken = '';
  String get firebaseToken => _firebaseToken;

  String _nativeToken = '';
  String get nativeToken => _nativeToken;

  ReceivedAction? initialAction;

  ///  *********************************************
  ///     INITIALIZATIONS
  ///  *********************************************
  ///
  static Future<void> initializeNotifications() async {
    await initializeIsolateReceivePort();
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          // defaultColor: const Color(0xFF9D50DD),
          // ledColor: Colors.white,
        )
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group',
        )
      ],
      debug: kDebugMode,
    );

    ///* initialize remote notification
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await AwesomeNotificationsFcm().initialize(
      onFcmTokenHandle: NotificationController.myFcmTokenHandle,
      onNativeTokenHandle: NotificationController.myNativeTokenHandle,
      onFcmSilentDataHandle: NotificationController.mySilentDataHandle,
      licenseKeys: null,
      debug: kDebugMode,
    );

    ///  *********************************************
    ///    LOCAL NOTIFICATION EVENTS LISTENER
    ///  *********************************************
    ///  Notifications events are only delivered after call this method
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );

    // Get initial notification action is optional
    _instance.initialAction =
        await AwesomeNotifications().getInitialNotificationAction();
  }

  static ReceivePort? receivePort = ReceivePort();
  static Future<void> initializeIsolateReceivePort() async {
    // This initialization only happens on main isolate
    IsolateNameServer.registerPortWithName(
        receivePort!.sendPort, 'notification_action_port');

    receivePort = ReceivePort('Notification action port in main isolate');
    receivePort!.listen((serializedData) {
      final receivedAction = ReceivedAction().fromMap(serializedData);
      handleNavigation(rootNavigatorKey.currentContext, receivedAction);
    });
  }

  static void handleNavigation(
      BuildContext? context, ReceivedAction receivedAction) async {
    if (receivedAction.payload != null) {
      String screenName = 'card';

      if (receivedAction.payload!['type'] == NotifType.conversion.notifType) {
        screenName = NotifType.conversion.screenName;
        Navigator.pushNamed(
                              context!,
                              '/card_home',

                              //TODO change later done i guess from /card to /card_home
                            );
        
        // AppRouter.router.pushNamed(
        //   screenName,
        //   extra: NotifData(
        //     title: receivedAction.title ?? '',
        //     body: receivedAction.body ?? '',
        //     notifId: receivedAction.payload!['notifId'] ?? '',
        //   ),
        // );
      }
    }
  }

  ///  *********************************************
  ///     REMOTE NOTIFICATION EVENTS
  ///  *********************************************

  /// Use this method to execute on background when a silent data arrives
  /// (even while terminated)
  @pragma("vm:entry-point")
  static Future<void> mySilentDataHandle(FcmSilentData silentData) async {
    debugPrint('#' * 100);
    debugPrint('mySilentDataHandle $silentData');
  }

  ///  *********************************************
  ///     NOTIFICATION EVENTS
  ///  *********************************************
  ///
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivePort != null) {
      handleNavigation(rootNavigatorKey.currentContext, receivedAction);
    } else {
      SendPort? sendPort =
          IsolateNameServer.lookupPortByName('notification_action_port');

      if (sendPort != null) {
        dynamic serializedData = receivedAction.toMap();
        sendPort.send(serializedData);
        return;
      }
    }
    // handleNavigation(rootNavigatorKey.currentContext, receivedAction);
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    final lifeCycle = receivedNotification.displayedLifeCycle;
    final notifType = receivedNotification.payload!['type'];
    if (lifeCycle == NotificationLifeCycle.Foreground &&
        notifType == NotifType.conversion.notifType) {
      // showDialog<void>(
      //   context: rootNavigatorKey.currentContext!,
      //   barrierDismissible: false, // user must tap button!
      //   builder: (BuildContext context) => UserDicitionAlertContent(
      //     notifData: NotifData(
      //       title: receivedNotification.title ?? '',
      //       body: receivedNotification.body ?? '',
      //       notifId: receivedNotification.payload!['notifId'] ?? '',
      //     ),
      //   ),
      // );
    } else if (notifType == NotifType.jackpot.notifType) {
      // LocalData().addNotif();
    }
  }

  ///  *********************************************
  ///     REQUESTING NOTIFICATION PERMISSIONS
  ///  *********************************************
  ///
  static Future<void> requestNotificationPermission() async {
    final isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  ///  *********************************************
  ///     REMOTE TOKEN REQUESTS
  ///  *********************************************

  static Future<String> requestFirebaseToken() async {
    if (await AwesomeNotificationsFcm().isFirebaseAvailable) {
      try {
        return await AwesomeNotificationsFcm().requestFirebaseAppToken();
      } catch (exception) {
        debugPrint('$exception');
      }
    } else {
      debugPrint('Firebase is not available on this project');
    }
    return '';
  }

  ///  *********************************************
  ///     NOTIFICATION CREATION METHODS
  ///  *********************************************
  ///
  static Future<void> createNewNotification({
    required String title,
    required String body,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1, // -1 is replaced by a random number
        channelKey: 'basic_channel',
        title: title,
        body: body,
      ),
    );
  }

  /// Use this method to detect when a new fcm token is received
  @pragma("vm:entry-point")
  static Future<void> myFcmTokenHandle(String token) async {
    _instance._firebaseToken = token;
    _instance.notifyListeners();
  }

  /// Use this method to detect when a new native token is received
  @pragma("vm:entry-point")
  static Future<void> myNativeTokenHandle(String token) async {
    _instance._nativeToken = token;
    _instance.notifyListeners();
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {}
}
