import 'package:mvvm_arch/Resoures/App_url_endpoint.dart';

import '../data/network/Base_api_services.dart';
import '../data/network/networkapi_serevices.dart';
import '../model/movieslistmodel.dart';

class HomeRepos{


  BaseApiservicecs _apiservicecs=NetworApi();
  
  
  Future<Movieslist>fetchMovieslist()async{
    try{
      dynamic response=_apiservicecs.getResponse(Appurl.movieslistendpoint);
      return response=Movieslist.fromJson(response);

    }catch(e){
      throw e;
    }
  }



}