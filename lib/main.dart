import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/database/inithive.dart';
import 'package:todo_app/editscreen/editscreendesign.dart';
import 'package:todo_app/homescreen/homescreen%20widget.dart';
import 'package:todo_app/provider/localizationprovider.dart';
import 'package:todo_app/provider/themeprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main(){
init();

  runApp(myapp());


}
class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>localprovider(),
      builder: (context,widget){
        final local=Provider.of<localprovider>(context);
        return  ChangeNotifierProvider(
          create: (context)=>themeprovider(),
          builder: (context,widget){
            themeprovider thememode=Provider.of<themeprovider>(context);
            getdata(thememode);
            return  MaterialApp(
              localizationsDelegates: [
                AppLocalizations.delegate, // Add this line
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(local.language, ''),
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
      },

    );


  }
  void getdata(themeprovider theme)async{
    final prefs = await SharedPreferences.getInstance();
    String? data=prefs.getString('theme');
    if(data=='light'&&theme.isdarkmodeenaabled()){
      theme.togeletheme();
    }else if(data=='dark'&& !theme.isdarkmodeenaabled()){
      theme.togeletheme();
    }
  }


}
class mythemedata{
 static var primarycolor = Colors.blue;
  static var secondarycolor= Color.fromRGBO(255, 255, 255, 1.0);
  static var changingcheckcolor=Color.fromRGBO(97, 231, 87, 1.0);
  static var secondarydark=Color.fromRGBO(20, 25, 34, 1.0);
  static var backgrounddark=Color.fromRGBO(6, 14, 30, 1.0);
  static final darktheme=ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: mythemedata.primarycolor,
      ).copyWith(
        secondary: mythemedata.secondarycolor,)

  );
  static final lighttheme=ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch:mythemedata.primarycolor,
      ).copyWith(
        secondary:secondarydark ,)
  );
}