import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import '../addPages/OdemeYap.dart';
import '../addPages/createGelirFaturasi.dart';
import '../addPages/tahsilatGecmisi.dart';
import '../addPages/yuklenenBelgeler.dart';
import '../const.dart';
import '../drawer_widget.dart';
import '../widgets/WidgetRaporlarKartlar.dart';
import '../widgets/gelirFaturaRaporuWidget.dart';



class GiderFaturaRaaporu extends StatefulWidget {
  const GiderFaturaRaaporu({super.key});

  @override
  State<GiderFaturaRaaporu> createState() => _GiderFaturaRaaporuState();
}

class _GiderFaturaRaaporuState extends State<GiderFaturaRaaporu> {
  //silmek isteiğimiz faturayı silen veya vazgeçmemizi sağlayan uyarı(show dialog)
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
                  tahsilatGecmisiBaslik="Tahsilat Tarihi";
                  odemeGecmisiTarih="Tahsilat Geçmişi:  ";
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anaEkranColor,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Gider Fatura Raporu ',
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
              child: Column(
                children: [
                  Container(
                    child: giderFaturaRaporuDegerler(),
                  ),

                  //Gider Fatura Raporu Oluşturduğumuz Container
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                    height: 330,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(57, 56, 72, 1),
                    ),
                    child: GelirFaturaRaporuBilgiler(),
                  ),

                  //daha önceden eklenen fatura,müşteri ve hizmet ve ürünlerin arandığı search kısmı
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 560,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(57, 56, 72, 1),
                    ),
                    child: Column(
                      children: [
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
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                          margin: EdgeInsets.only(top: 0),
                          child: Align(
                              alignment: Alignment.center,
                              child: SearchTextBox(
                                  hintText: "hintText",
                                  valueList: kdvlist,
                                  textControl: myController)),
                        ),
                        //daha önceden eklenen fatura,müşteri ve hizmet ve ürünlerin bulunduğu Container

                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 7, 10, 0),
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(57, 56, 72, 1),
                          ),
                          child: Expanded(
                              child: Swiper.children(
                                  control: SwiperControl(
                                    iconPrevious: Icons.arrow_back_ios,
                                    iconNext: Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                  children: [
                                //önceden eklenen Faturaların bulunduğu kısım
                                ListView.builder(
                                    shrinkWrap: true,

                                    //padding: const EdgeInsets.all(8),
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index == 0) {
                                        // return the header
                                        return Stack(
                                          children: [
                                            Visibility(
                                              visible: tumFaturalarContainer,
                                              child: const Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  "Giderler",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontSize: 24,
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
                                            //faturalar kartının kaydırılmasının sağlayan slidable
                                            child: Slidable(
                                                key: const ValueKey(0),
                                                //faturayı sağa kaydırdığımızda silmeyi sağlayan kod
                                                startActionPane: ActionPane(
                                                  motion: ScrollMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      onPressed: (value) {
                                                        _dialogBuilder();
                                                      },
                                                      backgroundColor:
                                                          Color(0xFFFE4A49),
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.delete,
                                                      label: 'Sil',
                                                    ),
                                                  ],
                                                ),
                                                //faturayı sola kaydırdığımızda işlemlere gitmeyi sağlayan kod
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
                                                //fatura kısmının oluşturulduğu ve bilgilerinin girildiği yer
                                                child: FaturalarOrnek(
                                                  firma3: FaturalarDropDownTest[
                                                          index][0]
                                                      .toString(),
                                                  musteriBelgeTutariYazi4:
                                                      FaturalarDropDownTest[
                                                              index][1]
                                                          .toString(),
                                                  tarihTahsilat1:
                                                      FaturalarDropDownTest[
                                                              index][2]
                                                          .toString(),
                                                  FaturaNumrasi:
                                                      FaturalarDropDownTest[
                                                              index][3]
                                                          .toString(),
                                                )),
                                          ));
                                    }),
                                //önceden eklenen Tedarikçilerin bulunduğu kısım
                                ListView.builder(
                                    shrinkWrap: true,
                                    //padding: const EdgeInsets.all(8),
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index == 0) {
                                        // return the header
                                        return Stack(
                                          children: [
                                            Visibility(
                                              visible: tumFaturalarContainer,
                                              child: const Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  "Tedarikçiler",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontSize: 24,
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
                                                      backgroundColor:
                                                          Color(0xFFFE4A49),
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.delete,
                                                      label: 'Sil',
                                                    ),
                                                  ],
                                                ),
                                                endActionPane:  ActionPane(
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

                                                child: musteriRapor(
                                                  firmaAd:
                                                      musteriRaporTest[index][0]
                                                          .toString(),
                                                  musteriNumber:
                                                      musteriRaporTest[index][1]
                                                          .toString(),
                                                  musteriEposta:
                                                      musteriRaporTest[index][2]
                                                          .toString(),
                                                  vergiDiresi:
                                                      musteriRaporTest[index][3]
                                                          .toString(),
                                                  TCnumarasi:
                                                      musteriRaporTest[index][4]
                                                          .toString(),
                                                  musteriBakiye:
                                                      musteriRaporTest[index][5]
                                                          .toString(),
                                                )),
                                          ));
                                    }),
                                //önceden eklenen Hizmet Ve Ürünlerin bulunduğu kısım
                                ListView.builder(
                                    shrinkWrap: true,

                                    //padding: const EdgeInsets.all(8),
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index == 0) {
                                        // return the header
                                        return Stack(
                                          children: [
                                            Visibility(
                                              visible: tumFaturalarContainer,
                                              child: const Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  "Hizmet Ve Ürünler",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontSize: 24,
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
                                                      backgroundColor:
                                                          Color(0xFFFE4A49),
                                                      foregroundColor:
                                                          Colors.white,
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
                                                child: musteriRapor(
                                                  firmaAd:
                                                      hizmetRaporTest[index][0]
                                                          .toString(),
                                                  musteriNumber:
                                                      hizmetRaporTest[index][1]
                                                          .toString(),
                                                  musteriEposta:
                                                      hizmetRaporTest[index][2]
                                                          .toString(),
                                                  vergiDiresi:
                                                      hizmetRaporTest[index][3]
                                                          .toString(),
                                                  TCnumarasi:
                                                      hizmetRaporTest[index][4]
                                                          .toString(),
                                                  musteriBakiye:
                                                      hizmetRaporTest[index][5]
                                                          .toString(),
                                                )),
                                          ));
                                    }),
                              ])),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
