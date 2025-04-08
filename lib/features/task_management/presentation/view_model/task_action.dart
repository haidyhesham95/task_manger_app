import '../../domain/entity/task_entity.dart';

sealed class TaskAction {}

class GetTask extends TaskAction {}

class AddTask extends TaskAction {
  final TaskEntity task;

  AddTask({required this.task});
}

class EditTask extends TaskAction {
  final TaskEntity task;

  EditTask({required this.task});
}

class DeleteTask extends TaskAction {
  final String taskId;

  DeleteTask({required this.taskId});
}
