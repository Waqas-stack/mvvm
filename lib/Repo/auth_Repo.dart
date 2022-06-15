
import 'package:mvvm_arch/Resoures/App_url_endpoint.dart';

import '../data/network/Base_api_services.dart';
import '../data/network/networkapi_serevices.dart';

class AuthRepo{

  BaseApiservicecs _apiservicecs=NetworApi();

  Future<dynamic>loginapi(dynamic data)async{
    try{
      dynamic response=_apiservicecs.PostResponse(Appurl.loginurl, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic>Signupapi(dynamic data)async{
    try{
      dynamic response=_apiservicecs.PostResponse(Appurl.registerurl, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}