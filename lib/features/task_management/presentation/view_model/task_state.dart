import '../../domain/entity/task_entity.dart';

sealed class TaskState {
  const TaskState();
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskEntity> tasks;

  TaskLoaded(this.tasks);
}

class TaskError extends TaskState {
  final String message;

  TaskError(this.message);
}

class TaskSuccess extends TaskState {
  final String message;

  TaskSuccess(this.message);
}

class TaskEmpty extends TaskState {
  final String message;

  TaskEmpty(this.message);
}
