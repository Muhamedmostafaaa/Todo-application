import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/List/listviewdesign.dart';
import 'package:todo_app/List/todolist%20fragment.dart';
import 'package:todo_app/database/model/Todo.dart';
import 'package:todo_app/homescreen/bottomsheet/bottomsheet%20widget.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/settings/settings%20fragment.dart';

class homescreen extends StatefulWidget {
  static final String ROUTE_NAME = 'home screen';

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(elevation: 0,
              title: Container(
            margin: EdgeInsets.only(left: 30, top: 30),
            child: Text(index==0?
              'To Do List':'Settings',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openbottomsheet();
        },
        child:Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: mythemedata.primarycolor,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
            child: BottomNavigationBar(
                currentIndex: index,
                onTap: (int postion) {
                  setState(() {
                    index = postion;
                  });
                },
                selectedItemColor: mythemedata.primarycolor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: mythemedata.secondarycolor,
                selectedIconTheme: IconThemeData(size: 60),
                items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/rows_icon.png'),
                  ),
                  label: 'hi',
                  backgroundColor: Colors.amber),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/setting_icon.png')),
                  label: 'bye',
                  backgroundColor: Colors.amber)
            ])),
      ),
      body: getmainview(),
    );
  }

  Widget getmainview() {
    if (index == 0) {
      return todolist();
    } else
      return settings();
  }

  void openbottomsheet() {
    setState(() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) =>bottomsheet());
    });
  }


}
