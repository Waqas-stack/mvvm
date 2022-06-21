





import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_arch/model/user_model.dart';
import 'package:mvvm_arch/utiles/routes/routs_name.dart';
import 'package:mvvm_arch/utiles/utiles.dart';

import '../../viewmodel/login_user_model.dart';

class SplashServics{

  Future<Usermodel> getUSeruser()=> Userviewmodel().getuser();



  void Checkauth(BuildContext context){
  getUSeruser().then((value)async{

    print(value.token.toString());
    if(value.token.toString()=="null"||value.token.toString()==""){
     await Future.delayed(Duration(seconds: 3));
      Navigator.pushNamed(context, RoutsName.login);
    }else{
      Future.delayed(Duration(seconds: 3));
      Navigator.pushNamed(context, RoutsName.home);
    }
  }).onError((error, stackTrace) {
    Utils.flushbarError(error.toString(), context);
    if(kDebugMode){

      print(error.toString());
    }
  });
  }
  // void checkauthication(BuildContext context)async{
  //   getuserdata().then((value) (){
  //     if(value.)
  //   }).onError((error, stackTrace) (){
  //
  //     if(kDebugMode){
  //   print(error.toString());
  //   }
  //
  //   });
  // }


}