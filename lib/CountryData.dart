import 'package:covid_19/API/Api_Service.dart';
import 'package:covid_19/home.dart';
import 'package:flutter/material.dart';

class search_country extends StatefulWidget {
String name;
String image;
int cases,deaths,recovered,active,critical;

  static String id='search_country';
 search_country({super.key, required this.name,required this.image,required this.cases,required this.deaths,
 required this.recovered,required this.active,required this.critical});

  @override
  State<search_country> createState() => _search_countryState();
}

class _search_countryState extends State<search_country> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
        backgroundColor: Color(0xff00FA9A),
      centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
Stack(
  alignment: Alignment.topCenter,
  children: [
    Padding(padding: EdgeInsets.only(top:40,left: 10,right: 10),
      child: Card(

        color: Color(0xff00FA9A),

        child:Column(
          children:[
SizedBox(height: 30,),
            ReuseRow(title:'Cases', value:widget.cases.toString()),

        SizedBox(height: 30,),
            ReuseRow(title:'Active' , value:widget.active.toString()),

            SizedBox(height: 30,),

            ReuseRow(title:'Recovered' , value:widget.recovered.toString() ),

            SizedBox(height: 30,),

            ReuseRow(title:'Deaths' , value:widget.deaths.toString()  ),

            SizedBox(height: 30,),

            ReuseRow(title:'Critical' , value:widget.critical.toString() )

        ]
        ),
      ),
    ),
    CircleAvatar(
      backgroundImage: NetworkImage(widget.image,
      ),
      radius: 50,
    )
  ],
)
        ],
      ),
    );
  }
}
