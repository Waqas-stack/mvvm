import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_arch/utiles/utiles.dart';

import '../Resoures/componets/rounded_button.dart';
import '../utiles/routes/routs_name.dart';

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
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height*1;
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
                    labelText: "Email"
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
                          labelText: "password",
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
                height: height*.1,
              ),
              CutomButton(),

            ],
          ),
        ),
      ),
    );
  }
}
