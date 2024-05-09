import 'package:flutter/material.dart';
import 'package:For_Cats_Codes/customers/animatedButton.dart';
import 'package:For_Cats_Codes/customers/colors.dart';
import 'package:For_Cats_Codes/customers/fonts.dart';

class MoreInfoScreen extends StatefulWidget {
  const MoreInfoScreen({super.key});

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  // tuş ile ilgili fonksiyon
  bool isSelectedGoBack = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // SAĞ ÜST KEDİ RESMİ
            Align(
              alignment: Alignment.topRight,
              child: Image(
                  width: MediaQuery.of(context).size.width * 0.5,
                  image: const AssetImage(
                      "assets/pictures/3Dcat_moreinfoscreen.png"),
                  centerSlice: Rect.largest),
            ),
            // ORTA ALT KEDİ RESMİ
            Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                  width: MediaQuery.of(context).size.width * 0.8,
                  image: const AssetImage(
                      "assets/pictures/3Dcat_moreinfoscreen2.png"),
                  centerSlice: Rect.largest),
            ),
            // TEXTLER SİNGLECHİLDSCROLLVİEW İÇİNDE YAZILMIŞTIR
            // EKRAN YUKARI AŞAĞI HAREKET EDER
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // *** SOL ÜST GERİ GİTME TUŞU ***
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
                            size: MediaQuery.of(context).size.height * 0.08,
                            color: MyColors.myWhite,
                          )),
                    ),
                  ),
                  // TUŞ İLE METNİN ARASINA EKRANIN %5'İ KADAR BOLUK VERİLDİ
                  SizedBox(height: MediaQuery.of(context).size.height*0.05),
                  // EKRANDA GÖRDÜĞÜNÜZ LACİVERTİMSİ METİN
                  // PADDİNG İLE METNİ ÇEVRESİNDEN 10 BİRİM AYIRDIK
                  Padding(
                    padding: const EdgeInsets.all(10), // 10 BİRİM
                    child: Text(
                        "SELAM! Bizler ForCats ekibiyiz.\n\nUmarız her zaman dört ayağınızın üzerine düşeceğiniz günler geçirirsiniz.\n\nBizler, bu dünyanın sadece biz insanlara ait olmadığının farkında bir grup genç öğrenci olarak bileklerimizi sıvadık ve sokaktaki kedi dostlarımız için bir otomatik mama kabı geliştirdik.\n\nVizyonumuz, gerçek bir insan olmayı başarmış insanlarla, hayvan dostlarımızla; güvenle ve sevgiyle yaşadığımız bir toplum inşa etmek. Misyonumuz ise hayvan dostlarımızın hayatını kolaylaştırmak ve farkındalık kazandırmak.\n\nBizler için şeffaflık ve içtenlik en başta gelen değerlerimizdir.",
                        style: useMyFont(MediaQuery.of(context).size.width * 0.05, // BOYUT VE RENK DEĞİŞTİRİLEBİLİR
                            MyColors.myDarkBlue_2)),
                  ),
                  // EKRANDA GÖRDÜĞÜNÜZ SİYAH RENKTEKİ İLETİŞİM METİN
                  // PADDİNG İLE METNİ ÇEVRESİNDEN 10 BİRİM AYIRDI
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                        "\nForCats ekibimizle iletişime geçmek için\n\nForCats mail: forcats.info@gmail.com\n\nİlginiz için teşekkürler…",
                        style: useMyFont(MediaQuery.of(context).size.width * 0.06, // BOYUT VE RENK DEĞİŞTİRİLEBİLİR
                            MyColors.myBlack)),
                  ),
                  // EN ALT KISIMDAN EKRANIN %5'İ KADAR ALAN BOŞLUK VERİLDİ
                  SizedBox(height: MediaQuery.of(context).size.height*0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
