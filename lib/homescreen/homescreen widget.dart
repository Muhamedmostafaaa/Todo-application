import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/List/listviewdesign.dart';
import 'package:todo_app/List/todolist%20fragment.dart';
import 'package:todo_app/database/model/Todo.dart';
import 'package:todo_app/homescreen/bottomsheet/bottomsheet%20widget.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/provider/themeprovider.dart';
import 'package:todo_app/settings/settings%20fragment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class homescreen extends StatefulWidget {
  static final String ROUTE_NAME = 'home screen';

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeprovider>(context);
    return Scaffold(
      backgroundColor: theme.isdarkmodeenaabled()
          ? mythemedata.backgrounddark
          : Color.fromRGBO(223, 236, 219, 1.0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(
              elevation: 0,
              title: Container(
                margin: EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  index == 0 ?AppLocalizations.of(context)!.todolist  :AppLocalizations.of(context)!.settings ,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: theme.isdarkmodeenaabled()?mythemedata.backgrounddark:Colors.white),
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
                backgroundColor: theme.isdarkmodeenaabled()
                    ? mythemedata.secondarydark
                    : mythemedata.secondarycolor,
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
          builder: (context) => bottomsheet());
    });
  }
}
