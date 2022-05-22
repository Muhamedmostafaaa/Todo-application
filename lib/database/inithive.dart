import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/database/model/Todo.dart';

void init()async{
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
}