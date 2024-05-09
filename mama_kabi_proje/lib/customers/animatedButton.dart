import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:For_Cats_Codes/customers/colors.dart';
// BU SAYFA EFEKTİF İÇE GÖÇEN BUTTONLAR İLE İLGİLİ (PAKET KULLANILDI)
// ANASAYFADAKİ BÜYÜK BUTTONLAR
Widget bigAnimatedContainer(BuildContext context, isPressed, bool inset, Widget child) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: AnimatedContainer(
      height: MediaQuery.of(context).size.height*0.22, // BUTTON BOYUTLARI İLE OYNAYABİLİRSİNİZ YÜKSEKLİK
      width: MediaQuery.of(context).size.width*0.43, // BUTTON BOYUTLARI İLE OYNAYABİLİRSİNİZ GENİŞLİK
      duration: const Duration(milliseconds: 70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MyColors.myDarkBlue_2,
        boxShadow: [
          BoxShadow(
            blurRadius: isPressed ? 1 : 0.3,
            offset: -(isPressed ? const Offset(6, 6) : const Offset(6, 6)),
            color: MyColors.myDarkBlue_2,
            inset: inset,
          ),
          BoxShadow(
            blurRadius: isPressed ? 1 : 0.3,
            offset: isPressed ? const Offset(6, 6) : const Offset(6, 6),
            color: MyColors.myBlack,
            inset: inset,
          ),
        ],
      ),
      child: child,
    ),
  );
}

// ADMİN SAYFASI GİRİŞ YAP DÜĞMESİ
Widget longAnimatedContainer(BuildContext context, isPressed, bool inset, Widget child) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: AnimatedContainer(
      height: MediaQuery.of(context).size.height*0.10, // BUTTON BOYUTLARI İLE OYNAYABİLİRSİNİZ YÜKSEKLİK
      width: MediaQuery.of(context).size.width*0.56, // BUTTON BOYUTLARI İLE OYNAYABİLİRSİNİZ GENİŞLİK
      duration: const Duration(milliseconds: 70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MyColors.myDarkGrey,
        boxShadow: [
          BoxShadow(
            blurRadius: isPressed ? 1 : 0.3,
            offset: -(isPressed ? const Offset(6, 6) : const Offset(6, 6)),
            color: MyColors.myDarkGrey,
            inset: inset,
          ),
          BoxShadow(
            blurRadius: isPressed ? 1 : 0.3,
            offset: isPressed ? const Offset(6, 6) : const Offset(6, 6),
            color: MyColors.myBlack,
            inset: inset,
          ),
        ],
      ),
      child: child,
    ),
  );
}

// EKRANIN ÜSTÜNDE BULUNAN KÜÇÜK DÜĞMELER (geri dön button) *** HERYERDE AYNI OLDUĞU İÇİN DİREKT ÇAĞIRILABİLİR
Widget smallAnimatedContainer(BuildContext context, isPressed, bool inset, Widget child) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: AnimatedContainer(
      height: MediaQuery.of(context).size.height*0.08, // BUTTON BOYUTLARI İLE OYNAYABİLİRSİNİZ YÜKSEKLİK
      width: MediaQuery.of(context).size.width*0.17, // BUTTON BOYUTLARI İLE OYNAYABİLİRSİNİZ GENİŞLİK
      duration: const Duration(milliseconds: 70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MyColors.myDarkBlue_2,
        boxShadow: [
          BoxShadow(
            blurRadius: isPressed ? 1 : 0.3,
            offset: -(isPressed ? const Offset(6, 6) : const Offset(6, 6)),
            color: MyColors.myDarkBlue_2,
            inset: inset,
          ),
          BoxShadow(
            blurRadius: isPressed ? 1 : 0.3,
            offset: isPressed ? const Offset(6, 6) : const Offset(6, 6),
            color: MyColors.myBlack,
            inset: inset,
          ),
        ],
      ),
      child: child,
    ),
  );
}