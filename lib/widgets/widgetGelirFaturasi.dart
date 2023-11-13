import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:multiselect/multiselect.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';
import 'package:murekkapp/widgets/widget_giderFatura.dart';
import 'package:murekkapp/widgets/widgets_button.dart';


import '../const.dart';
import '../model/invoiceDetailJSClass.dart';
import '../simplaListData.dart';


class WidgetGelirFaturasi extends StatefulWidget {
  const WidgetGelirFaturasi({super.key});

  @override
  State<WidgetGelirFaturasi> createState() => _WidgetGelirFaturasiState();
}

class _WidgetGelirFaturasiState extends State<WidgetGelirFaturasi> {
  final myController = TextEditingController();
  // myController=createFaturaListe?.result!.invoiceDate.toString() ?? "";

  
   InvoiceDetaylJsn? createFaturaListe;

 createFaturacheck() async {
    createFaturaListe = await invoiceDetailFunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    createFaturacheck();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            height: 97,
            width: double.infinity,
            decoration: const BoxDecoration(
                //color: Color.fromRGBO(243, 54, 2, 1),

                ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Cari Adı",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                //önceden eklenen carileri aramamızı sağlayan Container

                Expanded(
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        //color: Color.fromRGBO(243, 54, 2, 1),

                        ),
                    padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                    child: Align(
                        alignment: Alignment.center,
                        child: SearchTextBox(
                            hintText: createFaturaListe?.result!.invoiceDate.toString() ?? "",
                            valueList: kdvlist,
                            textControl: myController)),
                  ),
                ),
              ],
            )),
         
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 63,
              width: double.infinity,
              decoration: const BoxDecoration(
                  //color: Color.fromRGBO(243, 54, 2, 1),

                  ),
              child: const Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Belge No",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                     //Yeni fatura için belge numarası girilmesi sağlanan kısım
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: BelgeNo(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 63,
              width: double.infinity,
              decoration: const BoxDecoration(
                  //color: Color.fromRGBO(243, 54, 2, 1),

                  ),
              child: const Column(
                children: [
                 
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Tarih ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                   //yeni fatura için tarihin girildiği kısım
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TarihButton(),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 92,
            width: double.infinity,
            decoration: const BoxDecoration(
                //color: Color.fromRGBO(243, 54, 2, 1),

                ),
            child: const Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Açıklama",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                //yeni fatura için açıklama yapılan kısım
                Align(
                  alignment: Alignment.center,
                  child: aciklamaGelir(),
                ),
              ],
            )),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: 75,
          width: double.infinity,
          decoration: const BoxDecoration(
              //color: Color.fromRGBO(243, 54, 2, 1),

              ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Fatura Etiketi",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              //daha önceden eklenen etiketlerin yeni faturaya eklenmesi
              Align(alignment: Alignment.center, child: FaturaEtiketi()),
            ],
          ),
        ),
      ],
    );
  }
}

class WidgetEklenenUrunVeHizmet extends StatefulWidget {
  const WidgetEklenenUrunVeHizmet({super.key});

  @override
  State<WidgetEklenenUrunVeHizmet> createState() =>
      _WidgetEklenenUrunVeHizmetState();
}

class _WidgetEklenenUrunVeHizmetState extends State<WidgetEklenenUrunVeHizmet> {
  Future<void> _dialogBuilder() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Fatura Silinsin mi ?",
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
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              //padding: const EdgeInsets.all(8),
              itemCount: urunVeHizmetTest.length,
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
                          child: EklenenUrunVeHizmet(
                            basilk: urunVeHizmetTest[index][0].toString(),
                            miktar: urunVeHizmetTest[index][1].toString(),
                            birim: urunVeHizmetTest[index][2].toString(),
                            birimFiyat: urunVeHizmetTest[index][3].toString(),
                            totalFatura: urunVeHizmetTest[index][4].toString(),
                          )),
                    ));
              }),
        ),
      ],
    );
  }
}

class WidgetHizmetVeUrunler extends StatefulWidget {
  const WidgetHizmetVeUrunler({super.key});

  @override
  State<WidgetHizmetVeUrunler> createState() => _WidgetHizmetVeUrunlerState();
}

