import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:For_Cats_Codes/customers/colors.dart';
import 'package:For_Cats_Codes/customers/fonts.dart';

// EKRANIN ÜSTÜNDEN İNEN SNACKBAR BİLDİRİMİ
 void mySnackBar(BuildContext context,String message,Color color,Icon icon) {
    awesomeTopSnackbar(
      context,
      message,
      textStyle: useMyFont(20, MyColors.myBlack),
      backgroundColor: color,
      icon: icon,
      iconWithDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
    );
  }

