import '../entity/task_entity.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<void> addTask(TaskEntity task);
  Future<void> deleteTask(String id);
  Future<void> editTask(TaskEntity task);
}