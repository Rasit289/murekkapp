import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/addPages/yuklenenBelgeler.dart';
import 'package:murekkapp/pages/kasaVeBankalar.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import '../model/CaseFlowJSClass.dart';
import '../widgets/widgetKartlarBanka.dart';
import '../widgets/widgetsKasaHareketleri.dart';
import '../const.dart';
import '../drawer_widget.dart';

class ParaIslemleri extends StatefulWidget {
  const ParaIslemleri({super.key});

  @override
  State<ParaIslemleri> createState() => _ParaIslemleriState();
}

class _ParaIslemleriState extends State<ParaIslemleri> {
  CaseFlowListJsn? kasaHareketleriListe;

  kasaHareketlerilistecheck() async {
    kasaHareketleriListe = await caseFlowFunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    kasaHareketlerilistecheck();
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
                child: const Text('İşlemi Düzenle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ParaIslemleri()));
                },
                child: const Text('Faturaya Git'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  belgeKontrol=0;
                  Navigator.pushReplacement(
                      context,
                      
                      MaterialPageRoute(
                          builder: (context) => const yuklenenBelgeler()));
                },
                child: const Text('Fatura Belgeleri'),
              ),
            ],
          );
        });
  }

  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: anaEkranColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            //geri ok butonuna bastığımzda tekrar kasa ve bankalara dönmemizi sağlayan kod
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const kasaVeBankalar()));
            },
          ),
          centerTitle: true,
          title: const Text(
            'Kasa Hareketleri ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
        drawer: const Drawer(
          child: DrawerWidget(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(14, 2, 14, 0),
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
                        "Kasa Adı",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 17,
                          color: guncelDurumTitleColor,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                      //kasa adının gösteren kısım
                      const Text(
                        "Deneme Kasası",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(14, 9, 14, 15),
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
                        "Kasa Bakiyesi",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: guncelDurumTitleColor,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                      //kasa bakiyesini gösteren kısım
                      const Text(
                        "14.500.456 ₺",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(14, 15, 14, 25),
                height: 850,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(53, 58, 64, 1),
                ),
                child: kasaHareketleriGiris(),
                  ),
           
              Container(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Fatura Ara",
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
                padding: EdgeInsets.fromLTRB(18, 0, 18, 20),
                margin: EdgeInsets.only(top: 0),
                child: Align(
                    alignment: Alignment.center,
                    child: SearchTextBox(
                        hintText: "hintText",
                        valueList: kdvlist,
                        textControl: myController)),
              ),
              SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(color: anaEkranColor),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,

                              //padding: const EdgeInsets.all(8),
                              itemCount: 2,
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
                                                backgroundColor:
                                                    Color(0xFFFE4A49),
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
                                                backgroundColor:
                                                    Color(0xFF0392CF),
                                                foregroundColor: Colors.white,
                                                icon: Icons.settings,
                                               label: 'İşlemler',
                                              ),
                                            ],
                                          ),

                                          //faturaTahsilatiContainer[index][0].toString(),
                                          //child: Center(child: Text('Entry ${entries[index]}')),
                                          child: ParaIslemleriContainer(
                                              islemT: kasaHareketleriListe
                                                      ?.result![index]
                                                      .processType
                                                      .toString() ??
                                                  "",
                                              miktarFatura: kasaHareketleriListe
                                                      ?.result![index].amount
                                                      .toString() ??
                                                  "",
                                              tarihTahsilat:
                                                  kasaHareketleriListe
                                                          ?.result![index].date
                                                          .toString() ??
                                                      "",
                                              bilgi: kasaHareketleriListe
                                                      ?.result![index].info
                                                      .toString() ??
                                                  "",
                                            )),
                                    ));
                              }),
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,

                              //padding: const EdgeInsets.all(8),
                              itemCount: 2,
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
                                                backgroundColor:
                                                    Color(0xFFFE4A49),
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
                                                backgroundColor:
                                                    Color(0xFF0392CF),
                                                foregroundColor: Colors.white,
                                                icon: Icons.settings,
                                                label: 'İşlemler',
                                              ),
                                            ],
                                          ),
                                          //faturaTahsilatiContainer[index][0].toString(),

                                          //child: Center(child: Text('Entry ${entries[index]}')),
                                          child: ParaIslemleriGiderContainer(
                                              islemT: kasaHareketleriListe
                                                      ?.result![index]
                                                      .processType
                                                      .toString() ??
                                                  "",
                                              miktarFatura: kasaHareketleriListe
                                                      ?.result![index].amount
                                                      .toString() ??
                                                  "",
                                              tarihTahsilat:
                                                  kasaHareketleriListe
                                                          ?.result![index].date
                                                          .toString() ??
                                                      "",
                                              bilgi: kasaHareketleriListe
                                                      ?.result![index].info
                                                      .toString() ??
                                                  "",
                                              )),
                                    ));
                              }),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}

