import 'package:flutter/material.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';
import 'package:murekkapp/widgets/widgetDrop.dart';
import 'package:murekkapp/widgets/widgetGelirFaturasi.dart';
import 'package:murekkapp/widgets/widgets_button.dart';

import '../const.dart';

class tahsilatRaporuGiris extends StatefulWidget {
  const tahsilatRaporuGiris({super.key});

  @override
  State<tahsilatRaporuGiris> createState() => _tahsilatRaporuGirisState();
}

class _tahsilatRaporuGirisState extends State<tahsilatRaporuGiris> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(57, 56, 72, 1),
      ),
      child: Column(
        children: [
          //tahsilat raporunun başlangıç ve bitiş tarihinin girildiği Stack
          Stack(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 5, 145, 0),
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
                  margin: const EdgeInsets.fromLTRB(220, 5, 10, 0),
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
          //carilerin seçildiği yer
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: EdgeInsets.only(top: 0),
            child: Align(
                alignment: Alignment.center,
                child: SearchTextBox(
                    hintText: "hintText",
                    valueList: kdvlist,
                    textControl: myController)),
          ),
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
                      "Kasalar",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                //kasa türünün seçilği kısım
                Align(alignment: Alignment.center, child: kasalarDropdown()),
              ],
            ),
          ),
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
                //önceden eklenen etiketkerin rapora eklendiği kısım
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

class tahsilatRaporubilgiler extends StatefulWidget {
  const tahsilatRaporubilgiler({super.key});

  @override
  State<tahsilatRaporubilgiler> createState() => _tahsilatRaporubilgilerState();
}

class _tahsilatRaporubilgilerState extends State<tahsilatRaporubilgiler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
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
                  "Vadesi Geçen Tahsilatlar",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                //Vadesi Geçen Tahsilat miktarının yazılğığ yer
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
                  "Faturaya Bağlı Olmayan Tahsilat",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                // Faturaya Bağlı Olmayan Tahsilatın yazdığı kısım
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
                  "Yapılacak Gelir Faturası Tahsilatları",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                //Yapılacak Gelir Faturası Tahsilatlarının yazdığı kısım
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
                  "Yapılan Toplam Tahsilat",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                //Yapılan Toplam Tahsilatın yazdığı kısım
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
