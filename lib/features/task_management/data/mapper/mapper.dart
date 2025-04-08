import 'package:xyris_task/features/task_management/domain/entity/task_entity.dart';

import '../model/task_model.dart';

class TaskMapper {
  static TaskModel toModel(TaskEntity task) => TaskModel(
    id: task.id,
    title: task.title,
    description: task.description,
  );

  static TaskEntity toEntity(TaskModel model) => TaskEntity(
    id: model.id,
    title: model.title,
    description: model.description,
  );
}