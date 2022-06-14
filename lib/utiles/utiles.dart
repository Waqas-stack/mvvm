import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
 static tostmessage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: Colors.indigo,
      textColor: Colors.white60,
      toastLength: Toast.LENGTH_LONG,
    );
  }
 static flushbarError(String message,BuildContext context){
   showFlushbar(
       context: context,
       flushbar: Flushbar(
         forwardAnimationCurve: Curves.decelerate,
         margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
         padding: EdgeInsets.all(15),
         borderRadius: BorderRadius.circular(10),
         reverseAnimationCurve: Curves.easeInOutSine,
         positionOffset: 20,
         icon: Icon(Icons.error,size: 25,
           color: Colors.green,
         ),
         flushbarPosition: FlushbarPosition.TOP,
         message: message,
         backgroundColor: Colors.indigo,
         duration: Duration(seconds: 3),

       )..show(context),
   );


 }

 static Sankbarr(String message,BuildContext context){
   return ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
       backgroundColor: Colors.indigo,
         content: Text(message)
     )
   );
 }

 static Focusschange(BuildContext context,
     FocusNode current,FocusNode nextfocus){
   current.unfocus();
   FocusScope.of(context).requestFocus(nextfocus);

 }

}