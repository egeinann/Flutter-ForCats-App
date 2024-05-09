import 'package:flutter/material.dart';
import 'package:For_Cats_Codes/customers/animatedButton.dart';
import 'package:For_Cats_Codes/customers/colors.dart';
import 'package:For_Cats_Codes/customers/fonts.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  bool isSelectedGoBack = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // *** GERİ DÖN BUTTON ***
            Align(
              alignment: Alignment.topLeft,
              child: Listener(
                onPointerUp: (_) => setState(() {
                  isSelectedGoBack = false;
                  Navigator.pop(context);
                }),
                onPointerDown: (_) => setState(() {
                  isSelectedGoBack = true;
                }),
                child: smallAnimatedContainer(
                  context,
                    isSelectedGoBack,
                    isSelectedGoBack,
                    Icon(
                      Icons.arrow_left_rounded,
                      size: MediaQuery.of(context).size.height*0.08,
                      color: MyColors.myWhite,
                    )),
              ),
            ),
            // *** SAĞ ÜST KEDİ İMAGE ***
            Align(
              alignment: Alignment.topRight,
              child: Image(
                width: MediaQuery.of(context).size.width*0.5,
                  image: const AssetImage("assets/pictures/3Dcat_mainscreen.png"),
                  centerSlice: Rect.largest),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text("Destek Noktası",style: useMyFont(MediaQuery.of(context).size.width*0.06, MyColors.myDarkBlue_1),),
            )
          ],
        ),
      ),
    );
  }
}