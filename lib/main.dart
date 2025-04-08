import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xyris_task/task_manager_app.dart';
import 'core/di/di_config.dart' as di;
import 'core/utils/abb_bloc_observer.dart';
import 'features/task_management/data/model/task_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(TaskModelAdapter());
  Bloc.observer = MyBlocObserver();

  await di.init();

  runApp(TaskMangerApp());
}
