import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:For_Cats_Codes/screens/admin_home_screen.dart';
import 'package:For_Cats_Codes/screens/capDetails_screen.dart';
import 'package:For_Cats_Codes/screens/effect_screen.dart';
import 'package:For_Cats_Codes/screens/traveler_home_screen.dart';
import 'package:For_Cats_Codes/screens/gallery_screen.dart';
import 'package:For_Cats_Codes/screens/admin_login_screen.dart';
import 'package:For_Cats_Codes/screens/main_screen.dart';
import 'package:For_Cats_Codes/screens/maps_screen.dart';
import 'package:For_Cats_Codes/screens/moreinfo_screen.dart';
import 'package:For_Cats_Codes/screens/supportPoint_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const ForCatsApp());
  });
}

class ForCatsApp extends StatelessWidget {
  const ForCatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/go_effect_screen", // başlangıç sayfası
      // aşağındaki rotalar sayfalar arası geçiş için sadece tanıtıldı. Nerede kullanılırsa orada çağırılır
      routes: {
        "/go_effect_screen": (context) => const EffectScreen(), // efekt sayfasına gider
        "/go_main_screen":(context)=> const MainScreen(), // açılış logo sayfasına gider
        "/go_traveler_home_screen": (context) => const TravelerHomeScreen(), // gezgin sayfasına gider
        "/go_admin_login_screen": (context)=> const AdminLoginScreen(), // admin sayfasına gider
        "/go_admin_home_screen": (context) => const AdminHomeScreen(), // destek sayasına gider
        "/go_gallery_screen": (context) => const GalleryScreen(), // galeri sayfasına gider
        "/go_maps_screen": (context) => const MapsScreen(), // harita sayfasına gider
        "/go_info_screen": (context) => const MoreInfoScreen(), // hakkımızda sayfasına gider
        "/go_support_screen": (context) => const SupportScreen(), // destek sayasına gider
        "/go_capdetails_screen": (context) => const CapDetailsScreen(), // destek sayasına gider
      },
    );
  }
}
