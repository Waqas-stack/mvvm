import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_arch/utiles/routes/routs_name.dart';
import 'package:provider/provider.dart';

import '../Resoures/componets/rounded_button.dart';
import '../utiles/utiles.dart';
import '../viewmodel/auth_view_model.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
              CutomButton(
                loading: authviewmodel.loadings,
                ontap: () {
                  if(email.text.isEmpty){
                    Utils.flushbarError("please Enter Email", context);
                  }else if(password.text.isEmpty){
                    Utils.flushbarError("please Enter Password", context);
                  }else if(password.text.length<6){
                    Utils.flushbarError("please Enter 6 digit password", context);
                  }else{
                    Map data={
                      "email":email.text.trim().toString(),
                      "password":password.text.trim().toString(),
                    };
                    authviewmodel.Signapi(data,context);
                    print("api hit");
                  }

                }, tittle: 'Signup',),
              SizedBox(
                height: height*.02,
              ),
              TextButton(
                  onPressed: (){
                Navigator.pushNamed(context, RoutsName.login);
              },
                  child: Text("Already hava a account ?Login",),

              )

            ],
          ),
        ),
      ),
    );
  }
}
