import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity connectivity = Connectivity(); 
  late StreamSubscription<List<ConnectivityResult>> subscription;

  @override
  void onInit() {
    super.onInit();
    subscription = connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResults) {
    if (connectivityResults.contains(ConnectivityResult.none)) {
      Get.rawSnackbar(
        messageText: const Text("PLEASE CONNECT TO THE INTERNET"),
        duration: Duration(seconds: 500),
        backgroundColor: Colors.red
      );
    }
  }

  @override
  void onClose() {
    subscription.cancel();
    Get.closeCurrentSnackbar();
    super.onClose();
  }
}
