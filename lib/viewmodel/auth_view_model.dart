import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_arch/utiles/utiles.dart';
import 'package:provider/provider.dart';

import '../Repo/auth_Repo.dart';
import '../model/user_model.dart';
import '../utiles/routes/routs_name.dart';
import 'login_user_model.dart';

class AuthViewmodel with ChangeNotifier{
  final _myrepo=AuthRepo();
  bool _loading=false;
  bool get loading=>_loading;
  bool _loadings=false;
  bool get loadings=>_loadings;



  setloadin(bool vallue){
    _loading=vallue;
    notifyListeners();
  }

  setsignup(bool vallue){
    _loadings=vallue;
    notifyListeners();
  }
  Future<void> loginapi(dynamic data,BuildContext context)async{
    setloadin(true);

    _myrepo.loginapi(data).then((value){
      setloadin(false);
      final user=Provider.of<Userviewmodel>(context,listen: false);
      user.Saveuser(
          Usermodel(
            token: value['token'].toString()
          )
      );
      Utils.flushbarError("Login sucess", context);
      Navigator.pushNamed(context, RoutsName.home);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setloadin(false);
      if(kDebugMode){
        Utils.flushbarError(error.toString(), context);
        print(error.toString());
      }
    });

  }

  Future<void> Signapi(dynamic data,BuildContext context)async{
    setsignup(true);

    _myrepo.Signupapi(data).then((value){
      setsignup(false);
      Utils.flushbarError("Signup sucess", context);
      Navigator.pushNamed(context, RoutsName.home);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setsignup(false);
      if(kDebugMode){
        Utils.flushbarError(error.toString(), context);
        print(error.toString());
      }
    });

  }
}