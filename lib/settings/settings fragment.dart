import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/provider/localizationprovider.dart';
import 'package:todo_app/provider/themeprovider.dart';
import 'package:todo_app/settings/languagebottomsheet.dart';
import 'package:todo_app/settings/settingbottomsheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class settings extends StatefulWidget {
  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeprovider>(context);
    final local = Provider.of<localprovider>(context);
    return Container(
      color: theme.isdarkmodeenaabled()
          ? mythemedata.backgrounddark
          : Color.fromRGBO(223, 236, 219, 1.0),
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    margin: EdgeInsets.only(left: 18),
                    child: Text(
                      AppLocalizations.of(context)!.language,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: theme.isdarkmodeenaabled()
                              ? Colors.white
                              : Colors.black),
                    )),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                         local.language=='en'
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                          style: TextStyle(color: mythemedata.primarycolor),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              onlanguageitcontap();
                            },
                            child: Icon(
                              Icons.arrow_circle_down,
                              color: mythemedata.primarycolor,
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: theme.isdarkmodeenaabled()
                            ? mythemedata.backgrounddark
                            : Colors.white,
                        border: Border.all(color: mythemedata.primarycolor)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    margin: EdgeInsets.only(left: 18),
                    child: Text(
                      AppLocalizations.of(context)!.mode,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: theme.isdarkmodeenaabled()
                              ? Colors.white
                              : Colors.black),
                    )),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          theme.isdarkmodeenaabled()
                              ? AppLocalizations.of(context)!.dark
                              : AppLocalizations.of(context)!.light,
                          style: TextStyle(color: mythemedata.primarycolor),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              onicontao();
                            },
                            child: Icon(
                              Icons.arrow_circle_down,
                              color: mythemedata.primarycolor,
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: theme.isdarkmodeenaabled()
                            ? mythemedata.backgrounddark
                            : Colors.white,
                        border: Border.all(color: mythemedata.primarycolor)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onicontao() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => settingbottomsheet());
  }

  void onlanguageitcontap() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => languagesheet());
  }
}
