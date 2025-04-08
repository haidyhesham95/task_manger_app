import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xyris_task/features/task_management/presentation/view_model/task_state.dart';

import '../../domain/entity/task_entity.dart';
import '../../domain/use_case/add_task_use_case.dart';
import '../../domain/use_case/delete_task_use_case.dart';
import '../../domain/use_case/edit_task_use_case.dart';
import '../../domain/use_case/get_all_tasks_use_case.dart';
import 'task_action.dart';

class TaskCubit extends Cubit<TaskState> {
  static TaskCubit get(context) => BlocProvider.of(context);

  final GetAllTasksUseCase _getAllTasksUseCase;
  final AddTaskUseCase _addTaskUseCase;
  final EditTaskUseCase _editTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  TaskCubit(
    this._getAllTasksUseCase,
    this._addTaskUseCase,
    this._editTaskUseCase,
    this._deleteTaskUseCase,
  ) : super(TaskInitial());

  doAction(TaskAction action) {
    switch (action) {
      case GetTask():
        _getTasks();
        break;
      case AddTask():
        _addTask(action.task);
        break;
      case EditTask():
        _editTask(action.task);
        break;
      case DeleteTask():
        _deleteTask(action.taskId);
        break;
    }
  }

  Future<void> _getTasks() async {
    emit(TaskLoading());
    try {
      final tasks = await _getAllTasksUseCase();
      emit(tasks.isEmpty ? TaskEmpty('No tasks available') : TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError('Failed to load tasks'));
    }
  }

  Future<void> _addTask(TaskEntity task) async {
    emit(TaskLoading());
    try {
      await _addTaskUseCase(task);
      await _getTasks();
    } catch (e) {
      emit(TaskError('Failed to add task'));
    }
  }

  Future<void> _editTask(TaskEntity task) async {
    emit(TaskLoading());
    try {
      await _editTaskUseCase(task);
      await _getTasks();
    } catch (e) {
      emit(TaskError('Failed to edit task'));
    }
  }

  Future<void> _deleteTask(String taskId) async {
    emit(TaskLoading());
    try {
      await _deleteTaskUseCase(taskId);
      await _getTasks();
    } catch (e) {
      emit(TaskError('Failed to delete task'));
    }
  }
}
