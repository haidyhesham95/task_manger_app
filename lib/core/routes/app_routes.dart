import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:xyris_task/features/task_management/presentation/view/add_task_view.dart';
import 'package:xyris_task/features/task_management/presentation/view/edit_task_view.dart';
import 'package:xyris_task/features/task_management/presentation/view/task_details_view.dart';
import 'package:xyris_task/features/task_management/presentation/view/task_view.dart';
import '../../features/task_management/domain/entity/task_entity.dart';
import '../../features/task_management/presentation/view_model/task_action.dart';
import '../../features/task_management/presentation/view_model/task_cubit.dart';
import '../utils/screens/under_build_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String taskView = "taskView";
  static const String addTaskView = "addTaskView";
  static const String editTaskView = "editTaskView";
  static const String taskDetailsView = "taskDetailsView";

  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case taskView:
        return BaseRoute(
            page: BlocProvider(
                create: (context) =>
                    GetIt.instance<TaskCubit>()..doAction(GetTask()),
                child: const TaskView()));
      case addTaskView:
        return BaseRoute(
          page: BlocProvider.value(
              value: GetIt.instance<TaskCubit>(), child: AddTaskView()),
        );
      case editTaskView:
        final task = settings.arguments as TaskEntity;
        return BaseRoute(
          page: BlocProvider.value(
            value: GetIt.instance<TaskCubit>(),
            child: EditTaskView(task: task),
          ),
        );
      case taskDetailsView:
        final task = settings.arguments as TaskEntity;
        return BaseRoute(
          page: TaskDetailsView(task: task),
        );

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
