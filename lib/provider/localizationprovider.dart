import 'package:flutter/material.dart';

class localprovider extends ChangeNotifier{
  String language='en';
  void changelanguage(newlanuguage){
    if(language==newlanuguage){
      return;
    }else{
      language=newlanuguage;
      notifyListeners();
    }
  }

}