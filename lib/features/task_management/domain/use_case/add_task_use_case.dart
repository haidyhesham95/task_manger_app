import '../entity/task_entity.dart';
import '../repositories/task_repository.dart';

class AddTaskUseCase {
  final TaskRepository _repository;

  AddTaskUseCase(this._repository);

  Future<void> call(TaskEntity task) async {
    return await _repository.addTask(task);
  }
}
