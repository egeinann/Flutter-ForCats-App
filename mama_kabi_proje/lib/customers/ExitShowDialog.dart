import 'package:flutter/material.dart';
import 'package:For_Cats_Codes/customers/colors.dart';
import 'package:For_Cats_Codes/customers/fonts.dart';

// KULLANICI ÇIKIŞ YAPMAK İSTEDİĞİNDE BU DİALOG GÖSTERİLİR
Future<bool> exitShowDialog(BuildContext context, String wherego) async {
  bool exitConfirmed = false;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "ÇIKIŞ",
          style: useMyFont(MediaQuery.of(context).size.width * 0.07, MyColors.myDarkBlue_1),
        ),
        content: Text(
          "Giriş için parolayı tekrar\ngirmeniz gerekecek !",
          style: useMyFont(MediaQuery.of(context).size.width * 0.06, MyColors.myDarkBlue_2),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Kullanıcı iptal etti
              Navigator.of(context).pop(false);
            },
            child: Text(
              "İPTAL",
              style: useMyFont(MediaQuery.of(context).size.width * 0.07, MyColors.myGrey),
            ),
          ),
          TextButton(
            onPressed: () {
              // Kullanıcı onayladı
              Navigator.pushNamed(context, wherego);
            },
            child: Text(
              "ÇIK",
              style: useMyFont(MediaQuery.of(context).size.width * 0.06, Colors.red.shade800),
            ),
          ),
        ],
      );
    },
  ).then((value) {
    exitConfirmed = value ?? false;
  });

  return exitConfirmed;
}