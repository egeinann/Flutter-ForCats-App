import 'package:flutter/material.dart';
import 'package:For_Cats_Codes/customers/colors.dart';

class EffectScreen extends StatefulWidget {
  const EffectScreen({Key? key});

  @override
  State<EffectScreen> createState() => _EffectScreenState();
}

class _EffectScreenState extends State<EffectScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _scaleAnimation = CurvedAnimation(
    parent: _scaleController,
    curve: Curves.fastOutSlowIn,
  );
  void dispose() {
    _scaleController.dispose(); // AnimationController'ı dispose et
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    navigateToAcilisSayfasi();
  }
  // 2000 YAZAN KISIMDAN SÜRE DEĞİŞTİRİLEBİLİR
  navigateToAcilisSayfasi() async {
    await Future.delayed(const Duration(milliseconds: 2000),
        () {});
    if (mounted) {
      Navigator.pushReplacementNamed(context, "/go_main_screen");
    }
  }

  // EFEKT SAYFASI EKRAN İLK AÇILDIĞINDA GÖZÜKEN 2 SANİYELİK BİR EKRAN LOGO ÜZERİNİZE DOĞRU GELİYOR
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [MyColors.myBackground, MyColors.myDarkBlue_1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Image(
            width: MediaQuery.of(context).size.width *0.7,
            height: MediaQuery.of(context).size.height *0.7,
            image: const AssetImage("assets/pictures/UYGULAMALOGO.png"),
          ),
        ),
      ),
    );
  }
}
