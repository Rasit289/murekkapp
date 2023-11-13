import 'package:flutter/material.dart';

import '../const.dart';

class TedarikciContainer extends StatefulWidget {
  const TedarikciContainer({
    Key? key,
    required this.urunAdi,
    required this.urunKoduMusteri,
    required this.miktarTedarikci,
    required this.kdvMiktari,
    required this.satisFiyati,
  }) : super(key: key);

  final String urunAdi;
  final String urunKoduMusteri;
  final String miktarTedarikci;
  final String kdvMiktari;
  final String satisFiyati;

  @override
  State<TedarikciContainer> createState() => _TedarikciContainerState();
}

class _TedarikciContainerState extends State<TedarikciContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 3, 5, 5),
        padding: EdgeInsets.all(5),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(53, 58, 64, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Ürün Adı:  " + widget.urunAdi,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Ürün Kodu:  " + widget.urunKoduMusteri,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Miktar:  " + widget.miktarTedarikci,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "KDV Miktarı:  " + widget.kdvMiktari,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17, color: Colors.white

                    //fontWeight: FontWeight.bold
                    ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Alış Fiyatı:  " + widget.satisFiyati,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Personeller extends StatefulWidget {
  const Personeller({
    Key? key,
    required this.adSoyad,
    required this.telefonPersonel,
    required this.eMailPersonel,
    required this.gorev,
    required this.TCno,
  }) : super(key: key);

  final String adSoyad;
  final String TCno;
  final String eMailPersonel;
  final String telefonPersonel;
  final String gorev;

  @override
  State<Personeller> createState() => _PersonellerState();
}

class _PersonellerState extends State<Personeller> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 3, 5, 10),
          padding: EdgeInsets.all(5),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(53, 58, 64, 1),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Ad Soyad:  " + widget.adSoyad,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                   color: Colors.white
                    //fontWeight: FontWeight.bold
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Telefon:  " + widget.telefonPersonel,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "E-Mail:  " + widget.eMailPersonel,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                       color: Colors.white
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Görev:  "+widget.gorev,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                       color: Colors.white
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "TC Numarası: "+ widget.TCno,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KtaegoriAdiContainer extends StatefulWidget {
  const KtaegoriAdiContainer({
    Key? key,
    required this.kategoriAdi,
  }) : super(key: key);

  final String kategoriAdi;

  @override
  State<KtaegoriAdiContainer> createState() => _KtaegoriAdiContainerState();
}

class _KtaegoriAdiContainerState extends State<KtaegoriAdiContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5, 2, 5, 2),
        padding: EdgeInsets.all(8),
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Color.fromRGBO(50, 55, 59, 1),
        ),
        child: SingleChildScrollView(
          child: Text(
            widget.kategoriAdi,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
        ));
  }
}

Widget personelEkleButton() {
  return InkWell(
    onTap: null,
    child: Container(
      padding: const EdgeInsets.all(2),

      height: 40,
      width: 140,

      //height: 40,
      //width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.blue),
      child: Text(
        "Personel Ekle",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 19,
          color: girisFontColor,
          //fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}
