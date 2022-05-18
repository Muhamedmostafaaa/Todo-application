import 'package:flutter/material.dart';
import 'package:todo_app/List/todolist%20fragment.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/settings/settings%20fragment.dart';

class homescreen extends StatefulWidget {
  static final String ROUTE_NAME = 'home screen';

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int index = 0;
  String title='';
  String cintent='';
  DateTime date=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(
              title: Container(
            margin: EdgeInsets.only(left: 30, top: 30),
            child: Text(
              'To Do List',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openbottomsheet();
        },
        child: Icon(
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
          context: context,
          builder: (context) => BottomSheet(
                onClosing: () {},
                builder: (context) => Container(
                  height: 500,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Add new Task',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20, decoration: TextDecoration.underline),
                      ),
                      TextField(onChanged: (newtext){
                        title=newtext;
                      },
                        decoration: InputDecoration(labelText:'Title',
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'enter the  task'),
                      ),
                      TextField(onChanged: (newtext){
                        cintent=newtext;
                      },
                        decoration: InputDecoration(labelText: 'Content',
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'write content'),
                      ),
                      InkWell(
                        onTap: ()async{
                          var selecteddate =await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(Duration(days: 300)));
                          date=selecteddate!;
                        },
                        child: Text(
                          'select date',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text('ADD',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                mythemedata.primarycolor)),
                      )
                    ],
                  ),
                ),
              ));
    });
  }
}
