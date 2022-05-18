import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/List/listviewdesign.dart';
import 'package:todo_app/main.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todolist extends StatefulWidget {
  @override
  State<todolist> createState() => _todolistState();
}

class _todolistState extends State<todolist> {
  DateTime selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(223, 236, 219, 1.0),
      child: Column(
        children: [
          TableCalendar(
            calendarFormat: CalendarFormat.week,
            headerVisible: false,
            firstDay: DateTime.now().subtract(Duration(days: 30)),
            lastDay: DateTime.now().add(Duration(days: 30)),
            focusedDay: DateTime.now(),
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
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                selected = selectedDay;
                // update `_focusedDay` here as well
              });
            },
            weekendDays: [],
            daysOfWeekStyle: DaysOfWeekStyle(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white)),
          ),
          Expanded(child: ListView.builder(itemBuilder: (context,index)=>listviewdesign()))
        ],
      ),
    );
    ;
  }
}
