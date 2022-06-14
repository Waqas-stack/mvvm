import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_arch/data/app_exceptionss.dart';

import 'Base_api_services.dart';
import 'package:http/http.dart'as http;
class NetworApi extends BaseApiservicecs{
  @override
  Future PostResponse(String url,dynamic data)async {
    dynamic responseJson;
    try{
     Response response=await post(
       Uri.parse(url),
       body: data
     ).timeout(Duration(seconds: 10));
      responseJson=reuturnResponse(response);
    }on SocketException{
      throw FetchdataExpection("No internet connection");
    }
    return responseJson;
  }

  @override
  Future getResponse(String url)async {
    dynamic responseJson;
    try{
      final response=await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson=reuturnResponse(response);
    }on SocketException{
      throw FetchdataExpection("No internet connection");
    }
    return responseJson;
  }

  dynamic reuturnResponse(http.Response response){

    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExpection(response.body.toString());
      case 404:
        throw UnauthrozedExpection(response.body.toString());
      default:
        throw FetchdataExpection
          ("error occued while communticated with server"+"with sattus code"
            +response.statusCode.toString());

    }


  }


}