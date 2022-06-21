import 'package:flutter/foundation.dart';
import 'package:mvvm_arch/data/response/api_response.dart';
import 'package:mvvm_arch/model/movieslistmodel.dart';

import '../Repo/home_Repo.dart';

class HomeViewModel with ChangeNotifier{

 final _myhomerepo=HomeRepos();

 ApiResponses<Movieslist> movieslist=ApiResponses.loading();



 setMovieslist(ApiResponses<Movieslist> response){

   movieslist=response;
   print(movieslist);

   notifyListeners();

 }


 Future<void> fetchmovieslistApi()async{

   setMovieslist(ApiResponses.loading());

  _myhomerepo.fetchMovieslist().then((value){

    setMovieslist(ApiResponses.completed(value));

  }).onError((error, stackTrace){

    setMovieslist(ApiResponses.error(error.toString()));

  });
 }

}