import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin SnackBar {
  void callFailedSnackBar(String message) {
    Get.snackbar(
      'Failed',
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
