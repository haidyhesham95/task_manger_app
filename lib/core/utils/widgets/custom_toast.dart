import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../styles/colors/app_color.dart';


class CustomToast {
  static void showToast({
    required String message,
    required Color backgroundColor,
    required ToastGravity gravity,
    required IconData icon,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static String iconToText(IconData icon) {
    return String.fromCharCode(icon.codePoint);
  }

  static void showLoadingToast({required String message}) {
    showToast(
      message: message,
      backgroundColor: AppColor.lightBlack,
      gravity: ToastGravity.BOTTOM,
      icon: Icons.hourglass_bottom,
    );
  }

  static void showErrorToast({required String message}) {
    showToast(
      message: message,
      backgroundColor: Colors.redAccent,
      gravity: ToastGravity.BOTTOM,
      icon: Icons.error_outline,
    );
  }

  static void showSuccessToast({required String message}) {
    showToast(
      message: message,
      backgroundColor: Colors.green,
      gravity: ToastGravity.BOTTOM,
      icon: Icons.check_circle,
    );
  }
}

