import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_arch/utiles/routes/routs_name.dart';
import 'package:provider/provider.dart';

import '../viewmodel/login_user_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final USer=Provider.of<Userviewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          TextButton(
              onPressed: (){
                USer.remove().then((value) {
                  Navigator.pushNamed(context, RoutsName.login);
                });
          },
              child: Text("Logout",style: GoogleFonts.lato(
                color: Colors.black,
              ),),

          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
