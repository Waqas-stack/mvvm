import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_arch/data/response/status.dart';
import 'package:mvvm_arch/utiles/routes/routs_name.dart';
import 'package:provider/provider.dart';

import '../viewmodel/home_view_viewmodel.dart';
import '../viewmodel/login_user_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  HomeViewModel homeViewModel=HomeViewModel();
  @override
  void initState() {
    homeViewModel.fetchmovieslistApi();
    super.initState();
  }

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
          SizedBox(width: 20,),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context)=>homeViewModel,
        child: Consumer<HomeViewModel>(
            builder: (context,value,_){
            switch(value.movieslist.status){
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.Error:
                return Text(value.movieslist.message.toString());
              case Status.completed:
                return ListView.builder(
                  itemCount: value.movieslist.data!.movies!.length,
                    itemBuilder:(context,index){
                      return Card(
                        child:ListTile(
                          title: Text(value.movieslist.data!.movies![index].title.toString()),

                        )
                      );
                    } );
            }
            return Container();
          },
        ),
      )
    );
  }
}
