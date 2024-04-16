import 'package:covid_19/API/Api_Service.dart';
import 'package:covid_19/CountryData.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class flags extends StatefulWidget {

    static String id='flags';
  const flags({super.key});

  @override
  State<flags> createState() => _flagsState();
}

class _flagsState extends State<flags>with TickerProviderStateMixin {

  TextEditingController control=TextEditingController();
  
  
  
  @override
  Widget build(BuildContext context) {
    service sservice=service();
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20),
              child: TextFormField(

                onChanged:(value){
                  setState(() {
                  });
                },
                controller: control,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'enter country name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),

              ),
            ),
            FutureBuilder(
                future:sservice.AllCountries(),
                builder:(context,snapshot) {

              if(snapshot.hasData){
                return Expanded(
                    child:ListView.builder(
                        itemCount:snapshot.data!.length,
                        itemBuilder:(context,index){
                          String name=snapshot.data![index]['country'];

                          if(control.text.isEmpty){
                            return InkWell(onTap: (){
                              Navigator.push(context,MaterialPageRoute(
                                  builder:(context)=>search_country(
                                    name:snapshot.data![index]['country'],
                                    image:snapshot.data![index]['countryInfo']['flag'],
                                    cases:snapshot.data![index]['cases'],
                                    deaths:snapshot.data![index]['deaths'],
                                    recovered:snapshot.data![index]['recovered'],
                                    active:snapshot.data![index]['active'],
                                    critical:snapshot.data![index]['critical'],
                                  )
                              )
                              );
                            },
                              child: ListTile(
                                  leading:Image(width: 50, height: 50,
                                    image: NetworkImage(snapshot.data![index]['countryInfo']['flag']),) ,
                                  title:Text(snapshot.data![index]['country']),
                                ),
                            );
                          }
                          else if(name.toLowerCase().contains(control.text.toLowerCase())){

                            return InkWell(onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 search_country(
                                   name:snapshot.data![index]['country'].toString(),
                                   image:snapshot.data![index]['countryInfo']['flag'],
                                   cases:snapshot.data![index]['cases'],
                                   deaths:snapshot.data![index]['deaths'],
                                   recovered:snapshot.data![index]['recovered'],
                                   active:snapshot.data![index]['active'],
                                   critical:snapshot.data![index]['critical'],
                                 )
                              )
                             );
                            },
                              child: ListTile(
                                leading:Image(width: 50, height: 50,
                                  image: NetworkImage(snapshot.data![index]['countryInfo']['flag']),) ,
                                title:Text(snapshot.data![index]['country']),
                              ),
                            );
                          }
                          else{
                            Container(child: Text('No Data'),);
                          }

                        }
                    )
                );

              }
              else{
                return Expanded(
                  child: ListView.builder(
                    itemCount:4,
                      itemBuilder:(context,index){
                      return Shimmer.fromColors(
                          highlightColor:Colors.white,
                          baseColor:Colors.white,
                         child:Column(
                           children: [
                             ListTile(
                             title:Container(height: 10,width: 89,color: Colors.white,)  ,
                             subtitle:Container(height: 10,width: 89,color: Colors.white,) ,
                               leading:Container(height: 50,width: 50,color: Colors.white,) ,
                           ),
                        ],
                         ),
                      );
                      }

                  ),
                );
              }
                }
            )

          ],
        ),
      ),
    );
  }
}
