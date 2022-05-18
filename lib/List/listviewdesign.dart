import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/main.dart';

class listviewdesign extends StatefulWidget {
  @override
  State<listviewdesign> createState() => _listviewdesignState();
}

class _listviewdesignState extends State<listviewdesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                          Icon(
                            Icons.delete,
                            color: Colors.white,
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
            height: 120
            ,
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
                      color: mythemedata.primarycolor, width: 5, height: 80),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('hello'),
                      Row(
                        children: [
                          Icon(Icons.date_range_rounded),
                          Text('12/11/2022')
                        ],
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: mythemedata.primarycolor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 70,
                    height: 40,
                    child: Icon(
                      Icons.check,
                      size: 35,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
