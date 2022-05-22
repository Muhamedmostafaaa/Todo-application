import 'package:flutter/material.dart';

import '../database/model/Todo.dart';

class appprovider extends ChangeNotifier{
  List<Todo>list=[];
void validate(List<Todo>newlist){
  list=newlist;
  notifyListeners();

}
}