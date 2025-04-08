import 'package:get_it/get_it.dart';
import 'package:xyris_task/features/task_management/domain/entity/task_entity.dart';

import '../../domain/repositories/task_repository.dart';
import '../data_sources/contract/task_local_data_sources.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource _localDataSource;

  TaskRepositoryImpl()
      : _localDataSource = GetIt.instance<TaskLocalDataSource>();

  @override
  Future<List<TaskEntity>> getTasks() async {
    return await _localDataSource.getTasks();
  }

  @override
  Future<void> addTask(TaskEntity task) async {
    return await _localDataSource.addTask(task);
  }

  @override
  Future<void> deleteTask(String id) {
    return _localDataSource.deleteTask(id);
  }

  @override
  Future<void> editTask(TaskEntity task) async {
    return await _localDataSource.editTask(task);
  }
}
