import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/provider/themeprovider.dart';

class settingbottomsheet extends StatefulWidget {

  @override
  State<settingbottomsheet> createState() => _settingbottomsheetState();
}

class _settingbottomsheetState extends State<settingbottomsheet> {
  @override
  int index = 1;

  Widget build(BuildContext context) {
    final theme=Provider.of<themeprovider>(context);
    return BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
              height: 200,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {

                              if(theme.thememode==ThemeMode.dark){
                                theme.togeletheme();
                              }

                                Navigator.pop(context);
                              ;
                            },
                            child: Text(
                              'Light',
                              style: TextStyle(
                                  color: !theme.isdarkmodeenaabled()
                                      ? mythemedata.primarycolor
                                      : Colors.black,
                                  fontSize: 20),
                            )),Spacer(),!theme.isdarkmodeenaabled()? Icon(Icons.check,color: mythemedata.primarycolor,):Container()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              if(theme.thememode==ThemeMode.light){
                                theme.togeletheme();
                              }
                                Navigator.pop(context);

                            },
                            child: Text(
                              'dark',
                              style: TextStyle(
                                  color: theme.isdarkmodeenaabled()
                                      ? mythemedata.primarycolor
                                      : Colors.black,
                                  fontSize: 20),
                            )),Spacer(),theme.isdarkmodeenaabled()? Icon(Icons.check,color: mythemedata.primarycolor,):Container()
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}

