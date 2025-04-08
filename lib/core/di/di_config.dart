import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:xyris_task/features/task_management/domain/use_case/add_task_use_case.dart';
import 'package:xyris_task/features/task_management/domain/use_case/delete_task_use_case.dart';
import 'package:xyris_task/features/task_management/domain/use_case/edit_task_use_case.dart';
import 'package:xyris_task/features/task_management/domain/use_case/get_all_tasks_use_case.dart';
import '../../features/task_management/data/data_sources/contract/task_local_data_sources.dart';
import '../../features/task_management/data/data_sources/impl/task_local_data_sources_impl.dart';
import '../../features/task_management/data/model/task_model.dart';
import '../../features/task_management/data/repositories/task_repositories_impl.dart';
import '../../features/task_management/domain/repositories/task_repository.dart';
import '../../features/task_management/presentation/view_model/task_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Hive Box
  final taskBox = await Hive.openBox<TaskModel>('tasksBox');
  sl.registerLazySingleton<Box<TaskModel>>(() => taskBox);
  // Data Source
  sl.registerLazySingleton<TaskLocalDataSource>(
      () => TaskLocalDataSourceImpl());

  // Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());

  // UseCases
  sl.registerLazySingleton(() => AddTaskUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTaskUseCase(sl()));
  sl.registerLazySingleton(() => GetAllTasksUseCase(sl()));
  sl.registerLazySingleton(() => EditTaskUseCase(sl()));

  // Cubit
  sl.registerLazySingleton(() => TaskCubit(
    sl<GetAllTasksUseCase>(),
    sl<AddTaskUseCase>(),
    sl<EditTaskUseCase>(),
    sl<DeleteTaskUseCase>(),
  ));

}
