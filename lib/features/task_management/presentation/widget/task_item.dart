import 'package:flutter/material.dart';
import 'package:xyris_task/core/styles/colors/app_color.dart';
import 'package:xyris_task/features/task_management/presentation/widget/slidable_action_widget.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../domain/entity/task_entity.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  final TaskEntity task;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(task.id),
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          slidableActionWidget(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.editTaskView,
                arguments: task,
              );
            },
            backgroundColor: AppColor.blue,
            icon: Icons.edit,
          ),
          slidableActionWidget(
            onPressed: () {
              onDelete();
            },
            backgroundColor: AppColor.red,
            icon: Icons.delete,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.taskDetailsView,
            arguments: task,
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColor.lightBlack,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title, style: AppFonts.styleSemiBold_18),
              const SizedBox(height: 5),
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
