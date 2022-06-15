import 'package:flutter/material.dart';
import 'package:mvvm_arch/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userviewmodel with ChangeNotifier{


  Future<bool>Saveuser(Usermodel usermodel)async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("token", usermodel.token.toString());
    notifyListeners();
    return true;
  }


  Future<Usermodel>getuser()async {
  final SharedPreferences sp=await SharedPreferences.getInstance();
  final String? token=sp.getString("token");
    return Usermodel(
      token:token.toString(),
    );
}
  Future<bool> remove()async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    sp.remove("token");
    return true;

  }
}