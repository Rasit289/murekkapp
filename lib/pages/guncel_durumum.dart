//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:murekkapp/model/dashboardJSClass.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../const.dart';
import '../drawer_widget.dart';

class GuncelDurumum extends StatefulWidget {
  const GuncelDurumum({super.key});
  static const gelirFaturalariRoute = '/gelirFaturalari';

  @override
  State<GuncelDurumum> createState() => _GuncelDurumumState();
}

class _GuncelDurumumState extends State<GuncelDurumum> {
  late AnimationController controller;

  DashboardListJsn? guncelListe;

  guncellistecheck() async {
    guncelListe = await dashboardfunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    guncellistecheck();
  }

//guncel durumum (Anasayfa) kısmının widgeti
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //Başık kısmının yazıldığı AppBar
          backgroundColor: anaEkranColor,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Text(
            'Güncel Durumum',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
        //yandan açılan çekmece(Drawer)ın tanımlandığı yer
        drawer: const Drawer(
          backgroundColor: Colors.amber,
          child: DrawerWidget(),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              //guncel durumum (Anasayfa) kısmındaki tüm varlıklarım kısmının düzenlendiği Container
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                  padding: EdgeInsets.all(5),
                  height: 70,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(57, 56, 72, 1),
                    image: DecorationImage(
                      alignment: Alignment.topRight,
                      //image: AssetImage('images/tum_varliklarim.jpg'),
                      image: AssetImage('images/varlik.jpg'),
                      scale: 3,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Tüm varlıklarım",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: guncelDurumTitleColor,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                     
                        guncelListe?.result!.allAssets.toString() ?? "",

                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )),
              //guncel durumum (Anasayfa) kısmındaki Kasa kısmının düzenlendiği Container
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                   padding: EdgeInsets.all(5),
                  height: 70,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(57, 56, 72, 1),
                    image: DecorationImage(
                      alignment: Alignment.topRight,
                      image: AssetImage('images/kasa_resim.jpg'),
                      scale: 3,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Kasa",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: guncelDurumTitleColor,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                       Text(
                        guncelListe?.result!.moneyCase.toString() ?? "",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )),
              //guncel durumum (Anasayfa) kısmındaki Banka kısmının düzenlendiği Container
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 7, 0, 50),
                   padding: EdgeInsets.all(5),
                  height: 70,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(57, 56, 72, 1),
                    image: DecorationImage(
                      alignment: Alignment.topRight,
                      image: AssetImage('images/banka_resim.jpg'),
                      scale: 3,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Banka",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: guncelDurumTitleColor,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                       Text(
                        guncelListe?.result!.moneyBank.toString() ?? "",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )),

              // Yapılacak tahsilatları gösteren bar

              Stack(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Yapılacak Tahsisatlar",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      guncelListe?.result!.willCollection.toString() ?? "",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),

              //yapılacak ödemeleri gösteren bar

              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                height: 25,
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: LinearProgressIndicator(
                  value: yapilacakTahsisat / 1000,
                  color: Colors.greenAccent, //<-- SEE HERE
                  backgroundColor: Colors.grey, //<-- SEE HERE
                ),
              ),

              Stack(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Yapılacak Ödemeler ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      guncelListe?.result!.willPayment.toString() ?? "",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),

              //güncel durumun ay bazında özet olarak gösteren grafik

              Container(
                height: 25,
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: LinearProgressIndicator(
                  value: yapilacakOdeme / 1000,
                  color: const Color.fromARGB(255, 248, 64, 2), //<-- SEE HERE
                  backgroundColor: Colors.grey, //<-- SEE HERE
                ),
              ),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 45, 10, 10),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(49, 49, 49, 1),
                  ),
                  height: 150,
                  width: 650,
                  child: SfCartesianChart(
                      // Initialize category axis
                      primaryXAxis: CategoryAxis(),
                      series: <LineSeries<SalesData, String>>[

                        
                        LineSeries<SalesData, String>(
                          // Bind data source
                          //guncelListe?.result!.moneyGraphic?[0].expense??
                          dataSource: <SalesData>[
                            SalesData(  guncelListe?.result!.moneyGraphic?[0].date.toString() ?? "", 22.5),
                            SalesData('Şubat', guncelListe?.result!.moneyGraphic![0].expense ?? 0.0),
                            SalesData('Mart', 45),
                            SalesData('Nisan', 13),
                            SalesData('Mayıs', 22),
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales,
                        ),
                        LineSeries<SalesData, String>(
                          // Bind data source
                          dataSource: <SalesData>[
                            SalesData('Ocak', 35),
                            SalesData('Şubat', 28),
                            SalesData('Mart', 34),
                            SalesData('Nisan', 32),
                            SalesData('Mayıs', 40),
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales,
                        )
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}

//grafik yaparken kullandığımız içinde ay ve değerin olduğu kendimiz oluşturduğumuz değişken
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
