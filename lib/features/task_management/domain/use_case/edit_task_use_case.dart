import '../entity/task_entity.dart';
import '../repositories/task_repository.dart';
class EditTaskUseCase {
  final TaskRepository _repository;

  EditTaskUseCase(this._repository);

  Future<void> call(TaskEntity task)  async {
    return await _repository.editTask(task);
  }

}

