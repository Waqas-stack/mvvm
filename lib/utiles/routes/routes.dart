




import 'package:flutter/material.dart';
import 'package:mvvm_arch/utiles/routes/routs_name.dart';
import '../../view/home_screen.dart';
import '../../view/loginscreen.dart';
class Routes{

  static Route<dynamic> genrateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutsName.home:
        return MaterialPageRoute(builder: (BuildContext   context)=>Home());
      case RoutsName.login:
        return MaterialPageRoute(builder: (BuildContext   context)=>Login());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text("No route define"),
            ),
          );
        });

    }
  }
}