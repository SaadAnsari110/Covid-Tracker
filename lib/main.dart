
import 'package:covid_19/SearchCountry.dart';
import 'package:covid_19/CountryData.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/home.dart';
import 'package:covid_19/splash.dart';

void main(){
  runApp(covid19());
}

class covid19 extends StatefulWidget {
  const covid19({super.key});

  @override
  State<covid19> createState() => _covid19State();
}

class _covid19State extends State<covid19> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Covid Tracker',
      theme: ThemeData(brightness:Brightness.light,
        scaffoldBackgroundColor: Colors.grey

      ),
      debugShowCheckedModeBanner: false,

      initialRoute: splash.id,
      routes: {
        home.id: (context) => home(),
        splash.id: (context) => splash(),
        flags.id: (context) => flags(),

      },

    );

  }
}
/*     Column(
                              children: [
                                ReuseRow(
                                    title:'Total' ,
                                    value:snapshot.data['cases'].toString()
                                ),
                                ReuseRow(
                                    title:'Recovered' ,
                                    value:snapshot.data['recovered'].toString()
                                ),
                                ReuseRow(
                                    title:'Deaths' ,
                                    value:snapshot.data['deaths'].toString()
                                ),
                                ReuseRow(
                                    title:'Critial',
                                    value:snapshot.data['critical'].toString()),

                              ],
                            )
*/