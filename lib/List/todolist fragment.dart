import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/List/listviewdesign.dart';
import 'package:todo_app/database/model/Todo.dart';
import 'package:todo_app/main.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/provider/appproviders.dart';
import 'package:visibility_detector/visibility_detector.dart';

class todolist extends StatefulWidget {
  @override
  State<todolist> createState() => _todolistState();
}

class _todolistState extends State<todolist> {
  DateTime selected = DateTime.now();
  DateTime focusedday=DateTime.now();
  List<Todo> boxdata = [];
  appprovider list=appprovider();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>appprovider(),
      builder: (context,widget){
    list=Provider.of<appprovider>(context);
    getdata();
        return Container(
          color: Color.fromRGBO(223, 236, 219, 1.0),
          child: Column(
            children: [
              TableCalendar(
                calendarFormat: CalendarFormat.week,
                headerVisible: false,
                firstDay: DateTime.now().subtract(Duration(days: 30)),
                lastDay: DateTime.now().add(Duration(days: 30)),
                focusedDay: focusedday,
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: mythemedata.primarycolor),
                  defaultDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: Colors.white),
                  selectedTextStyle: TextStyle(fontSize: 20, color: Colors.white),
                  defaultTextStyle: TextStyle(color: Colors.black),
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(selected, day);

                },
                onDaySelected: (selectedDay, newfocusedDay) {
                  setState(() {
                    selected = selectedDay;
                    focusedday=newfocusedDay;
                    // update `_focusedDay` here as well
                  });
                  getdata();
                },
                weekendDays: [],
                daysOfWeekStyle: DaysOfWeekStyle(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white)),
              ),
              Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => listviewdesign(list.list[index],deleteindex),
                    itemCount: list.list.length,
                  ))
            ],
          ),
        );
      },
    );
    ;
  }

void deleteindex(Todo item)async{
  var box=await Hive.openBox<Todo>(Todo.Boxname);
  int index= box.values.toList().indexOf(item);
box.deleteAt(index);
getdata();
}
   void getdata() async {
    var box = await Hive.openBox<Todo>(Todo.Boxname);

      List<Todo>boxlist = box.values.where((item) => isSameDay(item.date, selected)).toList();
      list.validate(boxlist);
  }
}
