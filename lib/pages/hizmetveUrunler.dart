import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:murekkapp/addPages/createYeniHizmet.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/addPages/urunVeIstatistik.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../const.dart';
import '../drawer_widget.dart';
import '../model/productsJSClass.dart';
import '../widgets/widgetKartlarHizmet.dart';

class HizmetVeUrunler extends StatefulWidget {
  const HizmetVeUrunler({super.key});

  @override
  State<HizmetVeUrunler> createState() => _HizmetVeUrunlerState();
}

class _HizmetVeUrunlerState extends State<HizmetVeUrunler> {
  ProductJsn? urunlerListe;

  productlistecheck() async {
    urunlerListe = await productsFunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    productlistecheck();
  }

  Future<void> _dialogBuilder() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
           "Silmek İstediğinize Emin Misiniz ?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              //fontWeight: FontWeight.bold
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Sil',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Vazgeç'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // <-- SEE HERE
            //title: const Text('Select Booking Type'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Düzenle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const urunVeIstatistik()));
                },
                child: const Text('Ürün İstatistik Ve Bilgileri'),
              ),
            ],
          );
        });
  }

  final myController = TextEditingController();
  bool kontrol = true;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: anaEkranColor,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Text(
            "Hizmet Ve Ürünler",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
        drawer: const Drawer(
          child: DrawerWidget(),
        ),
        body: Container(
            //child : DrawerWidget(),

            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Ürün Ara",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),

                //eklenmiş hizmet ve ürünleri aradığımız ve seçtiğimiz kısım
                Container(
                  height: 70,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
                  margin: EdgeInsets.only(top: 0),
                  child: Align(
                      alignment: Alignment.center,
                      child: SearchTextBox(
                          hintText: "hintText",
                          valueList: kdvlist,
                          textControl: myController)),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,

                      //padding: const EdgeInsets.all(8),
                      itemCount: urunlerListe?.result!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: Slidable(
                                  key: const ValueKey(0),
                                  startActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (value) {
                                          _dialogBuilder();
                                        },
                                        backgroundColor: Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Sil',
                                      ),
                                    ],
                                  ),
                                  endActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (value) {
                                          _showSimpleDialog();
                                        },
                                        backgroundColor: Color(0xFF0392CF),
                                        foregroundColor: Colors.white,
                                        icon: Icons.settings,
                                       label: 'İşlemler',
                                      ),
                                    ],
                                  ),
                                  //child: Center(child: Text('Entry ${entries[index]}')),
                                  //gelirListe?.result!.expenseInvoices?[0].totalPayment.toString() ?? "",
                                  child: Projeler(
                                    musteriAdi: urunlerListe
                                            ?.result![0].productName
                                            .toString() ??
                                        "",
                                    tarihHizmetler: urunlerListe
                                            ?.result![0].productCode
                                            .toString() ??
                                        "",
                                    belgeKodu: urunlerListe
                                            ?.result![0].unitAndQuantity
                                            .toString() ??
                                        "",
                                    kdvMiktari: urunlerListe
                                            ?.result![0].taxAmount
                                            .toString() ??
                                        "",
                                    faturaTutari: urunlerListe
                                            ?.result![0].salary
                                            .toString() ??
                                        "",
                                  )),
                            ));
                      }),
                ),
                //yeni hizmet eklediğimiz kısım
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                  // height: 63,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: AddButton(
                        onTap: () {
                          setState(() {
                            //gelirGiderFaturaBaslik=" Gelir Faturası Oluştur";
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const YeniHizmet()));
                        },
                      )),
                ),
              ],
            )));
  }
}
