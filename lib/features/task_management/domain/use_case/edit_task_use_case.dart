import '../entity/task_entity.dart';
import '../repositories/task_repository.dart';
class EditTaskUseCase {
  final TaskRepository _repository;

  EditTaskUseCase(this._repository);

  Future<void> call( TaskEntity task) async {
    try {
      await _repository.editTask(task);
    } catch (e) {
      throw Exception("Failed to edit task: $e");
    }
  }

}

