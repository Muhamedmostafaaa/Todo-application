

import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class themeprovider extends ChangeNotifier {
  ThemeMode thememode = ThemeMode.light;

  void togeletheme(){
    if(thememode==ThemeMode.light){
      thememode=ThemeMode.dark;
    }else {thememode=ThemeMode.light;}
    notifyListeners();
  }
  bool isdarkmodeenaabled(){
    if(thememode==ThemeMode.dark){
      return true;
    }else return false;
  }

}