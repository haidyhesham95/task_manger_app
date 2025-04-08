import 'package:get_it/get_it.dart';
import 'package:xyris_task/features/task_management/domain/entity/task_entity.dart';

import '../../domain/repositories/task_repository.dart';
import '../data_sources/contract/task_data_sources.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource _dataSource;
  TaskRepositoryImpl()
      : _dataSource = GetIt.instance<TaskDataSource>();


  @override
  Future<List<TaskEntity>> getTasks() async {
    return await _dataSource.getTasks();
  }

  @override
  Future<void> addTask(TaskEntity task) async {
    return await _dataSource.addTask(task);
  }

  @override
  Future<void> deleteTask(String id) {
    return _dataSource.deleteTask(id);
  }

  @override
  Future<void> editTask(TaskEntity task) async {
    return await _dataSource.editTask(task);
  }
}
