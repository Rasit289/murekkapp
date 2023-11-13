import 'package:flutter/material.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';
import 'package:murekkapp/widgets/widgetGelirFaturasi.dart';
import 'package:murekkapp/widgets/widgets_button.dart';

import '../const.dart';

class GelirFaturaRaporuBilgiler extends StatefulWidget {
  const GelirFaturaRaporuBilgiler({super.key});

  @override
  State<GelirFaturaRaporuBilgiler> createState() =>
      _GelirFaturaRaporuBilgilerState();
}

class _GelirFaturaRaporuBilgilerState extends State<GelirFaturaRaporuBilgiler> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(57, 56, 72, 1),
      ),
      child: Column(
        children: [
          //Gelir Fatura raporunun başlangıç ve bitiş tarihinin girildiği kısım
          Stack(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 145, 0),
                  height: 63,
                  width: 200,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Başlangıç Tarihi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: TarihButton(),
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(220, 0, 10, 0),
                  height: 63,
                  width: 200,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Bitiş Tarihi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      TarihButton(),
                    ],
                  )),
            ],
          ),
          //carilerin arandığı kısım
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Cariler",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            margin: EdgeInsets.only(top: 0),
            child: Align(
                alignment: Alignment.center,
                child: SearchTextBox(
                    hintText: "hintText",
                    valueList: kdvlist,
                    textControl: myController)),
          ),
          //daha önceden eklenmiş etiketlerin seçildiği ve rapora eklendiği kısım
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 75,
            width: double.infinity,
            decoration: const BoxDecoration(
                //color: Color.fromRGBO(243, 54, 2, 1),

                ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Etiketler",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Align(alignment: Alignment.center, child: FaturaEtiketi()),
              ],
            ),
          ),
          //Rapor oluşturduğumuz aynı zamanda pdf ve excel olarak indirdiğimiz kısım
          Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 175, 0),
                child: raporla(),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(205, 20, 5, 0),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox.fromSize(
                      size: Size(80, 50),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(92, 90, 115, 1),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                  // <-- Icon
                                  Icons.download,
                                  size: 24.0,
                                  color: Colors.white), // <-- Icon
                              Text(
                                'PDF',
                                style: TextStyle(color: Colors.white),
                              ), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(290, 20, 5, 0),
                decoration: BoxDecoration(),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox.fromSize(
                       size: Size(80, 50),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(92, 90, 115, 1),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                  // <-- Icon
                                  Icons.download,
                                  size: 24.0,
                                  color: Colors.white), // <-- Icon
                              Text(
                                'Excel',
                                style: TextStyle(color: Colors.white),
                              ), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GelirFaturaRaporDegerler extends StatefulWidget {
  const GelirFaturaRaporDegerler({super.key});

  @override
  State<GelirFaturaRaporDegerler> createState() =>
      _GelirFaturaRaporDegerlerState();
}

class _GelirFaturaRaporDegerlerState extends State<GelirFaturaRaporDegerler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 8),
            padding: EdgeInsets.all(5),
            width: double.infinity,
            decoration: const BoxDecoration(
             
              color: Color.fromRGBO(57, 56, 72, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Vergisiz Toplam Gelir Belgeleri Tutarı",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "900,00 ₺",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          //Gelir Fatura Raporunundaki "Toplam Kdv Tutarı kısmının" düzenlendiği Container
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 8),
            padding: EdgeInsets.all(5),
            width: double.infinity,
            decoration: const BoxDecoration(
           
              color: Color.fromRGBO(57, 56, 72, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Toplam Kdv Tutarı",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "900,00 ₺",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          //Gelir Fatura Raporunundaki "Diğer Vergiler Toplamı" ksımının düzenlendiği Container
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 8),
            padding: EdgeInsets.all(5),
            width: double.infinity,
            decoration: const BoxDecoration(
             
              color: Color.fromRGBO(57, 56, 72, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Diğer Vergiler Toplamı",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "900,00 ₺",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          //Gelir Fatura Raporunundaki "Toplam Gelir Belgeleri Tutarı" ksımının düzenlendiği Container
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 30),
            padding: EdgeInsets.all(5),
            width: double.infinity,
            decoration: const BoxDecoration(
            
              color: Color.fromRGBO(57, 56, 72, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Toplam Gelir Belgeleri Tutarı",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "900,00 ₺",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class giderFaturaRaporuDegerler extends StatefulWidget {
  const giderFaturaRaporuDegerler({super.key});

  @override
  State<giderFaturaRaporuDegerler> createState() =>
      _giderFaturaRaporuDegerlerState();
}

class _giderFaturaRaporuDegerlerState extends State<giderFaturaRaporuDegerler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Gelir Fatura Raporunundaki "Vergisiz Toplam Gider Belgeleri Tutarı" düzenlendiği Container
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 8),
            padding: EdgeInsets.all(5),
            height: 70,
            width: double.infinity,
            decoration: const BoxDecoration(
             
              color: Color.fromRGBO(57, 56, 72, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Vergisiz Toplam Gider Belgeleri Tutarı",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "900,00 ₺",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          //Gelir Fatura Raporunundaki "Toplam Kdv Tutarı" düzenlendiği Container
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 8),
            padding: EdgeInsets.all(5),
            height: 70,
            width: double.infinity,
            decoration: const BoxDecoration(
             
              color: Color.fromRGBO(57, 56, 72, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Toplam Kdv Tutarı",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "900,00 ₺",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          //Gelir Fatura Raporunundaki "Diğer Vergiler Toplamı" düzenlendiği Container

          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 8),
            padding: EdgeInsets.all(5),
            height: 70,
            width: double.infinity,
            decoration: const BoxDecoration(
            
              color: Color.fromRGBO(57, 56, 72, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Diğer Vergiler Toplamı",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "900,00 ₺",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          //Gelir Fatura Raporunundaki "Toplam Gider Belgeleri Tutarı" düzenlendiği Container
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
            padding: EdgeInsets.all(5),
            height: 70,
            width: double.infinity,
            decoration: const BoxDecoration(
            
              color: Color.fromRGBO(57, 56, 72, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Toplam Gider Belgeleri Tutarı",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "900,00 ₺",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
