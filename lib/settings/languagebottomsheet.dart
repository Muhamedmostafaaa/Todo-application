import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/provider/localizationprovider.dart';

class languagesheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final local=Provider.of<localprovider>(context);
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
                              local.changelanguage('ar');
                              Navigator.pop(context);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.arabic,
                              style: TextStyle(
                                  color:local.language=='ar'? mythemedata.primarycolor:Colors.black,
                                  fontSize: 20),
                            )),
                        Spacer(),
                       local.language=='ar'? Icon(
                          Icons.check,
                          color: mythemedata.primarycolor,
                        ):Container()
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
                              local.changelanguage('en');
                              Navigator.pop(context);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.english,
                              style: TextStyle(
                                  color: local.language=='en'? mythemedata.primarycolor:Colors.black,
                                  fontSize: 20),
                            )),
                        Spacer(),
                       local.language=='en'? Icon(
                          Icons.check,
                          color: mythemedata.primarycolor,
                        ):Container()
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
