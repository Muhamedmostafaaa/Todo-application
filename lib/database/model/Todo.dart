import 'package:hive/hive.dart';
part 'Todo.g.dart';
@HiveType(typeId: 0)
class Todo{
static final Boxname='todos';
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  DateTime date;
  @HiveField(3)
  bool isdone;
  Todo({required this.title, required this.date, required this.content,this.isdone:false});

}