import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:murekkapp/addPages/OdemeYap.dart';
import 'package:murekkapp/addPages/createGelirFaturasi.dart';
import 'package:murekkapp/addPages/yuklenenBelgeler.dart';
import 'package:murekkapp/simplaListData.dart';
import '../addPages/tahsilatGecmisi.dart';
import '../const.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/expenselnvoiceJSClass.dart';
import '../widgets/widgetKartlarFatura.dart';

class gelirFaturalariKartlar extends StatefulWidget {
  const gelirFaturalariKartlar({super.key});

  @override
  State<gelirFaturalariKartlar> createState() => _gelirFaturalariKartlarState();
}

class _gelirFaturalariKartlarState extends State<gelirFaturalariKartlar> {
    ExpenseInvoiceListJsn? gelirListe;

  
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
                  odemeGecmisiTarih="Tahsilat Geçmişi:  ";
                   odemeGecmisiMiktar="Tahsilat Miktarı:  ";
                    odemeGecmisiKasa="Tahsilat Kasası:  ";
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
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const yuklenenBelgeler()));
                },
                child: const Text('Yüklenen Belgeler'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Kaldır'),
              ),
            ],
          );
        });
  }

  final myController = TextEditingController();


  SampleItem? selectedMenu;

 
  gelirlistecheck() async {
    gelirListe = await expenselInvoice();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    gelirlistecheck();
  }
  @override
  Widget build(BuildContext context) {
    return     Expanded(
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
                                              label: 'Düzenle',
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
                                              label: 'Düzenle',
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
                                              label: 'Düzenle',
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
                                              label: 'Düzenle',
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
                                            label: 'Düzenle',
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
                                      label: 'Düzenle',
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
                                            label: 'Düzenle',
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
                    ]));
  }
}