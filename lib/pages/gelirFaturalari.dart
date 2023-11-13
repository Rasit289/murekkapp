import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:murekkapp/addPages/OdemeYap.dart';
import 'package:murekkapp/addPages/createGelirFaturasi.dart';
import 'package:murekkapp/addPages/yuklenenBelgeler.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/simplaListData.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../addPages/tahsilatGecmisi.dart';
import '../const.dart';
import '../drawer_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/expenselnvoiceJSClass.dart';
import '../widgets/widgetKartlarFatura.dart';

class gelirFaturalari extends StatefulWidget {
  const gelirFaturalari({super.key});

  //static const routeNameGelirFaturalari = '/login-screen';

  @override
  State<gelirFaturalari> createState() => _gelirFaturalariState();
}

class _gelirFaturalariState extends State<gelirFaturalari> {

   ExpenseInvoiceListJsn? gelirListe;

  gelirlistecheck() async {
    gelirListe = await expenselInvoice();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    gelirlistecheck();
  }
//silmek isteiğimiz faturayı silen veya vazgeçmemizi sağlayan uyarı(show dialog)
  Future<void> _dialogBuilder() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Silmek istediğinize Emin misiniz ?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
          
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

  //fatura ile ilgili olan işlevleri görmemizi ve işlemleri yapmamızı sağlayan simple dialog
  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                        faturaCheck = 1;
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GelirFaturasi()));
                },
                child: const Text('Düzenle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  kontrolOdeme = 1;
                  OdemeYapGiris = "Tahsil Edilecek Tutar";
                  odemeYapBaslik = 'Tahsilat Yap';
                  odemeYapButtonText = "Tahsilat Yap";
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OdemeYap()));
                },
                child: const Text('Tahsilat & Ödeme Yap'),
              ),
              SimpleDialogOption(
                onPressed: () {
                        faturaCheck = 1;
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GelirFaturasi()));
                },
                child: const Text('Yazdır PDF'),
              ),
              SimpleDialogOption(
                onPressed: () {
                        faturaCheck = 1;
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GelirFaturasi()));
                },
                child: const Text('E-Faturaya İşle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                        faturaCheck = 1;
                 Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GelirFaturasi()));
                },
                child: const Text('E-Arşive işle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  tahsilatGecmisiBaslik="Tahsilat Geçmişi";
                  odemeGecmisiTarih="Tahsilat Tarihi:  ";
                   odemeGecmisiMiktar="Tahsilat Miktarı:  ";
                    odemeGecmisiKasa="İlgili Kasa:  ";
                     odemeGecmisiTur="Tahsilat Türü:  ";
                         faturaCheck = 1;
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const tahsilatGecmisi()));
                },
                child: const Text('Tahsilat & Ödeme Geçmişi'),
              ),
              SimpleDialogOption(
                onPressed: () {
                    faturaCheck = 1;
                    belgeKontrol=1;
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const yuklenenBelgeler()));
                },
                child: const Text('Yüklenen Belgeler'),
              ),
             
            ],
          );
        });
  }

  final myController = TextEditingController();


  SampleItem? selectedMenu;
  @override
    //gelir faturalarının düzenlendiği widget
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: anaEkranColor,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Text(
            'Gelir Faturaları',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: DrawerWidget(),
        ),
        //gelir faturalarının düzenlendiği widget
        body: Container(
      

            margin: const EdgeInsets.fromLTRB(3, 20, 3, 0),
            child: Column(
              children: [
                //gelir faturalarındaki gelir belgelerini düzenlendiğimiz Container
                Container(
                    margin: const EdgeInsets.fromLTRB(18, 2, 18, 0),
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(57, 56, 72, 1),
                      image: DecorationImage(
                        alignment: Alignment.topRight,
                        //image: AssetImage('images/tum_varliklarim.jpg'),
                        image: AssetImage('images/gelir_faturalari_image.jpg'),
                        scale: 3,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Gelir Belgeleri Toplamı",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: guncelDurumTitleColor,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                         Text(
                           gelirListe?.result!.totalInvoice.toString() ?? "",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    )),
                       //gelir faturalarındaki proforma toplamını düzenlendiğimiz Container
                Container(
                    margin: const EdgeInsets.fromLTRB(18, 9, 18, 15),
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(57, 56, 72, 1),
                      image: DecorationImage(
                        alignment: Alignment.topRight,
                        image: AssetImage('images/gelir_faturalari_image.jpg'),
                        scale: 3,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Proforma Toplamı",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: guncelDurumTitleColor,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                         Text(
                          gelirListe?.result!.totalInMount.toString() ?? "",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    )),
                    //daha önceden eklediğimiz faturaları aradığımız Container
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
                Expanded(
                    child: Swiper.children(
                        control: SwiperControl(
                          iconPrevious: Icons.arrow_back_ios,
                          iconNext: Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        children: [
                      ListView.builder(
                          shrinkWrap: true,

                          //padding: const EdgeInsets.all(8),
                          itemCount: tumFaturalarTest.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              // return the header
                              return Stack(
                                children: [
                                  Visibility(
                                    visible: tumFaturalarContainer,
                                    child: const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "Tüm Faturalar",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                            if (index == 1) {
                              return SizedBox(
                                width: 450,
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
                                        child: TahsilEdilmis(
                                          //  gelirListe?.result!.expenseInvoices.information.toString() ?? "",
                                          firmaAd: gelirListe?.result!.expenseInvoices?[0].information ?? "",
                                          belgeNumarasi:
                                             gelirListe?.result!.expenseInvoices?[0].docNo ?? "",
                                          belgeTutariYazi:
                                             gelirListe?.result!.expenseInvoices?[0].totalPayment.toString() ?? "",
                                                      vadeDurumu:
                                                        gelirListe?.result!.expenseInvoices?[0].parentStatus ?? "",
                                          TahsilatDurumu:
                                             gelirListe?.result!.expenseInvoices?[0].toString() ?? "",
                                          tarihTahsilat:
                                              gelirListe?.result!.expenseInvoices?[0].dateOfIssuance ?? "",
                                        ))
                                    //child: Center(child: Text('Entry ${entries[index]}')),
                                    ),
                              );
                            }

                            if (index == 2) {
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
                                        child: TahsilEdilmemis(
                                          firmaAd: gelirListe?.result!.expenseInvoices?[0].information.toString() ?? "",
                                        
                                          belgeNumarasiEdilmemis:
                                                gelirListe?.result!.expenseInvoices?[0].docNo ?? "",
                                          belgeTutariYazi:
                                           gelirListe?.result!.expenseInvoices?[0].totalPayment.toString() ?? "",
                                                      vadeDurumuEdilmemis:
                                                         gelirListe?.result!.expenseInvoices?[0].parentStatus.toString() ?? "",
                                          TahsilatDurumu:
                                              tahsiEdilmemisTest[index][3]
                                                  .toString(),
                                          tarihTahsilat:
                                              gelirListe?.result!.expenseInvoices?[0].dateOfIssuance ?? "",
                                        ))),
                              );
                            }
                            if (index == 3) {
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
                                        child: KismiTahsilEdilmis(
                                          firmaAd: gelirListe?.result!.expenseInvoices?[0].information.toString() ?? "",
                                          belgeNumarasiKismi:
                                           
                                                gelirListe?.result!.expenseInvoices?[0].docNo ?? "",
                                          belgeTutariYazi:
                                              gelirListe?.result!.expenseInvoices?[0].totalPayment.toString() ?? "",
                                                   vadeDurumukismi:
                                               gelirListe?.result!.expenseInvoices?[0].parentStatus.toString() ?? "",
                                          TahsilatDurumu:
                                              kismiTahsilEdilmisTest[index][3]
                                                  .toString(),
                                          tarihTahsilat:
                                             gelirListe?.result!.expenseInvoices?[0].dateOfIssuance ?? "",
                                        ))
                                    //child: Center(child: Text('Entry ${entries[index]}')),
                                    ),
                              );
                            }
                            if (index == 4) {
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
                                        child: TahsilEdilmemis(
                                          firmaAd: gelirListe?.result!.expenseInvoices?[0].information.toString() ?? "",
                                          belgeNumarasiEdilmemis:
                                                gelirListe?.result!.expenseInvoices?[0].docNo ?? "",
                                          belgeTutariYazi:
                                                 gelirListe?.result!.expenseInvoices?[0].totalPayment.toString() ?? "",
                                                      vadeDurumuEdilmemis:
                                                       gelirListe?.result!.expenseInvoices?[0].parentStatus ?? "",
                                          TahsilatDurumu:
                                              tahsiEdilmemisTest[index][3]
                                                  .toString(),
                                          tarihTahsilat:
                                              gelirListe?.result!.expenseInvoices?[0].dateOfIssuance ?? "",
                                        ))
                                    //child: Center(child: Text('Entry ${entries[index]}')),
                                    ),
                              );
                            }
                            return null;
                          }),
                      ListView.builder(
                          shrinkWrap: true,
                          //padding: const EdgeInsets.all(8),
                          itemCount: tahsilEdilmisTest.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              // return the header
                              return Stack(
                                children: [
                                  Visibility(
                                    visible: tumFaturalarContainer,
                                    child: const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "Tahsil Edilmemiş",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

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
                                      child: TahsilEdilmemis(
                                        firmaAd:   gelirListe?.result!.expenseInvoices?[0].information ?? "",
                                        
                                        belgeNumarasiEdilmemis:
                                             gelirListe?.result!.expenseInvoices?[0].docNo ?? "",
                                        belgeTutariYazi:
                                              gelirListe?.result!.expenseInvoices?[0].totalPayment.toString() ?? "",
                                                    vadeDurumuEdilmemis:
                                                      gelirListe?.result!.expenseInvoices?[0].parentStatus ?? "",
                                        TahsilatDurumu:
                                            tahsiEdilmemisTest[index][3]
                                                .toString(),
                                        tarihTahsilat:  gelirListe?.result!.expenseInvoices?[0].dateOfIssuance ?? "",
                                      ))
                                  //child: Center(child: Text('Entry ${entries[index]}')),
                                  ),
                            );
                          }),
                      ListView.builder(
                          shrinkWrap: true,

                          //padding: const EdgeInsets.all(8),
                          itemCount: tahsiEdilmemisTest.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              // return the header
                              return Stack(
                                children: [
                                  Visibility(
                                    visible: tumFaturalarContainer,
                                    child: const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "Kısmi Tahsil Edilmiş",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
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
                                child: KismiTahsilEdilmis(
                                    firmaAd:   gelirListe?.result!.expenseInvoices?[0].information ?? "",
                                       
                                    belgeNumarasiKismi:
                                          gelirListe?.result!.expenseInvoices?[0].docNo ?? "",
                                    belgeTutariYazi:
                                          gelirListe?.result!.expenseInvoices?[0].totalPayment.toString() ?? "",
                                                   vadeDurumukismi:
                                          gelirListe?.result!.expenseInvoices?[0].parentStatus ?? "",
                                    TahsilatDurumu:
                                        kismiTahsilEdilmisTest[index][3]
                                            .toString(),
                                    tarihTahsilat:  gelirListe?.result!.expenseInvoices?[0].dateOfIssuance ?? "",)
                              )
                                  //child: Center(child: Text('Entry ${entries[index]}')),
                                  ),
                            );
                          }),
                      ListView.builder(
                          shrinkWrap: true,
                          //padding: const EdgeInsets.all(8),
                          itemCount: kismiTahsilEdilmisTest.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              // return the header
                              return Stack(
                                children: [
                                  Visibility(
                                    visible: tumFaturalarContainer,
                                    child: const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "Tahsil Edilmiş",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

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
                                      child: TahsilEdilmis(
                                          firmaAd:   gelirListe?.result!.expenseInvoices?[0].information ?? "",
                                            
                                          belgeNumarasi:
                                             gelirListe?.result!.expenseInvoices?[0].docNo ?? "",
                                          belgeTutariYazi:
                                                gelirListe?.result!.expenseInvoices?[0].totalPayment.toString() ?? "",
                                                           vadeDurumu:
                                                      gelirListe?.result!.expenseInvoices?[0].parentStatus ?? "",
                                          TahsilatDurumu:
                                              tahsilEdilmisTest[index][3]
                                                  .toString(),
                                          tarihTahsilat:
                                              gelirListe?.result!.expenseInvoices?[0].dateOfIssuance ?? "",))
                                  //child: Center(child: Text('Entry ${entries[index]}')),
                                  ),
                            );
                          })
                    ])),
                    //Gelir Faturası Olıştur kısmına geçiş sağlayan  buton
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
                            gelirGiderFaturaBaslik = " Gelir Faturası Oluştur";
                            faturaCheck = 1;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GelirFaturasi()));
                        },
                      )),
                ),
              ],
            )));
  }
}


