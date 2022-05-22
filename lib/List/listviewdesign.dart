import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/editscreen/editscreendesign.dart';
import 'package:todo_app/main.dart';

import '../database/model/Todo.dart';

class listviewdesign extends StatefulWidget {
  Todo todo;
  static bool isclicked = false;
  Function ondeletetap;

  listviewdesign(this.todo, this.ondeletetap);

  @override
  State<listviewdesign> createState() => _listviewdesignState();
}

class _listviewdesignState extends State<listviewdesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, editscreendesign.ROUTE_NAME,
            arguments: widget.todo);
      },
      child: Container(
        margin: EdgeInsets.all(7),
        child: Slidable(
            startActionPane: ActionPane(
              extentRatio: 0.25,
              motion: ScrollMotion(),
              children: [
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          color: Colors.red,
                        ),
                        height: 110,
                        padding: EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                widget.ondeletetap(widget.todo);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'delete',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )))
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(0),
              height: 120,
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  color: mythemedata.secondarycolor,
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.values[4],
                  children: [
                    Container(
                        color: listviewdesign.isclicked
                            ? mythemedata.changingcheckcolor
                            : mythemedata.primarycolor,
                        width: 5,
                        height: 80),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.todo.title,
                          style: TextStyle(
                              color: listviewdesign.isclicked
                                  ? mythemedata.changingcheckcolor
                                  : mythemedata.primarycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.date_range_rounded,
                              size: 14,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              DateFormat('dd-MM-yyyy').format(widget.todo.date),
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        oncheckclick();
                      },
                      child: listviewdesign.isclicked
                          ? Text(
                              'Done!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: mythemedata.changingcheckcolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: listviewdesign.isclicked
                                    ? Colors.lightGreen
                                    : mythemedata.primarycolor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 70,
                              height: 40,
                              child: Icon(
                                Icons.check,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  void oncheckclick() {
    setState(() {
      if (listviewdesign.isclicked) {
        listviewdesign.isclicked = false;
      } else
        listviewdesign.isclicked = true;
    });
  }
}
