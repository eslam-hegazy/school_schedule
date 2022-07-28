import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConstantMethods {
  static void systemOverLaySystem({
    required Color statusColor,
    required Color statusIconColor,
  }) {
    return SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
}
