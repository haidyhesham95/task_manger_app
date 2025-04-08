import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';
import 'package:xyris_task/core/utils/widgets/buttons/custom_button.dart';
import 'package:xyris_task/core/utils/widgets/custom_toast.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';
import '../../domain/entity/task_entity.dart';
import '../view_model/task_action.dart';
import '../view_model/task_cubit.dart';

import '../view_model/task_state.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: AppColor.background,
      appBar: customAppBar(context),
      body: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {
          if (state is TaskError) {
            CustomToast.showErrorToast(message: state.message);
          } else if (state is TaskLoaded) {
            CustomToast.showSuccessToast(message: 'Task added successfully');
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          final cubit = context.read<TaskCubit>();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 20.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  hintTxt: 'Enter task title',
                  controller: titleController,
                ),
                CustomTextFormField(
                  hintTxt: 'Enter task description',
                  controller: descriptionController,
                  maxLines: 5,
                ),
                SizedBox(height: 60.h),
                CustomButton(
                  onPressed: () {
                    final title = titleController.text.trim();
                    final description = descriptionController.text.trim();

                    if (title.isEmpty) {
                      CustomToast.showErrorToast(message: 'Title is required');
                      return;
                    }

                    final task = TaskEntity(
                      id: uuid.toString(),
                      title: title,
                      description: description,
                    );

                    cubit.doAction(AddTask(task: task));
                  },
                  txt: 'Add Task',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
