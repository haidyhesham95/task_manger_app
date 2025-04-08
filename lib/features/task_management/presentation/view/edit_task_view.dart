import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xyris_task/core/utils/widgets/buttons/custom_button.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';
import '../../../../core/utils/widgets/custom_toast.dart';
import '../../domain/entity/task_entity.dart';
import '../view_model/task_action.dart';
import '../view_model/task_cubit.dart';

class EditTaskView extends StatefulWidget {
  final TaskEntity task;

  const EditTaskView({super.key, required this.task});

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController = TextEditingController(text: widget.task.description ?? '');
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TaskCubit>();
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: AppColor.background,
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,top: 30, right: 16, bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 20.h,
              children: [
                CustomTextFormField(
                  hintTxt: 'Edit task title',
                  controller: titleController,
                ),
                CustomTextFormField(
                  hintTxt: 'Edit task description',
                  controller: descriptionController,
                  maxLines: 5,
                ),
              ],
            ),
            CustomButton(
              txt: 'Edit Task',
              onPressed: () {
                if (titleController.text.isEmpty) {
                  CustomToast.showErrorToast(message: 'Title is required');
                } else {
                  final updatedTask = TaskEntity(
                    id: widget.task.id,
                    title: titleController.text,
                    description: descriptionController.text,
                  );

                  cubit.doAction(EditTask(task: updatedTask));
                  CustomToast.showSuccessToast(message: 'Task updated successfully');
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
