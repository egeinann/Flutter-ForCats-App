import 'package:flutter/material.dart';
import 'package:For_Cats_Codes/customers/colors.dart';
import 'package:For_Cats_Codes/customers/fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool gezginSelected = false; // düğme durum
  bool gorevliSelected = false; // düğme durum

  @override
  Widget build(BuildContext context) {
    return WillPopScope( // uygulamadan çıkış yapılmak istenildiğinde bir uyarı gelecek
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("ÇIKIŞ",style: useMyFont(MediaQuery.of(context).size.width * 0.07, MyColors.myDarkBlue_1),),
              content: Text("Çıkış yapmak istediğinize\nemin misiniz?",style: useMyFont(MediaQuery.of(context).size.width * 0.06, MyColors.myDarkBlue_1),),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "İPTAL",
                    style: useMyFont(MediaQuery.of(context).size.width * 0.07,
                        MyColors.myGrey),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "ÇIK",
                    style: useMyFont(MediaQuery.of(context).size.width * 0.06, Colors.red.shade800),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: MyColors.myBackground,
        body: SafeArea(
          child: Stack(
            children: [
              // EĞER SAYFANIN SAĞ ÜST KÖŞESİNE AYARLAR BUTTONU EKLEMEK İSTERSENİZ BU SATIRA YAZ COLUMN İÇİNE YAZMA !!!
              // 3 ADET ÜST ÜSTE COLUMN YERLEŞTİRİLDİ 1.LOGO VE YAZILAR - 2.GEZGİN BUTTON - 3.GÖREVLİ BUTTON
              // ÜST ÜSTE BİNMİŞ COLUMNLAR OLDUĞU İÇİN WEB ALANINDA SORUN YARATABİLİR (UYGULAMA MOBİL İÇİN YAZILDI)
              // *** logo ve textlerin olduğu COLUMN ***
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // yükseklik:%2'lik birim boşluk
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  // uygulama logosu
                  Image(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.22,
                    image: const AssetImage("assets/pictures/UYGULAMALOGO.png"),
                  ),
                  Column(
                    children: [
                      FittedBox(
                        child: Text(
                          "Hoşgeldiniz",
                          style: useMyFont(
                              MediaQuery.of(context).size.width * 0.15,
                              MyColors.myDarkBlue_1),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                            "Patili dostlarımızın sizlere ihtiyacı var...",
                            style: useMyFont(
                                MediaQuery.of(context).size.width * 0.055,
                                MyColors.myDarkGrey)),
                      ),
                      FittedBox(
                        child: Text(
                          "Giriş tercihinizi yapınız",
                          style: useMyFont(
                              MediaQuery.of(context).size.width * 0.1,
                              MyColors.myDarkBlue_2),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              // *** gezgin buttonun olduğu COLUMN ***
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // kullanılan boş containerlar hizalama için (uygulamanın performansını önemli ölçüde etkilemeyecektir.)
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  // GEZGİN BUTTON
                  Visibility(
                    visible:
                        !gorevliSelected, // görevli buttonuna tıklanmadıysa bu button gözüksün
                    child: GestureDetector(
                      onTap: () {
                        if (!gezginSelected) {
                          setState(() {
                            gezginSelected = true;
                          });
                          Future.delayed(const Duration(milliseconds: 1500),
                              () {
                            Navigator.pushNamed(
                                context, "/go_traveler_home_screen");
                          });
                        }
                      },
                      child: Center(
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: gezginSelected
                                ? MyColors.myWhite
                                : MyColors.myDarkBlue_2,
                          ),
                          duration: const Duration(milliseconds: 1500),
                          width: gezginSelected
                              ? MediaQuery.of(context).size.width
                              : MediaQuery.of(context).size.width * 0.85,
                          height: gezginSelected
                              ? MediaQuery.of(context).size.height * 0.93
                              : MediaQuery.of(context).size.width * 0.3,
                          alignment: gezginSelected
                              ? Alignment.center
                              : AlignmentDirectional.topCenter,
                          curve: Curves.fastOutSlowIn,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible: !gezginSelected,
                                        child: FittedBox(
                                          child: Text(
                                            "GEZGİN",
                                            style: useMyFont(
                                                MediaQuery.of(context).size.width *0.11,
                                                gezginSelected ? MyColors.myDarkBlue_1: MyColors.myWhite),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width *0.03),
                                      Icon(
                                        gezginSelected? Icons.pets: Icons.travel_explore,
                                        color: gezginSelected? MyColors.myDarkBlue_1: MyColors.myWhite,
                                        size:MediaQuery.of(context).size.width *0.15,
                                      ),
                                    ],
                                  ),
                                  Visibility(
                                    visible: !gezginSelected,
                                    child: FittedBox(
                                      child: Text(
                                        "Uygulamaya kolayca erişim sağlayın.",
                                        style: useMyFont(
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                            MyColors.myGrey),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(),
                  Container(),
                ],
              ),
              // *** görevli buttonun olduğu COLUMN ***
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // kullanılan boş containerlar hizalama için (uygulamanın performansını önemli ölçüde etkilemeyecektir.)
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  // GÖREVLİ BUTTON
                  Visibility(
                    visible:
                        !gezginSelected, // gezgin buttonuna tıklanmadıysa bu button gözüksün
                    child: GestureDetector(
                      onTap: () {
                        if (!gorevliSelected) {
                          setState(() {
                            gorevliSelected = true;
                          });
                          Future.delayed(const Duration(milliseconds: 1600),
                              () {
                            Navigator.pushNamed(
                                context, "/go_admin_login_screen");
                          });
                        }
                      },
                      child: Center(
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: gorevliSelected
                                ? MyColors.myWhite
                                : MyColors.myDarkBlue_2,
                          ),
                          duration: const Duration(milliseconds: 1500),
                          width: gorevliSelected
                              ? MediaQuery.of(context).size.width
                              : MediaQuery.of(context).size.width * 0.85,
                          height: gorevliSelected
                              ? MediaQuery.of(context).size.height * 0.93
                              : MediaQuery.of(context).size.width * 0.3,
                          alignment: gorevliSelected
                              ? Alignment.center
                              : AlignmentDirectional.topCenter,
                          curve: Curves.fastOutSlowIn,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible: !gorevliSelected,
                                    child: FittedBox(
                                      child: Text(
                                        "GÖREVLİ",
                                        style: useMyFont(
                                            MediaQuery.of(context).size.width *
                                                0.11,
                                            gorevliSelected
                                                ? MyColors.myDarkBlue_1
                                                : MyColors.myWhite),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width *0.03),
                                  Icon(
                                    gorevliSelected
                                        ? Icons.pets
                                        : Icons.admin_panel_settings,
                                    color: gorevliSelected
                                        ? MyColors.myDarkBlue_1
                                        : MyColors.myWhite,
                                    size: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: !gorevliSelected,
                                child: FittedBox(
                                  child: Text(
                                    "Size verilen şifreyi kullanmalısınız...",
                                    style: useMyFont(
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                        MyColors.myGrey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
