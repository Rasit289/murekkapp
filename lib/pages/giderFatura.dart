import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/addPages/tahsilatGecmisi.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/widgets/widget_giderFatura.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../addPages/OdemeYap.dart';
import '../addPages/yuklenenBelgeler.dart';
import '../const.dart';
import '../addPages/createGelirFaturasi.dart';
import '../drawer_widget.dart';
import 'package:murekkapp/simplaListData.dart';

import '../model/expenselnvoiceJSClass.dart';
import '../widgets/widgetKartlarFatura.dart';

class giderFatura extends StatefulWidget {
  const giderFatura({super.key});

  //static const routeNameGiderFaturalari = '/login-screen';

  @override
  State<giderFatura> createState() => _giderFaturaState();
}

class _giderFaturaState extends State<giderFatura> {
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

  final myController = TextEditingController();

  Future<void> _showSimpleDialog2() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            width: double.infinity,
            child: Center(
               
                   
                   
                    child: KismiTahsilEdilmis(
                      firmaAd: gelirListe
                              ?.result!.expenseInvoices?[0].information
                              .toString() ??
                          "",
                      belgeNumarasiKismi:
                          gelirListe?.result!.expenseInvoices?[0].docNo ?? "",
                      belgeTutariYazi: gelirListe
                              ?.result!.expenseInvoices?[0].totalPayment
                              .toString() ??
                          "",
                      vadeDurumukismi: gelirListe
                              ?.result!.expenseInvoices?[0].parentStatus
                              .toString() ??
                          "",
                      TahsilatDurumu: kismiTahsilEdilmisTest[0][3].toString(),
                      tarihTahsilat: gelirListe
                              ?.result!.expenseInvoices?[0].dateOfIssuance ??
                          "",
                    )
                //child: Center(child: Text('Entry ${entries[index]}')),
                ),
          );
        });
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
                  faturaCheck = 0;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GelirFaturasi()));
                },
                child: const Text('Düzenle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  kontrolOdeme = 0;
                  OdemeYapGiris = "Ödenecek Tutar";
                  odemeYapBaslik = "Ödeme Yap";
                  odemeYapButtonText = "Ödeme Yap";
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OdemeYap()));
                },
                child: const Text('Tahsilat & Ödeme Yap'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  faturaCheck = 0;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GelirFaturasi()));
                },
                child: const Text('Yazdır PDF'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  faturaCheck = 0;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GelirFaturasi()));
                },
                child: const Text('E-Faturaya İşle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  faturaCheck = 0;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GelirFaturasi()));
                },
                child: const Text('E-Arşive işle'),
              ),
              SimpleDialogOption(
                 onPressed: () {
                   tahsilatGecmisiBaslik="Ödeme Geçmişi";
                    
                  odemeGecmisiTarih="Ödeme Tarihi:  ";
                   odemeGecmisiMiktar="Ödeme Miktarı:  ";
                    odemeGecmisiKasa="İlgili Kasa:  ";
                     odemeGecmisiTur="Ödeme Türü:  ";
                                                 faturaCheck = 0;
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const tahsilatGecmisi()));
                                              },
                child: const Text('Tahsilat & Ödeme Geçmişi'),
              ),
              SimpleDialogOption(
                onPressed: () {
                   faturaCheck = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: anaEkranColor,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Text(
            'Gider Faturaları',
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
                          "Gider Belgeleri Toplamı",
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
                          "Bu Ayki Giderler Toplamı",
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
                Container(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
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
                              return Stack(
                                children: [
                                  Visibility(
                                    visible: tumFaturalarContainer,
                                    child: const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "Tüm Faturalarım",
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
                                      child: KismiTahsilEdilmis(
                                        firmaAd: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .information ??
                                            "",
                                        belgeNumarasiKismi: gelirListe?.result!
                                                .expenseInvoices?[0].docNo ??
                                            "",
                                        belgeTutariYazi: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .totalPayment
                                                .toString() ??
                                            "",
                                        vadeDurumukismi: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .parentStatus
                                                .toString() ??
                                            "",
                                        TahsilatDurumu:
                                            kismiTahsilEdilmisTest[index][3]
                                                .toString(),
                                        tarihTahsilat: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .dateOfIssuance ??
                                            "",
                                      )),
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
                                        //child: Center(child: Text('Entry ${entries[index]}')),
                                        child: TahsilEdilmis(
                                          //  gelirListe?.result!.expenseInvoices.information.toString() ?? "",
                                          firmaAd: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .information ??
                                              "",
                                          belgeNumarasi: gelirListe?.result!
                                                  .expenseInvoices?[0].docNo ??
                                              "",
                                          belgeTutariYazi: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .totalPayment
                                                  .toString() ??
                                              "",
                                          vadeDurumu: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .parentStatus ??
                                              "",
                                          TahsilatDurumu: gelirListe
                                                  ?.result!.expenseInvoices?[0]
                                                  .toString() ??
                                              "",
                                          tarihTahsilat: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .dateOfIssuance ??
                                              "",
                                        )),
                                  ));
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
                                        //child: Center(child: Text('Entry ${entries[index]}')),
                                        child: TahsilEdilmemis(
                                          firmaAd: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .totalPayment
                                                  .toString() ??
                                              "",
                                          belgeNumarasiEdilmemis: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .docNo ??
                                              "",
                                          belgeTutariYazi: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .totalPayment
                                                  .toString() ??
                                              "",
                                          vadeDurumuEdilmemis: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .parentStatus
                                                  .toString() ??
                                              "",
                                          TahsilatDurumu: odenmemisTest[index]
                                                  [3]
                                              .toString(),
                                          tarihTahsilat: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .dateOfIssuance ??
                                              "",
                                        )),
                                  ));
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
                                        //child: Center(child: Text('Entry ${entries[index]}')),
                                        child: TahsilEdilmemis(
                                          firmaAd: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .totalPayment
                                                  .toString() ??
                                              "",
                                          belgeNumarasiEdilmemis: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .docNo ??
                                              "",
                                          belgeTutariYazi: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .totalPayment
                                                  .toString() ??
                                              "",
                                          vadeDurumuEdilmemis: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .parentStatus
                                                  .toString() ??
                                              "",
                                          TahsilatDurumu: odenmemisTest[index]
                                                  [3]
                                              .toString(),
                                          tarihTahsilat: gelirListe
                                                  ?.result!
                                                  .expenseInvoices?[0]
                                                  .dateOfIssuance ??
                                              "",
                                        )),
                                  ));
                            }

                            return SizedBox(
                              width: double.infinity,
                              child: Center(
                                  //child: Center(child: Text('Entry ${entries[index]}')),
                                  child: Tahsilat(
                                      firmaAd: tumFaturalarOdenmisTest[index][0]
                                          .toString(),
                                      belgeTutariYazi:
                                          tumFaturalarOdenmisTest[index][1]
                                              .toString(),
                                      TahsilatDurumu:
                                          tumFaturalarOdenmisTest[index][2]
                                              .toString(),
                                      tarihTahsilat:
                                          tumFaturalarOdenmisTest[index][3]
                                              .toString())),
                            );
                          }),
                      ListView.builder(
                          shrinkWrap: true,
                          //padding: const EdgeInsets.all(8),
                          itemCount: tahsilEdilmisTest.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Stack(
                                children: [
                                  Visibility(
                                    visible: tumFaturalarContainer,
                                    child: const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "Ödenmiş",
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
                                      //child: Center(child: Text('Entry ${entries[index]}')),
                                      child: TahsilEdilmis(
                                        firmaAd: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .information ??
                                            "",
                                        belgeNumarasi: gelirListe?.result!
                                                .expenseInvoices?[0].docNo ??
                                            "",
                                        belgeTutariYazi: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .totalPayment
                                                .toString() ??
                                            "",
                                        vadeDurumu: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .parentStatus ??
                                            "",
                                        TahsilatDurumu:
                                            odenmisTest[index][3].toString(),
                                        tarihTahsilat: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .dateOfIssuance ??
                                            "",
                                      )),
                                ));
                          }),
                      ListView.builder(
                          shrinkWrap: true,

                          //padding: const EdgeInsets.all(8),
                          itemCount: tahsiEdilmemisTest.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Stack(
                                children: [
                                  Visibility(
                                    visible: tumFaturalarContainer,
                                    child: const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "Ödenmemiş",
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
                                      //child: Center(child: Text('Entry ${entries[index]}')),
                                      child: TahsilEdilmemis(
                                        firmaAd: gelirListe?.result!
                                                .expenseInvoices?[0].information
                                                .toString() ??
                                            "",
                                        belgeNumarasiEdilmemis: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .docNo ??
                                            "",
                                        belgeTutariYazi: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .totalPayment
                                                .toString() ??
                                            "",
                                        vadeDurumuEdilmemis: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .parentStatus
                                                .toString() ??
                                            "",
                                        TahsilatDurumu:
                                            odenmemisTest[index][3].toString(),
                                        tarihTahsilat: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .dateOfIssuance ??
                                            "",
                                      )),
                                ));
                          }),
                      ListView.builder(
                          shrinkWrap: true,
                          //padding: const EdgeInsets.all(8),
                          itemCount: kismiTahsilEdilmisTest.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Stack(
                                children: [
                                  Visibility(
                                    visible: tumFaturalarContainer,
                                    child: const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "Kısmi Ödenmiş",
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
                                      //child: Center(child: Text('Entry ${entries[index]}')),
                                      child: KismiTahsilEdilmis(
                                        firmaAd: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .information ??
                                            "",
                                        belgeNumarasiKismi: gelirListe?.result!
                                                .expenseInvoices?[0].docNo ??
                                            "",
                                        belgeTutariYazi: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .totalPayment
                                                .toString() ??
                                            "",
                                        vadeDurumukismi: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .parentStatus
                                                .toString() ??
                                            "",
                                        TahsilatDurumu:
                                            kismiTahsilEdilmisTest[index][3]
                                                .toString(),
                                        tarihTahsilat: gelirListe
                                                ?.result!
                                                .expenseInvoices?[0]
                                                .dateOfIssuance ??
                                            "",
                                      )),
                                ));
                          })
                    ])),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 10, 3),
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
                            faturaCheck = 2;

                            gelirGiderFaturaBaslik = " Gider Faturası Oluştur";
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

