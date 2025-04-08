import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xyris_task/core/styles/colors/app_color.dart';
import 'package:xyris_task/core/styles/fonts/my_fonts.dart';
import 'package:xyris_task/core/utils/widgets/custom_app_bar.dart';
import 'package:xyris_task/features/task_management/presentation/view_model/task_cubit.dart';

import '../../domain/entity/task_entity.dart';
import '../view_model/task_action.dart';
import '../view_model/task_state.dart';
import '../widget/floating_button_widget.dart';
import '../widget/task_item.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: AppColor.background,
      appBar: customAppBar(context),
      floatingActionButton: floatingButtonWidget(context),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return switch (state) {
            TaskInitial() => _buildInitialState(),
            TaskLoading() => _buildLoadingState(),
            TaskLoaded(tasks: final tasks) => _buildTaskList(tasks),
            TaskEmpty() => _buildEmptyState(),
            TaskError() => _buildErrorState(),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }

  Widget _buildTaskList(List<TaskEntity> tasks) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemBuilder: (context, index) => TaskItem(
        task: tasks[index],
        onDelete: () {
          context
              .read<TaskCubit>()
              .doAction(DeleteTask(taskId: tasks[index].id));
        },
      ),
      separatorBuilder: (context, index) => SizedBox(height: 15.h),
      itemCount: tasks.length,
      physics: const BouncingScrollPhysics(),
    );
  }

  Widget _buildInitialState() => Container();

  Widget _buildLoadingState() =>
      const Center(child: CircularProgressIndicator());

  Widget _buildEmptyState() => Center(
          child: Text(
        "Task list is empty",
        style: AppFonts.styleSemiBold_24,
      ));

  Widget _buildErrorState() => Center(
          child: Text(
        "An error occurred",
        style: AppFonts.styleSemiBold_24,
      ));
}
