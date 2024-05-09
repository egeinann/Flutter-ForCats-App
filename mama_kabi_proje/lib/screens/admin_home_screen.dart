import 'package:flutter/material.dart';
import 'package:For_Cats_Codes/customers/ExitShowDialog.dart';
import 'package:For_Cats_Codes/customers/animatedButton.dart';
import 'package:For_Cats_Codes/customers/colors.dart';
import 'package:For_Cats_Codes/customers/fonts.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  // buttonlarımız için değişkenler
  bool isSelectedGoBack = false;
  bool isSelectedGoMap = false;
  bool isSelectedGoGallery = false;
  bool isSelectedGoSupport = false;
  bool isSelectedGoMoreInfo = false;
  bool isSelectedCapDetails = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return exitShowDialog(context, "/go_main_screen"); // TELEFONDAKİ GERİ TUŞU İLE MAİN SAYFASINA GİT
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.myBackground,
        body: SafeArea(
          child: Stack(
            children: [
              // ARKAPLAN RESİM
              Align(
                alignment: Alignment.topRight,
                child: Image(
                  width: MediaQuery.of(context).size.width*0.5,
                    image: const AssetImage("assets/pictures/3Dcat_adminscreen.png"),
                    centerSlice: Rect.largest),
              ),
              // *** GERİ DÖN DÜĞMESİ ***
              Align(
                alignment: Alignment.topLeft,
                child: Listener(
                  onPointerUp: (_) => setState(() {
                    isSelectedGoBack = false;
                    exitShowDialog(context, "/go_main_screen");
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
              // EKRANIN EN ÜSTÜNE BAK* HANGİ SAYFADA OLDUĞUMUZU GÖSTEREN TEXT
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "ADMİN SAYFASI ",
                  style: useMyFont(MediaQuery.of(context).size.width*0.06, MyColors.myDarkBlue_1),
                ),
              ),
              // KOLON DİĞER BÜTÜN HERŞEY ALT ALTA SIRALANDI
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width*0.1),
                    const Spacer(flex: 1,),
                    // *** UYGULAMA İKONU VE ÖZLÜ SÖZ container ***
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: MediaQuery.of(context).size.height *
                            0.12, // yükseklik: ekranın yüzde 12'sini kapla
                        width: MediaQuery.of(context).size.width *
                            0.85, // genişlik: ekranın yüzde 85'ini kapla
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(150, 151, 157, 172),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image:
                                  AssetImage("assets/pictures/UYGULAMALOGO.png"),
                              width: MediaQuery.of(context).size.width*0.35,
                            ),
                            FittedBox(
                              child: Text(
                                  "İnsan ruhunun bir parçası\nhayvan sevgisini tadana\nkadar uyanmaz.\n               Anatole France",
                                  style: useMyfont2(MediaQuery.of(context).size.width, MyColors.myDarkBlue_1)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.02),
                    // *** KAP DETAYLARI BUTTON ***
                    Expanded(
                      flex: 1,
                      child: Listener(
                        onPointerUp: (_) => setState(() {
                          isSelectedCapDetails = false;
                          Navigator.pushNamed(context,
                              "/go_capdetails_screen"); // kap detayları sayfasına yönlendirme
                        }),
                        onPointerDown: (_) => setState(() {
                          isSelectedCapDetails = true;
                        }),
                        child: longAnimatedContainer(
                          context,
                            isSelectedCapDetails,
                            isSelectedCapDetails,
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    child: Text("  Kap detaylarını gör",
                                        style: useMyFont(MediaQuery.of(context).size.width*0.050, MyColors.myWhite)),
                                  ),
                                  const SizedBox(width: 5),
                                  Icon(
                                    Icons.pets,
                                    color: MyColors.myWhite,
                                    size: MediaQuery.of(context).size.width*0.06,
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    // *** EKRANIN ALTINDAKİ DEV BUTTONLAR ***
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // *** ÇEVRENİZDE NELER VAR BUTTON ***
                              Listener(
                                onPointerUp: (_) => setState(() {
                                  isSelectedGoMap = false;
                                  Navigator.pushNamed(context,
                                      "/go_maps_screen"); // çevrenizde neler var sayfasına yönlendirme
                                }),
                                onPointerDown: (_) => setState(() {
                                  isSelectedGoMap = true;
                                }),
                                child: bigAnimatedContainer(
                                    context,
                                    isSelectedGoMap,
                                    isSelectedGoMap,
                                    Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Column(
                                        children: [
                                          Text("  Çevrenizde\n      Neler Var?",
                                              style: useMyFont(
                                                  MediaQuery.of(context).size.width*0.055, MyColors.myWhite)),
                                          Image(
                                            height: MediaQuery.of(context).size.height*0.1,
                                            width: MediaQuery.of(context).size.width*0.2,
                                              image: const AssetImage(
                                                  "assets/pictures/petshop_button.png"))
                                        ],
                                      ),
                                    )),
                              ),
                              // *** PATİ ALBÜMÜNÜZ BUTTON ***
                              Listener(
                                onPointerUp: (_) => setState(() {
                                  isSelectedGoGallery = false;
                                  Navigator.pushNamed(context,
                                      "/go_gallery_screen"); // galeri sayfasına yönlendirme
                                }),
                                onPointerDown: (_) => setState(() {
                                  isSelectedGoGallery = true;
                                }),
                                child: bigAnimatedContainer(
                                  context,
                                  isSelectedGoGallery,
                                  isSelectedGoGallery,
                                  Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Column(
                                      children: [
                                        Text("    Pati\n        Albümünüz",
                                            style:
                                                useMyFont(MediaQuery.of(context).size.width*0.055, MyColors.myWhite)),
                                        Image(
                                          height: MediaQuery.of(context).size.height*0.1,
                                            width: MediaQuery.of(context).size.width*0.2,
                                            image: const AssetImage(
                                                "assets/pictures/gallery_button.png"))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // *** BUTTONLAR *** *** BUTTONLAR *** *** BUTTONLAR *** *** BUTTONLAR *** *** BUTTONLAR *** *** BUTTONLAR *** *** BUTTONLAR *** *** BUTTONLAR ***
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // *** DESTEK NOKTASI BUTTON ***
                              Listener(
                                onPointerUp: (_) => setState(() {
                                  isSelectedGoSupport = false;
                                  Navigator.pushNamed(context,
                                      "/go_support_screen"); // destek noktası sayfasına yönlendirme
                                }),
                                onPointerDown: (_) => setState(() {
                                  isSelectedGoSupport = true;
                                }),
                                child: bigAnimatedContainer(
                                    context,
                                    isSelectedGoSupport,
                                    isSelectedGoSupport,
                                    Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Column(
                                        children: [
                                          Text("   Destek\n          Noktası",
                                              style: useMyFont(
                                                  MediaQuery.of(context).size.width*0.055, MyColors.myWhite)),
                                          Image(
                                            height: MediaQuery.of(context).size.height*0.1,
                                            width: MediaQuery.of(context).size.width*0.2,
                                              image: const AssetImage(
                                                  "assets/pictures/support_button.png"))
                                        ],
                                      ),
                                    )),
                              ),
                              // *** HAKKIMIZDA DAHA FAZLA BUTTON ***
                              Listener(
                                onPointerUp: (_) => setState(() {
                                  isSelectedGoMoreInfo = false;
                                  Navigator.pushNamed(context,
                                      "/go_info_screen"); // hakımızda sayfasına yönlendirme
                                }),
                                onPointerDown: (_) => setState(() {
                                  isSelectedGoMoreInfo = true;
                                }),
                                child: bigAnimatedContainer(
                                  context,
                                    isSelectedGoMoreInfo,
                                    isSelectedGoMoreInfo,
                                    Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Column(
                                        children: [
                                          Text(
                                              "   Hakkımızda\n       Daha Fazla?",
                                              style: useMyFont(
                                                  MediaQuery.of(context).size.width*0.055, MyColors.myWhite)),
                                          Image(
                                            height: MediaQuery.of(context).size.height*0.1,
                                            width: MediaQuery.of(context).size.width*0.2,
                                              image: const AssetImage(
                                                  "assets/pictures/moreinfo_button.png"))
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                     // AŞAĞIYA 20 BİRİM BOŞLUK VERİLDİ
                    SizedBox(height: MediaQuery.of(context).size.width*0.02)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
