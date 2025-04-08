import 'package:xyris_task/features/task_management/domain/entity/task_entity.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskEntity>> getTasks();
  Future<void> addTask(TaskEntity task);
  Future<void> deleteTask(String id);
  Future<void> editTask(TaskEntity task);
}