class _WidgetHizmetVeUrunlerState extends State<WidgetHizmetVeUrunler> {
  String? kontrol;
  String? kontrol2;
  final myController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
                //color: Color.fromRGBO(243, 54, 2, 1),

                ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 16, 2, 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Ürünler Ve Hizmetler",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                //daha önceden eklenen ürün ve hizmetlerin faturaya eklenmesi
                Expanded(
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        //color: Color.fromRGBO(243, 54, 2, 1),

                        ),
                    padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                    child: Align(
                        alignment: Alignment.center,
                        child: SearchTextBox(
                            hintText: "hintText",
                            valueList: kdvlist,
                            textControl: myController)),
                  ),
                ),
              ],
            )),
        Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: 63,
            width: double.infinity,
            decoration: const BoxDecoration(
                //color: Color.fromRGBO(243, 54, 2, 1),

                ),
            child: const Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Ürün/Hizmet Adı",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                //ürün/hizmet adının girilmesi
                Align(
                  alignment: Alignment.center,
                  child: CariAciklama(),
                ),
              ],
            )),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 63,
              width: double.infinity,
              decoration: const BoxDecoration(
                  //color: Color.fromRGBO(243, 54, 2, 1),

                  ),
              child: const Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Miktar",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  //ürün miktarının girilmesi
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: BelgeNo(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 63,
              width: double.infinity,
              decoration: const BoxDecoration(
                  //color: Color.fromRGBO(243, 54, 2, 1),

                  ),
              child: const Column(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Birim Fiyat ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  //ürünün birim fiyatının girilmesi
                  Align(
                    alignment: Alignment.bottomRight,
                    child: BelgeNo(),
                  ),
                ],
              ),
            ),
          ],
        ),
        //ürünün demirbaş olup olmadığının bildirilmesi
        Stack(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 145, 0),
                height: 57,
                width: 200,
                decoration: const BoxDecoration(
                    //color: Color.fromRGBO(243, 54, 2, 1),

                    ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RadioListTile(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        title: Text(
                          "Demirbaş",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        //demirbaşsa değişkeni seçmemizi sağlayan value
                        value: "degil",
                        groupValue: kontrol,
                        onChanged: (value) {
                          setState(() {
                            kontrol = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(180, 0, 10, 0),
                height: 63,
                width: 200,
                decoration: const BoxDecoration(
                    //color: Color.fromRGBO(243, 54, 2, 1),

                    ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: RadioListTile(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        title: Text(
                          "Demirbaş Değil",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                          //demirbaş değilse değişkeni seçmemizi sağlayan value
                        value: "demirbas",
                        groupValue: kontrol,
                        onChanged: (value) {
                          setState(() {
                            kontrol = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          height: 75,
          width: double.infinity,
          decoration: const BoxDecoration(
              //color: Color.fromRGBO(243, 54, 2, 1),

              ),
          child: const Column(
            children: [
              //daha önceden eklenen etiketlerin faturaya eklenmesi
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Ürün Etiketi",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Align(alignment: Alignment.center, child: FaturaEtiketi()),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(4, 0, 55, 0),
              height: 63,
              width: 85,
              decoration: const BoxDecoration(),
              child:  Column(
                children: [
                  Text(
                    "Vergi",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  //vergi durumunun girlimesi
                  SmallTextField(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 55, 0),
              height: 63,
              width: 70,
              decoration: const BoxDecoration(),
              child: const Column(
                children: [
                  Text(
                    "ÖTV",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  //ÖTV durumunun girilmesi
                  SmallTextField(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 63,
              width: 70,
              decoration: const BoxDecoration(),
              child: const Column(
                children: [
                  Text(
                    "ÖİV",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  //ÖİV durumun girilmesi
                  SmallTextField(),
                ],
              ),
            ),
          ],
        ),
        Stack(
          children: [
            //yüzdelik iskonto indiriminin girilmesi
            Container(
                child: CheckboxListTile(
              title: Text(
                "% Yüzdelik İskonto İndirimi",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              value: isChecked,
              //yüzdelik iskonto indirimine basıldığında indirim oranını girmemize yarayacak kutunun gelmesini sağlayan kontrol
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                  if (value == true) {
                    checkYuzde = true;
                  } else {
                    checkYuzde = false;
                  }
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            )),
                //yüzdelik iskonto indirimine basıldığında indirim oranını girmemize yarayacak kutunun gelmesini sağlar
            Visibility(
              visible: checkYuzde,
              child: Container(
                margin: const EdgeInsets.fromLTRB(270, 10, 0, 0),
                height: 40,
                width: 70,
                decoration: const BoxDecoration(),
                child: SmallTextField(),
              ),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 63,
            width: double.infinity,
            decoration: const BoxDecoration(
                //color: Color.fromRGBO(243, 54, 2, 1),

                ),
            child: const Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Ürüne / Hizmete Uygulanacak İskonto",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                //ürüne/hizmete uygulanacak iskontonun girilmesini sağlar
                Align(
                  alignment: Alignment.center,
                  child: CariAciklama(),
                ),
              ],
            )),
            //ürün /hizmet eklememizi sağlayan buton
        Container(
            margin: EdgeInsets.fromLTRB(190, 18, 7, 0),
            height: 60,
            width: 160,
            decoration: const BoxDecoration(),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: UrunEkleButton(),
            )),
      ],
    );
  }
}

//fatura etiketlerinin eklendiği Class
class FaturaEtiketi extends StatefulWidget {
  const FaturaEtiketi({super.key});

  @override
  State<FaturaEtiketi> createState() => _FaturaEtiketiState();
}

class _FaturaEtiketiState extends State<FaturaEtiketi> {
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        margin: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        height: 40,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            // DropDownMultiSelect comes from multiselect
            child: DropDownMultiSelect(
              onChanged: (List<String> x) {
                setState(() {
                  selected = x;
                });
              },
              options: [
                'Su',
                'İletişim',
                'İnternet',
                'Demirbaş',
                'Elektrik',
                'Isınma'
              ],
              selectedValues: selected,
              whenEmpty: 'Etiket Seçiniz',
            ),
          ),
        ));
  }
}
