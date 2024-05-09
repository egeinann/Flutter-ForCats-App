import 'package:flutter/material.dart';

// Jersey font
TextStyle useMyFont(double size,Color color){
  return TextStyle(
    fontFamily: "font", // font parametre oalrak alınacak
    fontSize: size, // boyut parametre olarak istenecek
    fontWeight: FontWeight.w400,
    color: color // renk parametre olarak istenecek
  );
}

// El yazısı font
TextStyle useMyfont2(double size,Color color){
  return TextStyle(
    fontFamily: "font2", // font parametre oalrak alınacak
    fontSize: size, // boyut parametre olarak istenecek
    fontWeight: FontWeight.w400,
    color: color // renk parametre olarak istenecek
  );
}
// iki adet fontFamily(YAZI TİPİ) var "Jersey" "elyazısı"