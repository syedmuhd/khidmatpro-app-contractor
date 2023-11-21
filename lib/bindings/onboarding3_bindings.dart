import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class Onboarding3Binding extends Bindings {
  @override
  Future<void> dependencies() async {
    debugPrint("[Binding Dependencies: $runtimeType]");
    var status = await Permission.location.status;
    if (status.isDenied) {
      var request = await Permission.location.request();
      // debugPrint(request.name);
    }
  }
}
