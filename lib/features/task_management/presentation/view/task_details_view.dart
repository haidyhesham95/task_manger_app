import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xyris_task/features/task_management/domain/entity/task_entity.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key, required this.task});

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: AppColor.background,
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.h,
            children: [
              SizedBox(height: 20.h),
              Text('Task Title', style: AppFonts.styleSemiBold_18),
              Text(
                task.title,
                style:
                    AppFonts.styleMedium_14.copyWith(color: AppColor.lightGray),
              ),
              Text('Task Descrbtion', style: AppFonts.styleSemiBold_18),
              Text(
                task.description ?? 'No description',
                style:
                    AppFonts.styleMedium_14.copyWith(color: AppColor.lightGray),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
