import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/database/model/Todo.dart';
import 'package:todo_app/main.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class editscreendesign extends StatefulWidget {
  static final String ROUTE_NAME = 'editscreen';

  @override
  State<editscreendesign> createState() => _editscreendesignState();
}

class _editscreendesignState extends State<editscreendesign> {
  String title = '';

  String content = '';

  DateTime? date = null;

  bool titeleroor = false;

  bool contenterorr = false;

  bool dateerorr = false;
int counter=0;
  @override
  Widget build(BuildContext context) {
    Todo todo = ModalRoute
        .of(context)!
        .settings
        .arguments as Todo;
if(counter==0) {

  content = todo.content;
  title = todo.title;
  date = todo.date;
  counter++;
}
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromRGBO(223, 236, 219, 1.0),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 600,
            child: AppBar(
                title: Text(
              AppLocalizations.of(context)!.todolist,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
          ),
          Center(
            child: Container(
              height: 500,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppLocalizations.of(context)!.edittask,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline),
                  ),
                  TextFormField(
                    initialValue: todo.title,
                    onChanged: (newtext) {
                      title = newtext;
                      if (newtext.isNotEmpty) {
                        titeleroor = false;
                      }
                    },
                    decoration: InputDecoration(
                        errorText:
                            titeleroor ? 'please enter a valid title' : null,
                        labelText: AppLocalizations.of(context)!.title,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'enter the  task'),
                  ),
                  TextFormField(
                    initialValue: todo.content,
                    onChanged: (newtext) {
                      content = newtext;
                      if (newtext.isNotEmpty) {
                        contenterorr = false;
                      }
                    },
                    decoration: InputDecoration(
                        errorText: contenterorr
                            ? 'please enter a valid content'
                            : null,
                        labelText: AppLocalizations.of(context)!.content,
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
                          lastDate: DateTime.now().add(Duration(days: 300)));
                      setState(() {
                        date = selecteddate!;
                      });
                    },
                    child: date == null
                        ? Text(
                      AppLocalizations.of(context)!.selectdate,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: dateerorr ? Colors.red : Colors.black),
                          )
                        : Text(
                            DateFormat('dd-MM-yyyy').format(date!).toString(),
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                  ),
                  ElevatedButton(

                    onPressed: () {
                      save(todo);
                    },
                    child: Text(AppLocalizations.of(context)!.savechanges,
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8))),
                        backgroundColor: MaterialStateProperty.all(
                            mythemedata.primarycolor)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }



  bool validation() {
    bool valid = true;
    if (title.isEmpty) {
      setState(() {
        valid = false;
        titeleroor = true;

      });
    }
    if (content.isEmpty) {
      setState(() {
        valid = false;
        contenterorr = true;

      });
    }
    if (date == null) {
      setState(() {
        valid = false;
        dateerorr = true;

      });
    }

    return valid;
  }

  void save(Todo item)async{
    if(validation()){
    var box=await Hive.openBox<Todo>(Todo.Boxname);
    int index= box.values.toList().indexOf(item);
    item.date=date!;
    item.content=content;
    item.title=title;
    box.putAt(index, item);
    Navigator.pop(context);}else return;
    
  }
}
