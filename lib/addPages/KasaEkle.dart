import 'package:flutter/material.dart';
import 'package:murekkapp/pages/kasaVeBankalar.dart';
import 'package:murekkapp/widgets/widgetDrop.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../const.dart';

class KasaEkle extends StatefulWidget {
  const KasaEkle({super.key});

  @override
  State<KasaEkle> createState() => _KasaEkleState();
}

class _KasaEkleState extends State<KasaEkle> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: anaEkranColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            //geri ok butonuna basatığımızda tekrar kasa ve bankalara döndüğümüz kısım
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const kasaVeBankalar()));
            },
          ),
          centerTitle: true,
          title: const Text(
            'Yeni Kasa Ekle',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
        body: SingleChildScrollView(
        child:Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          height: 730,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(53, 58, 64, 1),
          ),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  height: 63,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: const Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Kasa İsmi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //kasa ismini girdiğimiz kısım
                      Align(
                        alignment: Alignment.center,
                        child: CariAciklama(),
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  height: 63,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Hesap Türü",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //hesap türünü girdiğimiz kısım
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: hesapTuruDropdown(
                          onTap: () {},
                        ),
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  height: 63,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Para Cinsi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //para cinsini girdiğimiz kısım
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: paraCinsiDrop(
                          onTap: () {},
                        ),
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  height: 63,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: const Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Açılış Bakiyesi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //açılış bakiyesini girdiğimiz kısım
                      Align(
                        alignment: Alignment.center,
                        child: CariAciklama(),
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  height: 63,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Bakiye Durumu",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //bakiye(borç) durumunu girdiğimiz kısım
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: bakiyeDurumuDropdown(
                          onTap: () {},
                        ),
                      ),
                    ],
                  )),
              Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 30, 150, 0),
                      height: 63,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                      child: const Column(
                        children: [
                          //yeni kasayı eklediğimiz buton
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: KaydetButton(),
                          ),
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(150, 30, 10, 0),
                      height: 63,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                      child: const Column(
                        children: [
                          //kasayı eklemekten vazgeçtiğimiz buton
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: VazgecButton(),
                          ),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
        ));
  }
}
