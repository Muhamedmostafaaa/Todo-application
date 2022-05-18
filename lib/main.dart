import 'package:flutter/material.dart';
import 'package:todo_app/homescreen/homescreen%20widget.dart';

void main(){
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
  homescreen.ROUTE_NAME:(context)=>homescreen()
},
      initialRoute: homescreen.ROUTE_NAME,
    );

  }

}
class mythemedata{
 static var primarycolor = Colors.blue;
  static var secondarycolor= Color.fromRGBO(255, 255, 255, 1.0);
}