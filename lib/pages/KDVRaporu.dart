import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/simplaListData.dart';
import '../const.dart';
import '../drawer_widget.dart';
import '../widgets/WidgetRaporlarKartlar.dart';
import '../widgets/widgetKartlarFatura.dart';

class KDVRaporu extends StatefulWidget {
  const KDVRaporu({super.key});

  @override
  State<KDVRaporu> createState() => _KDVRaporuState();
}

class _KDVRaporuState extends State<KDVRaporu> {
  final myController = TextEditingController();

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
                  Navigator.of(context).pop();
                },
                child: const Text('Yazdır PDF'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('E-Faturaya İşle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('E-Arşive işle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Tahsilat & Ödeme Geçmişi'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anaEkranColor,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'KDV Raporu ',
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
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    height: 25,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        //color: Color.fromRGBO(243, 54, 2, 1),

                        ),
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Aylara Göre KDV Toplantıları",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 350,
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
                        //KDV raporlarının arandığı kısım
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
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                          height: 210,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(57, 56, 72, 1),
                          ),
                          child: Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,

                                //padding: const EdgeInsets.all(8),
                                itemCount: 4,
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
                                            endActionPane: const ActionPane(
                                              motion: ScrollMotion(),
                                              children: [
                                                SlidableAction(
                                                  onPressed: null,
                                                  backgroundColor:
                                                      Color(0xFF0392CF),
                                                  foregroundColor: Colors.white,
                                                  icon: Icons.settings,
                                                  label: 'Düzenle',
                                                ),
                                              ],
                                            ),
                                            child: KDVRaporuContainer(
                                              donem: kdvRaporuTest[index][0]
                                                  .toString(),
                                              hesaplananKDV:
                                                  kdvRaporuTest[index][1]
                                                      .toString(),
                                              indirilecekKDV:
                                                  kdvRaporuTest[index][2]
                                                      .toString(),
                                              netKDV: kdvRaporuTest[index][3]
                                                  .toString(),
                                            )),
                                      ));
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 65, 20, 0),
                    height: 25,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        //color: Color.fromRGBO(243, 54, 2, 1),

                        ),
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "KDV Dökümü",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
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
                        //KDV dökümünün arandığı kısım
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
                                                  "Tümü",
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
                                                        foregroundColor:
                                                            Colors.white,
                                                        icon: Icons.settings,
                                                        label: 'Düzenle',
                                                      ),
                                                    ],
                                                  ),
                                                  //child: Center(child: Text('Entry ${entries[index]}')),
                                                  child: TahsilEdilmemis(
                                                      firmaAd:
                                                          KDVdokumuTest[index]
                                                                  [0]
                                                              .toString(),
                                                      belgeNumarasiEdilmemis:
                                                          KDVdokumuTest[index]
                                                                  [1]
                                                              .toString(),
                                                      belgeTutariYazi:
                                                          KDVdokumuTest[index]
                                                                  [2]
                                                              .toString(),
                                                                vadeDurumuEdilmemis:
                                                          KDVdokumuTest[index]
                                                                  [2]
                                                              .toString(),
                                                      TahsilatDurumu:
                                                          KDVdokumuTest[index]
                                                                  [3]
                                                              .toString(),
                                                      tarihTahsilat:
                                                          KDVdokumuTest[index]
                                                                  [4]
                                                              .toString(),)),
                                            ));
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
                                                        foregroundColor:
                                                            Colors.white,
                                                        icon: Icons.settings,
                                                        label: 'Düzenle',
                                                      ),
                                                    ],
                                                  ),
                                                  //child: Center(child: Text('Entry ${entries[index]}')),
                                                  child: TahsilEdilmis(
                                                    firmaAd:
                                                        KDVdokumuTest2[index][0]
                                                            .toString(),
                                                    belgeNumarasi:
                                                        KDVdokumuTest2[index][1]
                                                            .toString(),
                                                    belgeTutariYazi:
                                                        KDVdokumuTest2[index][2]
                                                            .toString(),
                                                    vadeDurumu:
                                                        KDVdokumuTest2[index][1]
                                                            .toString(),
                                                    TahsilatDurumu:
                                                        KDVdokumuTest2[index][3]
                                                            .toString(),
                                                    tarihTahsilat:
                                                        KDVdokumuTest2[index][4]
                                                            .toString(),
                                                  )),
                                            ));
                                      }
                                      return null;
                                    }),
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
                                                endActionPane: const ActionPane(
                                                  motion: ScrollMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      onPressed: null,
                                                      backgroundColor:
                                                          Color(0xFF0392CF),
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.settings,
                                                      label: 'Düzenle',
                                                    ),
                                                  ],
                                                ),
                                                //child: Center(child: Text('Entry ${entries[index]}')),
                                                child: TahsilEdilmemis(
                                                    firmaAd:
                                                        KDVdokumuTest[index][0]
                                                            .toString(),
                                                    belgeNumarasiEdilmemis:
                                                        KDVdokumuTest[index][1]
                                                            .toString(),
                                                    belgeTutariYazi:
                                                        KDVdokumuTest[index][2]
                                                            .toString(),
                                                                vadeDurumuEdilmemis:
                                                          KDVdokumuTest[index]
                                                                  [2]
                                                              .toString(),
                                                    TahsilatDurumu:
                                                        KDVdokumuTest[index][3]
                                                            .toString(),
                                                    tarihTahsilat:
                                                        KDVdokumuTest[index][4]
                                                            .toString())),
                                          ));
                                    }),
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
                                                  "Satışlar",
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
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.settings,
                                                      label: 'Düzenle',
                                                    ),
                                                  ],
                                                ),
                                                child: TahsilEdilmis(
                                                    firmaAd:
                                                        KDVdokumuTest2[index][0]
                                                            .toString(),
                                                    belgeNumarasi:
                                                        KDVdokumuTest2[index][1]
                                                            .toString(),
                                                    belgeTutariYazi:
                                                        KDVdokumuTest2[index][2]
                                                            .toString(),
                                                                vadeDurumu:
                                                        KDVdokumuTest2[index][1]
                                                            .toString(),
                                                    TahsilatDurumu:
                                                        KDVdokumuTest2[index][3]
                                                            .toString(),
                                                    tarihTahsilat:
                                                        KDVdokumuTest2[index][4]
                                                            .toString())),
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

