import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/pages/hizmetveUrunler.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import '../const.dart';
import '../drawer_widget.dart';
import '../model/productDetaylJSClass.dart';
import '../widgets/widgetKartlarHizmet.dart';

class urunVeIstatistik extends StatefulWidget {
  const urunVeIstatistik({super.key});

  @override
  State<urunVeIstatistik> createState() => _urunVeIstatistikState();
}

//faturayı sildiğimiz yada silmekten vazgeçtiğimiz kısım
class _urunVeIstatistikState extends State<urunVeIstatistik> {
  ProductDetaylJsn? urunVeistatistikListe;

  productDetayllistecheck() async {
    urunVeistatistikListe = await productDetaylFunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    productDetayllistecheck();
  }

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
                  Navigator.of(context).pop();
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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            //geri ok butonuna bastığımızda tekrar ürün ve hizmetlere giden kod
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HizmetVeUrunler()));
            },
          ),
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
                Text(
                  "İstatistik Ve Ürünler",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(18, 2, 18, 0),
                     padding: EdgeInsets.all(7),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(57, 56, 72, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "ADOP - STB P.Kodu- 005655",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                            color: guncelDurumTitleColor,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        const Text(
                          "Satış Fiyatı : 0,00 ₺",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "Alış Fiyatı : 0,00 ₺",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: guncelDurumTitleColor,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        const Text(
                          "Vergi Kodu :K.D.V. 0,00",
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
                    margin: const EdgeInsets.fromLTRB(18, 20, 18, 10),
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
                          "Ürün için kesilen fatura :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        //ürün için kesilen fatura adetini gösteren kısım
                        Text(
                          urunVeistatistikListe?.result!.invoiceCount
                                  .toString() ??
                              "",
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
                    margin: const EdgeInsets.fromLTRB(18, 2, 18, 0),
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
                          "Toplam Satış Tutarı :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        //toplam satış miktarını gösteren kod
                        Text(
                          urunVeistatistikListe?.result!.totalSalary
                                  .toString() ??
                              "",
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

                //ürün aradığımız kısım
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
                      itemCount: urunVeistatistikListe?.result!
                                            .invoiceList?.length,
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
                                        onPressed: (value) {},
                                        backgroundColor: Color(0xFF0392CF),
                                        foregroundColor: Colors.white,
                                        icon: Icons.settings,
                                        label: 'Düzenle',
                                      ),
                                    ],
                                  ),
                                  //child: Center(child: Text('Entry ${entries[index]}')),
                                  child: urunVeIstatistikContainer(
                                    musteriAdi: urunVeistatistikListe?.result!
                                            .invoiceList?[index].customerName
                                            .toString() ??
                                        "",
                                    tarihHizmetler:
                                      urunVeistatistikListe?.result!
                                            .invoiceList?[index].documentCode
                                            .toString() ??
                                        "",
                                    belgeKodu:
                                      urunVeistatistikListe?.result!
                                            .invoiceList?[index].totalInvoice
                                            .toString() ??
                                        "",
                                    faturaTutari:
                                        "01.01.2001"
                                  )),
                            ));
                      }),
                ),
              ],
            )));
  }
}
