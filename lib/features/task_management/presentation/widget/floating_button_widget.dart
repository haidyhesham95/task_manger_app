import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xyris_task/core/routes/app_routes.dart';

import '../../../../core/styles/colors/app_color.dart';

FloatingActionButton floatingButtonWidget(BuildContext context) {
  return FloatingActionButton(
    onPressed: () => Navigator.pushNamed(context, AppRoutes.addTaskView),
    backgroundColor: AppColor.darkGray,
    child: Icon(Icons.add, size: 30.sp, color: AppColor.white),
  );
}
