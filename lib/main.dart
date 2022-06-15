import 'package:flutter/material.dart';
import 'package:mvvm_arch/utiles/routes/routes.dart';
import 'package:mvvm_arch/utiles/routes/routs_name.dart';
import 'package:mvvm_arch/view/loginscreen.dart';
import 'package:mvvm_arch/viewmodel/auth_view_model.dart';
import 'package:mvvm_arch/viewmodel/login_user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>AuthViewmodel()),
          ChangeNotifierProvider(create: (_)=>Userviewmodel()),


        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mvvm Arch',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutsName.splash,
        onGenerateRoute: Routes.genrateRoute,


      ),
    );
  }
}


