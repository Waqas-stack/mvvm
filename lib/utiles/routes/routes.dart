




import 'package:flutter/material.dart';
import 'package:mvvm_arch/utiles/routes/routs_name.dart';
import '../../view/home_screen.dart';
import '../../view/loginscreen.dart';
import '../../view/signup_screen.dart';
import '../../view/splash_screen.dart';
class Routes{

  static Route<dynamic> genrateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutsName.home:
        return MaterialPageRoute(builder: (BuildContext   context)=>Home());
      case RoutsName.login:
        return MaterialPageRoute(builder: (BuildContext   context)=>Login());
      case RoutsName.signup:
        return MaterialPageRoute(builder: (BuildContext   context)=>Signup());
      case RoutsName.splash:
        return MaterialPageRoute(builder: (BuildContext   context)=>Splash());
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