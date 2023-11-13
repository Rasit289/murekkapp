import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/addPages/KasaEkle.dart';
import 'package:murekkapp/addPages/ParaIslemleri.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../const.dart';
import '../drawer_widget.dart';
import 'package:murekkapp/simplaListData.dart';

import '../model/caseAndBankJSClass.dart';
import '../widgets/widgetKartlarBanka.dart';

class kasaVeBankalar extends StatefulWidget {
  const kasaVeBankalar({super.key});

  @override
  State<kasaVeBankalar> createState() => _kasaVeBankalarState();
}

class _kasaVeBankalarState extends State<kasaVeBankalar> {

  CaseAndBankListJsn? kasaVeBankalarListe;

  kasaVeBankalarcheck() async {
    kasaVeBankalarListe = await caseAndBankFunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    kasaVeBankalarcheck();
  }

  //kasayı silmemize veya vazgeçmemizi sağlayan kod
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
  //kasa ve bankalara ait işlemlerin düzenlendiği kısım
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
                    builder: (context) => const ParaIslemleri()));
                },
                child: const Text('Kasa Hareketleri'),
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
            'Kasa Ve Bankalar',
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
                    margin: const EdgeInsets.fromLTRB(18, 10, 18, 0),
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(57, 56, 72, 1),
                      image: DecorationImage(
                        alignment: Alignment.topRight,
                        //image: AssetImage('images/tum_varliklarim.jpg'),
                        image: AssetImage('images/kasa.jpg'),
                        scale: 3,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Kasalar Toplamı",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: guncelDurumTitleColor,
                         
                          ),
                        ),
                        //kasalar toplamını gösterdiğimiz kısım
                       
                         Text(
                          kasaVeBankalarListe?.result!.totalCase.toString() ?? "",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          
                          ),
                        ),
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(18, 10, 18, 0),
                  padding: EdgeInsets.fromLTRB(10, 3, 3, 0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(57, 56, 72, 1),
                    image: DecorationImage(
                      alignment: Alignment.topRight,
                      image: AssetImage('images/kasalarToplami2.jpg'),
                      
                      scale: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Bankalar Toplamı",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: guncelDurumTitleColor,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                      //bankalar toplamını gösterdiğimiz kısım
                       Text(
                          kasaVeBankalarListe?.result!.totalBank.toString() ?? "",
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
                  margin: const EdgeInsets.fromLTRB(18, 9, 18, 20),
                  padding: EdgeInsets.fromLTRB(10, 3, 3, 0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(57, 56, 72, 1),
                    image: DecorationImage(
                      alignment: Alignment.topRight,
                      image: AssetImage('images/nakit.jpg'),
                      scale: 3,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Nakit Toplamı",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: guncelDurumTitleColor,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                      //nakit toplamını gösterdiğimiz kısım
                       Text(
                          kasaVeBankalarListe?.result!.cacheTotal.toString() ?? "",
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
                        padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
                      child:    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Kasa Ara",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),

                       //eklenmiş kasaları aradığımız kısım
                      Container(
                        height: 70,
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
                        margin: EdgeInsets.only(top: 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: SearchTextBox(hintText: "hintText", valueList: kdvlist, textControl: myController)
                        ),
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
                              child:Slidable(
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
                                              backgroundColor:
                                                  Color(0xFF0392CF),
                                              foregroundColor: Colors.white,
                                              icon: Icons.settings,
                                            label: 'İşlemler',
                                            ),
                                          ],
                                        ),
                              //child: Center(child: Text('Entry ${entries[index]}')),
                              child: widgetKasaVeBankalar(
                                  hesapTuru:
                                      kasaVeBankalarTest[index][0].toString(),
                                  dovizCinsi:
                                      kasaVeBankalarListe?.result!.accountList?[index].foreignCurrency ?? "",
                                  hesapIsmi:
                                      kasaVeBankalarListe?.result!.accountList?[index].accountName ?? "",
                                  bakiye:
                                      kasaVeBankalarListe?.result!.accountList?[index].balance.toString() ?? "",)),)
                        );
                      }),
                ),
                //yeni kasa eklediğimiz kısım
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
                         
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const KasaEkle()));
                        },
                      )),
                ),
              ],
            )));
  }
}
