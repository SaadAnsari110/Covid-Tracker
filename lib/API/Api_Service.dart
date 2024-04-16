

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covid_19/API/Url_Api.dart';
class service {
  var data;
Future AllData()async{

  final response=await http.get(Uri.parse(Url_Api.allurl));
  if(response.statusCode==200){
    return data=jsonDecode(response.body) ;
  }
  else{
    throw Exception('error');
  }
}



Future<List> AllCountries()async{

  final response= await http.get(Uri.parse(Url_Api.countryurl));
  if(response.statusCode==200){
  return  data=jsonDecode(response.body);

  }
  else{
    throw Exception('error');
  }
}

}




