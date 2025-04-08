import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:xyris_task/core/styles/colors/app_color.dart';

SlidableAction slidableActionWidget({
  required VoidCallback onPressed,
  required Color backgroundColor,
  required IconData icon,
}) {
  return SlidableAction(
    onPressed: (BuildContext context) {
      onPressed();
    },
    backgroundColor: backgroundColor,
    foregroundColor: AppColor.white,
    icon: icon,
    borderRadius: BorderRadius.circular(10),
  );
}
