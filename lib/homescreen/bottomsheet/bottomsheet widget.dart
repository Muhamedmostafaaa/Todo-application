import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/main.dart';
import 'package:intl/intl.dart';

import '../../database/model/Todo.dart';

class bottomsheet extends StatefulWidget{
  @override
  State<bottomsheet> createState() => _bottomsheetState();
}

class _bottomsheetState extends State<bottomsheet> {
  String title = '';

  String content = '';

  DateTime? date = null;


  bool titeleroor=false;

  bool contenterorr=false;

  bool dateerorr=false;


  @override
  Widget build(BuildContext context) {

    return BottomSheet(
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
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  decoration: TextDecoration.underline),
            ),
            TextField(
              onChanged: (newtext) {
                title = newtext;
                if(newtext.isNotEmpty){
                  titeleroor=false;
                }
              },
              decoration: InputDecoration(
                  errorText: titeleroor?'please enter a valid title':null,
                  labelText: 'Title',
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'enter the  task'),
            ),
            TextField(

              onChanged: (newtext) {
                content = newtext;
                if(newtext.isNotEmpty){
                  contenterorr=false;
                }
              },
              decoration: InputDecoration(
                  errorText: contenterorr?'please enter a valid content':null,
                  labelText: 'Content',
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'write content'),
            ),
            InkWell(
              onTap: () async {
                var selecteddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate:
                    DateTime.now().add(Duration(days: 300)));
                setState((){date = selecteddate!;});



              },
              child:date==null? Text(
                'select date',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,color:dateerorr?Colors.red:Colors.black),
              ):Text(
               DateFormat('dd-MM-yyyy').format(date!).toString() ,style: TextStyle(color: Colors.black,fontSize:18),),

            ),
            ElevatedButton(
              onPressed: () {
                onaddtap();
              },
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
    );
  }

  void onaddtap() async {
    validation();
    if(validation()){
      DateFormat('dd-MM-yyyy').format(date!);
      Todo todo = Todo(title: title, date: date!, content: content);
      var box = await Hive.openBox<Todo>(Todo.Boxname);
      box.add(todo);
      Navigator.pop(context);}else return;
  }

  bool validation(){
    bool valid=true;
    if(title.isEmpty){
      setState((){
        valid=false;
        titeleroor=true;

      }
      );

    } if(content.isEmpty){
      setState((){
        valid=false;
        contenterorr=true;
      });
    } if(date==null){
      setState((){
        valid=false;
        dateerorr=true;
      });
    }

    return valid;

  }
}