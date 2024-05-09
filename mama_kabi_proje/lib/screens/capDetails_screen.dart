import 'package:flutter/material.dart';
import 'package:For_Cats_Codes/customers/animatedButton.dart';
import 'package:For_Cats_Codes/customers/colors.dart';
import 'package:For_Cats_Codes/customers/fonts.dart';

class CapDetailsScreen extends StatefulWidget {
  const CapDetailsScreen({super.key});

  @override
  State<CapDetailsScreen> createState() => _CapDetailsScreenState();
}

class _CapDetailsScreenState extends State<CapDetailsScreen> {
  // düğmeler için değişkenler
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
            // *** ÜST ORTA TEXT YAZISI
            Align(
              alignment: Alignment.topCenter,
              child: Text("Kap detayları",style: useMyFont(MediaQuery.of(context).size.width*0.06, MyColors.myDarkBlue_1),),
            )
          ],
        ),
      ),
    );
  }
}
