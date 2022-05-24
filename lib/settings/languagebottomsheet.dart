import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class languagesheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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


                         }



                       ,
                       child: Text(
                         'Arabic',
                         style: TextStyle(
                             color:
                                  mythemedata.primarycolor,

                             fontSize: 20),
                       )),Spacer(), Icon(Icons.check,color: mythemedata.primarycolor,)
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

                         }


                            ,
                       child: Text(
                         'English',
                         style: TextStyle(
                             color:
                                  mythemedata.primarycolor
                                ,
                             fontSize: 20),
                       )),Spacer(), Icon(Icons.check,color: mythemedata.primarycolor,)
                 ],
               ),
             )
           ],
         ),
       ));
  }

}