import '../repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository _repository;

  DeleteTaskUseCase(this._repository);

  Future<void> call(String id) async {
    return await _repository.deleteTask(id);
  }
}
