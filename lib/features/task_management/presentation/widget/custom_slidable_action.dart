import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

CustomSlidableAction customSlidableAction({
  required VoidCallback onPressed,
  required Color backgroundColor,
  required IconData icon,
}) {
  return CustomSlidableAction(
    onPressed: (BuildContext context) {
      onPressed();
    },
    backgroundColor: backgroundColor,
    borderRadius: BorderRadius.circular(10),
    child: Icon(
      icon,
      color: Colors.white,
      size: 32,
    ),
  );
}
