import '../entity/task_entity.dart';
import '../repositories/task_repository.dart';

class AddTaskUseCase {
  final TaskRepository _repository;

  AddTaskUseCase(this._repository);

  Future<void> call(TaskEntity task) async {
    try {
      return await _repository.addTask(task);
    } catch (e) {
      throw Exception("Failed to add task: $e");
    }
  }
}
