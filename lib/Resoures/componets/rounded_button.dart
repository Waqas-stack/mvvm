import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_arch/Resoures/colorss/app_color.dart';

class CutomButton extends StatelessWidget {
  final String tittle;
  final bool loading;
  final VoidCallback ontap;
  const CutomButton({Key? key,
    required this.tittle,
    this.loading=false,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: AppColor.Indeoc,
          borderRadius: BorderRadius.circular(10)

        ),
        child:loading?Center(child: CircularProgressIndicator(color: Colors.white60,)): Center(child: Text(tittle,style: GoogleFonts.lato(
          color: Colors.white
        ),)),
      ),
    );
  }
}
