import 'package:flutter/material.dart';
import 'package:mvvm_arch/utiles/routes/routes.dart';
import 'package:mvvm_arch/utiles/routes/routs_name.dart';
import 'package:mvvm_arch/view/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mvvm Arch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutsName.login,
      onGenerateRoute: Routes.genrateRoute,

      
    );  
  }
}


