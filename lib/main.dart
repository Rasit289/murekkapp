import 'package:flutter/material.dart';
import 'package:murekkapp/FileImageView.dart';
import 'package:murekkapp/addPages/saglananHizmet.dart';
import 'package:murekkapp/addPages/tahsilatGecmisi.dart';
import 'package:murekkapp/addPages/yuklenenBelgeler.dart';
import 'package:murekkapp/pages/GelirFaturaRaporu.dart';
import 'package:murekkapp/pages/GiderFaturaRaporu.dart';
import 'package:murekkapp/pages/KDVRaporu.dart';
import 'package:murekkapp/addPages/KasaEkle.dart';
import 'package:murekkapp/pages/MuhasabeRaporlari.dart';
import 'package:murekkapp/pages/Musteriler.dart';
import 'package:murekkapp/addPages/OdemeYap.dart';
import 'package:murekkapp/pages/OdemelerRaporu.dart';
import 'package:murekkapp/addPages/ParaIslemleri.dart';
import 'package:murekkapp/pages/PersonelEkle.dart';
import 'package:murekkapp/pages/TahsilatRaporu.dart';
import 'package:murekkapp/addPages/TedarikciEkle.dart';
import 'package:murekkapp/addPages/addMusteri.dart';
import 'package:murekkapp/addPages/createGelirFaturasi.dart';
import 'package:murekkapp/addPages/createYeniHizmet.dart';
import 'package:murekkapp/pages/etiketHavuzu.dart';
import 'package:murekkapp/pages/gelirFaturalari.dart';
import 'package:murekkapp/pages/giderFatura.dart';
import 'package:murekkapp/pages/guncel_durumum.dart';
import 'package:murekkapp/pages/hizmetveUrunler.dart';
import 'package:murekkapp/pages/kasaVeBankalar.dart';
import 'package:murekkapp/pages/kategoriDagilimlari.dart';
import 'package:murekkapp/pages/tedarikciler.dart';
import 'package:murekkapp/addPages/urunVeIstatistik.dart';
import 'package:murekkapp/widgets/ecxelDownload.dart';
import 'dart:async';

import 'package:murekkapp/widgets/widgets_login.dart';

import 'const.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Murekkep',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      //Sayfa geçişlerini tanımlayan ve sağlayan yer
      routes: {
        "/log_in_sayfasi": (context) => LoginScreen(),
        "/Guncel_durumum": (context) => const GuncelDurumum(),
        "/gelirFaturalari": (context) => const gelirFaturalari(),
        "/giderFatura": (context) => const giderFatura(),
        "/gelirFaturasi": (context) => const GelirFaturasi(),
        "/musteriler": (context) => const Musteriler(),
        "/tedarikciler": (context) => const Tedarikciler(),
        "/musterEkle": (context) => const MusteriEkle(),
        "/kasaVeBankalar": (context) => const kasaVeBankalar(),
        "/fileImage": (context) =>  FilePickerDemo(),
        "/hizmetVeUrun": (context) => const HizmetVeUrunler(),
        "/createGelirFaturasi": (context) => const YeniHizmet(),
        "/etiketHavuzu": (context) => const EtiketHavuzu(),
        "/GelirFaturaRaporu": (context) => const GelirFaturaRaporu(),
        "/GiderFaturaRaporu": (context) => const GiderFaturaRaaporu(),
        "/TahsilatRaporu": (context) => const TahsilatRaporu(),
        "/OdemelerRaporu": (context) => const OdemelerRaporu(),
        "/kdvRaporu": (context) => const KDVRaporu(),
        "/MuhasabeRaporlari": (context) =>  MuhasabeRaporlari(containerTitle: containerTitleDeneme,deviceTitle: deviceTitleDeneme,),
        "/kategoriDagilimlari": (context) => const KataegoriDagilimlari(),
        "/OdemeYap": (context) => const OdemeYap(),
        "/kasaEkle": (context) => const KasaEkle(),
        "/paraIslemleri": (context) => const ParaIslemleri(),
        "/TedarikciEkle": (context) => const TedarikciEkle(),
        "/personelislemleri": (context) => const PersonelEkle(),
        "/urunVeIstatistik": (context) => const urunVeIstatistik(),
        "/yuklenenBelgeler": (context) => const yuklenenBelgeler(),
        "/tahsilatGecmisi": (context) => const tahsilatGecmisi(),
        "/saglananHizmet": (context) => const saglananHizmet(),
        "/excel": (context) => const excelDown(),
         
         
         
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
       debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Timer? countdownTimer;

//çıkan logonun 3 saniye ekranda kalmasını sağlayan gecikme kodu(Timer)
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    super.initState();
  }
//Uygulamanın girişinde çıkan logo nun tanımlanmdığı widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/firstt_page.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
