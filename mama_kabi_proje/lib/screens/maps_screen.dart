import 'package:flutter/material.dart';
import 'package:For_Cats_Codes/customers/animatedButton.dart';
import 'package:For_Cats_Codes/customers/colors.dart';
import 'package:For_Cats_Codes/customers/fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
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
                      size: MediaQuery.of(context).size.height * 0.08,
                      color: MyColors.myWhite,
                    )),
              ),
            ),
            // *** SAĞ ÜST KEDİ İMAGE ***
            Align(
              alignment: Alignment.topRight,
              child: Image(
                  width: MediaQuery.of(context).size.width * 0.5,
                  image:
                      const AssetImage("assets/pictures/3Dcat_mapscreen.png"),
                  centerSlice: Rect.largest),
            ),
            // EKRANIN ÜSTÜNDEKİ SAYFA İSMİ TEXT
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Çevrenizde Neler Var?",
                style: useMyFont(MediaQuery.of(context).size.width * 0.06,
                    MyColors.myDarkBlue_1),
              ),
            ),
            // *** HARİTA *** [GOOGLE MAPS API KULANARAK TÜRKİYEDEKİ PETSHOPLAR GÖSTERİLEBİLİR]
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // TEXT METİN
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                          child: Text("Size en yakın Petshoplar",
                              style: useMyFont(
                                  MediaQuery.of(context).size.width * 0.07,
                                  MyColors.myDarkBlue_2)))),
                ),
                // TEXT METİN
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: FittedBox(
                      child: Text(
                          "İnternet bağlantınız yok ise haritalar görüntülenemez !!!",
                          style: useMyFont(
                              MediaQuery.of(context).size.width * 0.05,
                              MyColors.myGrey))),
                ),
                // *** HARİTA ***
                Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // haritanın ekranda kapladığı genişlik %100
                  height: MediaQuery.of(context).size.height *
                      0.75, // haritanın ekranda kapladığı yükseklik ekranın %77'si
                  color: MyColors.myGrey,
                  child: FlutterMap(
                    options: const MapOptions(
                      initialCenter: LatLng(41.015137,28.979530), // başlangıç merkezi (istanbul)
                      initialZoom: 12.0, // başlangıç uzaklığı
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}', // eğer beyaz görünüm isterseniz
                        userAgentPackageName: 'com.example.app',
                      ),
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution('OpenStreetMap contributors',
                              onTap: () => print("url url url")),
                        ],
                      ),
                      // ÖRNEK PETSHOPLAR
                      MarkerLayer(markers: [
                        // örnek pethsop marker 1
                        Marker(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.1,
                          // KONUM KOORDİNATLAR
                          point: const LatLng(
                              41.0617867465184, 29.001193474173757),
                          child: Column(
                            children: [
                              FittedBox(child: Text("PETSHOP 1",style: TextStyle(color: MyColors.myBlack,fontSize: MediaQuery.of(context).size.width*0.03,fontWeight: FontWeight.bold))),
                              Icon(Icons.pets,size:MediaQuery.of(context).size.height * 0.03),
                            ],
                          )
                        ),
                        // örnek petshop marker 2
                        Marker(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.1,
                          // KONUM KOORDİNATLAR
                          point: const LatLng(
                              41.07728051634298, 28.98556170864665),
                          child: Column(
                            children: [
                              FittedBox(child: Text("PETSHOP 2",style: TextStyle(color: MyColors.myBlack,fontSize: MediaQuery.of(context).size.width*0.03,fontWeight: FontWeight.bold))),
                              Icon(Icons.pets,size:MediaQuery.of(context).size.height * 0.03),
                            ],
                          )
                        ),
                        // örnek petshop marker 3
                        Marker(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.1,
                          // KONUM KOORDİNATLAR
                          point: const LatLng(
                              41.06092684144575, 28.972580508640522),
                          child: Column(
                            children: [
                              FittedBox(child: Text("PETSHOP 3",style: TextStyle(color: MyColors.myBlack,fontSize: MediaQuery.of(context).size.width*0.03,fontWeight: FontWeight.bold))),
                              Icon(Icons.pets,size:MediaQuery.of(context).size.height * 0.03),
                            ],
                          )
                        ),
                        // örnek petshop marker 4
                        Marker(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.1,
                          // KONUM KOORDİNATLAR
                          point: const LatLng(
                              41.01756898559674, 28.968216669105566),
                          child: Column(
                            children: [
                              FittedBox(child: Text("PETSHOP 4",style: TextStyle(color: MyColors.myBlack,fontSize: MediaQuery.of(context).size.width*0.03,fontWeight: FontWeight.bold))),
                              Icon(Icons.pets,size:MediaQuery.of(context).size.height * 0.03),
                            ],
                          )
                        ),
                        // örnek petshop marker 5
                        Marker(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.1,
                          // KONUM KOORDİNATLAR
                          point: const LatLng(41.06846101747855, 28.941552704025046),
                          child: Column(
                            children: [
                              FittedBox(child: Text("PETSHOP 5",style: TextStyle(color: MyColors.myBlack,fontSize: MediaQuery.of(context).size.width*0.03,fontWeight: FontWeight.bold))),
                              Icon(Icons.pets,size:MediaQuery.of(context).size.height * 0.03),
                            ],
                          )
                        ),
                      ])
                    ],
                  ),
                ),
              ],
            ),
            // *** KONUM BUTTON *** (sol alt köşe)
            Padding(
              // padding buttonun etrafına ekranın etrafına %7'si kadar görünmez boşluk verildi
              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.06),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  height: MediaQuery.of(context).size.height * 0.10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // *** BUTTONA BASILDIĞINDA YAPILACAK İŞLEMLER ***
                    },
                    child: Icon(Icons.navigation_rounded,
                        size: MediaQuery.of(context).size.width * 0.09,
                        color: Colors.blue.shade900),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
