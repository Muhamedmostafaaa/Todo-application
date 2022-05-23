import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/inithive.dart';
import 'package:todo_app/editscreen/editscreendesign.dart';
import 'package:todo_app/homescreen/homescreen%20widget.dart';
import 'package:todo_app/provider/themeprovider.dart';

void main(){
init();

  runApp(myapp());


}
class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>themeprovider(),
     builder: (context,widget){
        themeprovider thememode=Provider.of<themeprovider>(context);
        return  MaterialApp(
          darkTheme:mythemedata.darktheme,
          theme:mythemedata.lighttheme
          ,themeMode: thememode.thememode,
          routes: {
            homescreen.ROUTE_NAME:(context)=>homescreen(),
            editscreendesign.ROUTE_NAME:(context)=>editscreendesign()
          },
          initialRoute: homescreen.ROUTE_NAME,
        );
     }
     ,
    );

  }

}
class mythemedata{
 static var primarycolor = Colors.blue;
  static var secondarycolor= Color.fromRGBO(255, 255, 255, 1.0);
  static var changingcheckcolor=Color.fromRGBO(97, 231, 87, 1.0);
  static final darktheme=ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ).copyWith(
        secondary: mythemedata.secondarycolor,)

  );
  static final lighttheme=ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch:mythemedata.primarycolor,
      ).copyWith(
        secondary: mythemedata.secondarycolor,)
  );
}