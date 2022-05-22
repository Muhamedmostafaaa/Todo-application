import 'package:flutter/material.dart';
import 'package:todo_app/database/inithive.dart';
import 'package:todo_app/editscreen/editscreendesign.dart';
import 'package:todo_app/homescreen/homescreen%20widget.dart';

void main(){
init();

  runApp(myapp());


}
class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( theme: ThemeData( colorScheme: ColorScheme.fromSwatch(
      primarySwatch:mythemedata.primarycolor,
    ).copyWith(
      secondary: mythemedata.secondarycolor,)
    ),
routes: {
  homescreen.ROUTE_NAME:(context)=>homescreen(),
  editscreendesign.ROUTE_NAME:(context)=>editscreendesign()
},
      initialRoute: homescreen.ROUTE_NAME,
    );

  }

}
class mythemedata{
 static var primarycolor = Colors.blue;
  static var secondarycolor= Color.fromRGBO(255, 255, 255, 1.0);
  static var changingcheckcolor=Color.fromRGBO(97, 231, 87, 1.0);
}