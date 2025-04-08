import 'package:flutter/material.dart';
import 'package:xyris_task/core/styles/fonts/my_fonts.dart';
import '../../styles/colors/app_color.dart';

AppBar customAppBar ( BuildContext context) {
  return AppBar(
    backgroundColor: AppColor.background,
    title: Text("Task Manager App",style: AppFonts.styleSemiBold_24,),
    centerTitle: true,
  );
}