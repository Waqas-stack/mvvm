import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Resoures/colorss/app_color.dart';
import '../viewmodel/services/splash_services.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashServics splashServics=SplashServics();
  @override
  void initState() {
    super.initState();
    splashServics.Checkauth(context);

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text("Splash Screen",style: GoogleFonts.lato(
                color: AppColor.Indeoc,
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),),
            )
          ],
        ),
      ),
    );
  }
}
