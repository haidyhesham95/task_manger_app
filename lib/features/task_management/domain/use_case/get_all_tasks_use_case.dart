import '../entity/task_entity.dart';
import '../repositories/task_repository.dart';

class GetAllTasksUseCase {
  final TaskRepository _repository;
  GetAllTasksUseCase(this._repository);

  Future<List<TaskEntity>> call()  async {
    return await _repository.getTasks();
  }
}
