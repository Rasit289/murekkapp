import 'dart:io';

import 'package:flutter/material.dart';
import 'package:murekkapp/pages/giderFatura.dart';
import 'package:murekkapp/widgets/widgetDrop.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import 'package:open_file/open_file.dart';
import '../const.dart';
import 'package:murekkapp/pages/gelirFaturalari.dart';
import 'package:murekkapp/widgets/widgetGelirFaturasi.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../model/invoiceDetailJSClass.dart';
import '../widgets/widgetCreateGelirFaturasi.dart';

// ignore: non_constant_identifier_names
Future<File> SaveFilePermanently(PlatformFile file) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final newFile = File("${appStorage.path}/${file.name}");

  return File(file.path!).copy(newFile.path);
}

class GelirFaturasi extends StatefulWidget {
  const GelirFaturasi({super.key});

  @override
  State<GelirFaturasi> createState() => _GelirFaturasiState();
}

class _GelirFaturasiState extends State<GelirFaturasi> {
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anaEkranColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          //geri ok butonunu gelir fatturalarından basımılmışsa gelir faturalarına
          //gider faturalarından basılmışsa gider faturalarına gönderen kod
          onPressed: () {
            if (faturaCheck == 1) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const gelirFaturalari()));
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const giderFatura()));
            }
          },
          
        ),
        centerTitle: true,
        title: Text(
          gelirGiderFaturaBaslik,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: anaEkranColor,
      //SingleChildScrollView ile ekranın aşağı doğru kaydırılmasını sağlıyoruz.
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              height: 63,
              width: double.infinity,
              decoration: const BoxDecoration(
                  //color: Color.fromRGBO(243, 54, 2, 1),

                  ),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Yeni faturaların eklenmesi ve var olan faturaların düzeltilmesi",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            //yeni faturalar eklememizi sağlayan Container
            Container(
              margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
              height: 385,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(53, 58, 64, 1),
              ),
              child: const WidgetGelirFaturasi(),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Hizmet Ve Ürünler",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            //hizmet ve ürünlerin eklendiği kısım
            Container(
              margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
              height: 710,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(53, 58, 64, 1),
              ),
              child: const WidgetHizmetVeUrunler(),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Eklenen Ürün ve Hizmetler",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            //daha önceden eklenen ürün ve hzimetlerin bulunduğu kısım
            Container(
             margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(70, 78, 87, 1),
              ),
              child: const WidgetEklenenUrunVeHizmet(),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Diğer Bilgiler",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            //fatura için belge eklememizi sağlayan Container
            Container(
                height: 410,
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(13, 30, 13, 0),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(53, 58, 64, 1),
                ),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: WidgetFilePicker(),
                )),
                //Ara toplamın girildiği kısım
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Ara Toplam   0,00 ₺",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
           
            Container(
                margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                height: 70,
                width: double.infinity,
                decoration: const BoxDecoration(
                    //color: Color.fromRGBO(243, 54, 2, 1),

                    ),
                child: const Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Fatura Toplamına İskonto",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                     //Fatura Toplamına yapılan İskontoyu girdiğimiz kısım
                    Align(
                      alignment: Alignment.center,
                      child: CariAciklama(),
                    ),
                  ],
                )),
                //iskonto uygulamayı sağlayan buton
            Container(
                margin: const EdgeInsets.fromLTRB(13, 10, 13, 0),
                height: 60,
                width: 220,
                decoration: const BoxDecoration(),
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: IndirimUygulaButton(),
                )),
            Stack(
              children: [
                Container(
                margin: const EdgeInsets.fromLTRB(13, 3, 13, 0),
                  height: 36,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(243, 54, 2, 1),

                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  // Fatura Toplamına  İskonto yapılan yer
                  child: const Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Fatura Toplamına  İskonto ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                        // Fatura Toplamına  İskonto yapılan yerin yazdırılması
                  child: const Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "0,00 ₺",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
             
            Stack(
              children: [
                Container(
                 margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                  height: 36,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(243, 54, 2, 1),

                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: const Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "KDV ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 // KDV nin yazdırıldığı yer
                Container(
                 margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: const Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "0,00 ₺",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                  height: 36,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(243, 54, 2, 1),

                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: const Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Tevkifat ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: const Column(
                    children: [
                      //tevkifat ın yazdırıldığı yer 
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "0,00 ₺",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(13, 10, 13, 10),
                height: 63,
                width: double.infinity,
                decoration: const BoxDecoration(
                    //color: Color.fromRGBO(243, 54, 2, 1),

                    ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Tevkifat Türü",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    //tevkifat türünün girildiği kısım
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: tevkifatDropdown(
                        onTap: () {},
                      ),
                    ),
                  ],
                )),
                //fatura toplamının yapıldığı yer
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Fatura Toplamı  0,00 ₺",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
            //faturayı kaydettiğimiz buton
            Container(
                margin: const EdgeInsets.fromLTRB(13, 10, 13, 0),
                height: 60,
                width: 220,
                decoration: const BoxDecoration(),
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: FaturayiKaydet(),
                ))
          ],
        ),
      ),
    );
  }
}
