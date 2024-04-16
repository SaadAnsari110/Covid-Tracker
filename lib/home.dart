
import 'package:covid_19/API/Api_Service.dart';
import 'package:covid_19/SearchCountry.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';


class home extends StatefulWidget {
 static String id='home';
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home>with TickerProviderStateMixin {

 late  AnimationController controller=AnimationController(
      duration: Duration(seconds: 5),
      vsync: this)..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }


final colorlist =[
  const  Color(0xff00FA9A),
  const Color(0xffDDA0DD),
  const Color(0xff87CEFA),
  const Color(0xff8A2BE2),

  ];

  @override
  Widget build(BuildContext context) {

    service sservice=service();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff00FA9A),
          title:Center(child: Text('Covid Tracker',style: TextStyle(fontWeight: FontWeight.bold),),),
          centerTitle: true,
        ),
        body:SafeArea(
          child: Column(
                   children: [
                   SizedBox(height: 10,)  ,
                     FutureBuilder(
                       future: sservice.AllData(),
                       builder: (context,snapshot){
                         if(snapshot.hasData){
                         return
                            Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 SizedBox(height:50,),
                                 PieChart(
                                   dataMap:{
                                     'Total':double.parse(snapshot.data['cases'].toString()),
                                     'Active':double.parse(snapshot.data['active'].toString()),
                                     'Recovered':double.parse(snapshot.data['recovered'].toString()),
                                     'Deaths':double.parse(snapshot.data['deaths'].toString()),
                                   },
                                   chartValuesOptions: ChartValuesOptions(
                                       showChartValuesInPercentage:true ),
                                   colorList:colorlist,
                                   legendOptions: LegendOptions(
                                     legendPosition: LegendPosition.left,
                                   ),
                                   chartType:ChartType.ring,
                                   chartRadius:MediaQuery.of(context).size.width/3.2,
                                 ),
                                 SizedBox(height: 50,),
                                 Padding(padding:EdgeInsets.all(10),
                                   child:Column(
                                     children: [
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                         children: [
                                           Container(
                                             child:Column(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                                 Center(child: Text(style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.black),
                                                     'Total')),
                                                 SizedBox(height: 10,),
                                                 Center(child: Text(snapshot.data['cases'].toString(),
                                                     style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.black)),
                                                 ),
                                               ],
                                             ),
                                             decoration: BoxDecoration(
                                               color: Color(0xff00FA9A),
                                               borderRadius: BorderRadius.circular(20),
                                               shape: BoxShape.rectangle,
                                             ),
                                             width:170,
                                             height: 150,
                                           ),
                                           Container(
                                             child:Column(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                                 Center(child: Text(style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.black),
                                                     'Active')),
                                                 SizedBox(height: 10,),
                                                 Center(child: Text(snapshot.data['active'].toString(),
                                                     style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.black)),
                                                 ),
                                               ],
                                             ),
                                             decoration: BoxDecoration(
                                               color: Color(0xff00FA9A),
                                               borderRadius: BorderRadius.circular(20),
                                               shape: BoxShape.rectangle,
                                             ),
                                             width:170,
                                             height: 150,
                                           )
                                         ],
                                       ),
                                       SizedBox(height: 30,),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                         children: [
                                           Container(
                                             child:Column(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                                 Center(child: Text(style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.black),
                                                     'Recovered')),
                                                 SizedBox(height: 10,),
                                                 Center(child: Text(snapshot.data['recovered'].toString(),
                                                     style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.black)),
                                                 ),
                                               ],
                                             ),
                                             decoration: BoxDecoration(
                                               color: Color(0xff00FA9A),
                                               borderRadius: BorderRadius.circular(20),
                                               shape: BoxShape.rectangle,
                                             ),
                                             width:170,
                                             height: 150,
                                           ),
                                           Container(
                                             child:Column(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                                 Center(child: Text(style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.black),
                                                     'Death')),
                                                 SizedBox(height: 10,),
                                                 Center(child: Text(snapshot.data['deaths'].toString(),
                                                     style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.black)),
                                                 ),
                                               ],
                                             ),
                                             decoration: BoxDecoration(
                                               color: Color(0xff00FA9A),
                                               borderRadius: BorderRadius.circular(20),
                                               shape: BoxShape.rectangle,
                                             ),
                                             width:170,
                                             height: 150,
                                           )

                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                                 SizedBox(height:20,),
                                 InkWell(onTap: (){
                                   Navigator.pushNamed(context,flags.id);
                                 },
                                   child: Container(
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(20),
                                         color: Color(0xff87CEFA)
                                     ),
                                     height: 50,
                                     width: MediaQuery.of(context).size.width*0.3,

                                     child: Center(child: Text('NEXT',style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.black),)),
                                   ),

                                 ),
                               ]

                           );

                         }
                         else{
                           return   Center(
                             child: SpinKitFadingCircle(
                               color: Color(0xff87CEFA),
                               size: 100.0,
                               controller: controller,
                             ),
                           );

                         }
                       }
      ),


      ]
      ),
        )
                );


            }

          }

class ReuseRow extends StatelessWidget {
  String title,value;
   ReuseRow({super.key,required this.title,required this.value,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

              Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              Text(value,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),



        ],
      ),
    );
  }
}

