import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:xyris_task/features/task_management/domain/entity/task_entity.dart';

import '../../mapper/mapper.dart';
import '../../model/task_model.dart';
import '../contract/task_data_sources.dart';

class TaskLocalDataSourceImpl implements TaskDataSource {
  final Box<TaskModel> _taskBox;

  TaskLocalDataSourceImpl() : _taskBox = GetIt.instance<Box<TaskModel>>();

  Future<void> _saveTask(TaskEntity task) async {
    final model = TaskMapper.toModel(task);
    await _taskBox.put(model.id, model);
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    final models =  _taskBox.values.toList();
    return models.map((e) => TaskMapper.toEntity(e)).toList();
  }

  @override
  Future<void> addTask(TaskEntity task) async {
    await _saveTask(task);
  }

  @override
  Future<void> deleteTask(String id) async => await _taskBox.delete(id);

  @override
  Future<void> editTask(TaskEntity task) async {
    await _saveTask(task);
  }
}
