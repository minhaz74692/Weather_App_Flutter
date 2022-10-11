//ignore_for_file: prefer_const_constructors
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHandle {
  NetworkHandle({required this.url});
  final String url;

  Future getData() async{
    http.Response response =await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      String data = response.body;
      // print(jsonDecode(data));
      return jsonDecode(data);
    }else{
      // print(response.statusCode) ;
      return response.statusCode;
    }
  }
}