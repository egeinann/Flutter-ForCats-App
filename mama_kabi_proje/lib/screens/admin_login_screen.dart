import 'package:flutter/material.dart';
import 'package:For_Cats_Codes/customers/animatedButton.dart';
import 'package:For_Cats_Codes/customers/colors.dart';
import 'package:For_Cats_Codes/customers/fonts.dart';
import 'package:For_Cats_Codes/customers/snackbar.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  // ADMİN PASSWORD DEĞİŞKENE ATANDI
  String adminPassword = "09012024";

  // aşağıdaki iki değişken buttonlar ile ilgili
  bool isSelectedLogin = false;
  bool isSelectedGoBack = false;

  // aşağıdaki 2 değişken şifre girme kısmı ile ilgili
  bool hidePassword = false; // şifreyi gizle button = false
  bool obscuretext = true; // şifre text'inin gizli olması = true

  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // willPopScope geri tuşuna basıldığında geri gitmeyi engeller;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.myBackground,
        body: SafeArea(
          // BU SAYFADA ÜST ÜSTE GEÇMİŞ HİÇ BİR ŞEY YOK !!! HERŞEY YUKARIDAN AŞAĞI DOĞRU SIRALANDI
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // *** GERİ DÖN BUTTON ***
              Align(
                alignment: Alignment.centerLeft,
                child: Listener(
                  onPointerUp: (_) => setState(() {
                    isSelectedGoBack = false;
                    ScaffoldMessenger.of(context)
                        .hideCurrentSnackBar(); // aktif snack bar var ise kaldır
                    FocusScope.of(context)
                        .unfocus(); // aktif klavye var ise kapat
                    Navigator.pushNamed(context, "/go_main_screen");
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
              // TEXT GÖREVLİ GİRİŞİ
              FittedBox(
                child: Text(
                  "GÖREVLİ GİRİŞİ",
                  style: useMyFont(MediaQuery.of(context).size.width * 0.14,
                      MyColors.myBlack),
                ),
              ),
              // TEXT Size verilen parolayı kullanarak...
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "Size verilen parolayı kullanarak panele giriş yapın...",
                    style: useMyFont(MediaQuery.of(context).size.width * 0.06,
                        MyColors.myDarkGrey),
                  ),
                ),
              ),
              // *** VERİ GİRİŞİ ŞİFRE GİRİLEN ALAN ***
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                      vertical: MediaQuery.of(context).size.width * 0.04),
                  child: Row(
                    children: [
                      // VERİ GİRİŞİ 5/6 ALAN KAPLIYOR
                      Expanded(
                        flex: 5,
                        child: TextFormField(
                          controller: _passwordController,
                          // bu onchanged text'i her sanise kontrol eder şifre yanlış ise kırmızı doğru ise yeşil olur
                          onChanged: (value) {
                            setState(() {
                              if (_passwordController.text == adminPassword) {
                                FocusScope.of(context)
                                    .unfocus(); // Klavyeyi kapat
                              }
                            });
                          },
                          obscureText:obscuretext, // Şifrenin gizli olmasını sağlar (bu değişken yukarıda tanımlandı)
                          maxLength: 8,
                          decoration: InputDecoration(
                            counterText: "",
                            labelStyle: useMyFont(20, MyColors.myDarkBlue_2),
                            hintText: "Parolayı giriniz",
                            hintStyle: useMyFont(20, MyColors.myGrey),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontFamily: "font",
                            color: _passwordController.text == adminPassword
                                ? Colors.green.shade700
                                : Colors.red.shade700,
                          ),
                        ),
                      ),
                      // SAĞDKİ KÜÇÜK GÖZ BUTTONU 1/6 ALAN KAPLIYOR
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          iconSize: MediaQuery.of(context).size.width * 0.07,
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                              obscuretext = !obscuretext;
                            });
                          },
                          icon: Icon(!hidePassword
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // EKRANIN %6'SI KADAR BİR BOŞLUK VERİLDİ - VERİ GİRİŞİ İLE GİRİŞ YAP BUTTON ARASINA
              SizedBox(height: MediaQuery.of(context).size.width * 0.06),
              // *** GİRİŞ YAP BUTTON ***
              Expanded(
                flex: 1,
                child: Listener(
                  onPointerUp: (_) => setState(() {
                    isSelectedLogin = false;
                    // ŞİFREYİ KONTROL ETTİĞMİZ ALAN
                    if (_passwordController.text == adminPassword) {
                      print("Giriş başarılı");
                      Navigator.pushNamed(context, "/go_admin_home_screen");
                      mySnackBar(
                          context,
                          "Görevli girişi başarılı",
                          Colors.green.shade300,
                          const Icon(
                            Icons.admin_panel_settings,
                            color: MyColors.myWhite,
                          ));
                    } else {
                      print("hata");
                      ScaffoldMessenger.of(context)
                          .hideCurrentSnackBar(); // aktif snack bar var ise kaldır
                      mySnackBar(
                          context,
                          "Parola girişi hatalı",
                          Colors.orange.shade300,
                          const Icon(
                            Icons.error,
                            color: MyColors.myWhite,
                          ));
                    }
                  }),
                  onPointerDown: (_) => setState(() {
                    isSelectedLogin = true;
                  }),
                  child: longAnimatedContainer(
                      context,
                      isSelectedLogin,
                      isSelectedLogin,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "  GİRİŞ YAP",
                            style: useMyFont(
                                MediaQuery.of(context).size.width * 0.08,
                                MyColors.myWhite),
                          ),
                          Icon(
                            Icons.arrow_right_rounded,
                            size: MediaQuery.of(context).size.width * 0.13,
                            color: MyColors.myWhite,
                          )
                        ],
                      )),
                ),
              ),
              // GİRİŞ YAP BUTTONU İLE RESMİN ARASINA BOŞLUK (HERHANGİ BİR EKRANIN %10'U KADAR)
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              // ALT KISIMDA BULUNAN RESİM (BURADA RESİM DE BUTTONLAR GİBİ BİR ALAN KAPLIYOR)
              Expanded(
                flex: 3,
                child: Image(
                  width: MediaQuery.of(context).size.width*0.6,
                  image: const AssetImage("assets/pictures/3Dcat_adminscreen.png"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
