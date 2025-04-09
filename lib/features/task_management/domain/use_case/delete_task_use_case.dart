import '../repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository _repository;

  DeleteTaskUseCase(this._repository);

  Future<void> call(String id) async {
    try {
      await _repository.deleteTask(id);
    } catch (e) {
      throw Exception("Failed to delete task: $e");
    }
  }
}
