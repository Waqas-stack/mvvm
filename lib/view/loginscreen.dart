import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_arch/utiles/utiles.dart';
import 'package:provider/provider.dart';

import '../Resoures/componets/rounded_button.dart';
import '../utiles/routes/routs_name.dart';
import '../viewmodel/auth_view_model.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ValueNotifier<bool> _obsecu=ValueNotifier<bool>(true);
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  FocusNode emailfocus=FocusNode();
  FocusNode passwordfocus=FocusNode();

 @override
  void dispose() {
  email.dispose();
  password.dispose();
  emailfocus.dispose();
  passwordfocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewmodel=Provider.of<AuthViewmodel>(context);
    // final height=MediaQuery.of(context).size.height*1;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Login"),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailfocus,
                decoration: const InputDecoration(
                    hintText: "Email",
                    prefix: Icon(Icons.alternate_email,color: Colors.indigo,),
                ),
                onFieldSubmitted: (value){
                  Utils.Focusschange(context, emailfocus, passwordfocus);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                  valueListenable:_obsecu ,
                  builder: (context,value,child){
                    return  TextFormField(
                      obscureText: _obsecu.value,
                      controller: password,
                      focusNode: passwordfocus,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefix: Icon(Icons.lock_open_rounded,color: Colors.indigo,),
                          suffixIcon:
                          InkWell(
                            onTap: (){
                              _obsecu.value =!_obsecu.value;
                            },
                              child:Icon(
                                _obsecu.value? Icons.visibility_off_outlined:Icons.visibility,color: Colors.indigo,
                              )
                          ),

                      ),
                    );
                  }
              ),
              SizedBox(
                height: 12.h
              ),
              CutomButton(
                loading: authviewmodel.loading,
                ontap: () {
                if(email.text.isEmpty){
                  Utils.flushbarError("please Enter Email", context);
                }else if(password.text.isEmpty){
                  Utils.flushbarError("please Enter Password", context);
                }else if(password.text.length<6){
                  Utils.flushbarError("please Enter 6 digit password", context);
                }else{
                  Map data={
                    // "email":email.text.trim().toString(),
                    // "password":password.text.trim().toString(),
                    "email": "eve.holt@reqres.in",
                    "password": "cityslicka"
                  };

                  authviewmodel.loginapi(data,context);
                  print("api hit");
                }

              }, tittle: 'login',),
              SizedBox(
                height: 12.h
              ),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, RoutsName.signup);
              }, child: Text("don't hava a account?Signup"))

            ],
          ),
        ),
      ),
    );
  }
}
