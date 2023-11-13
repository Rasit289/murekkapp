import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murekkapp/pages/hizmetveUrunler.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/widgets/widgetDrop.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../const.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class YeniHizmet extends StatefulWidget {
  const YeniHizmet({super.key});

  @override
  State<YeniHizmet> createState() => _YeniHizmetState();
}

class _YeniHizmetState extends State<YeniHizmet> {
  final myController = TextEditingController();
  String? kontrol="dahil";
  String? kontrol3="demirbas";
   String? kontrol2="yapilmasin";
  var getResult = 'QR Code Result';
//barko okuma kısmının yapıldığı kod
  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: anaEkranColor,
                      leading:  IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        
              Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HizmetVeUrunler()));

     
      
      
        
      },
    ),
          centerTitle: true,
          title: const Text(
            'Yeni Ürün /Hizmet Ekleme',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
      
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 780,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(53, 58, 64, 1),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Tedarikçi Seçimi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              //eklenmişs tedarikçileri aradığımız ve seçtiğimiz kısım

              Container(
                height: 70,
                padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                margin: EdgeInsets.only(top: 0),
                child: Align(
                    alignment: Alignment.center,
                    child: SearchTextBox(
                        hintText: "hintText",
                        valueList: kdvlist,
                        textControl: myController)),
              ),

              //Text(getResult),
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 63,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Ürün/Hizmet Adı",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          
                          ),
                        ),
                      ),
                      //ürün/hizmet adını girdiğimiz kısım
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: hizmetAdiDropDown(),
                      ),
                    ],
                  )),

              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 145, 5),
                    height: 63,
                    width: 200,
                    decoration: const BoxDecoration(
                        //color: Color.fromRGBO(243, 54, 2, 1),

                        ),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Ürün/Hizmet kodu",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        //ürün hizmet kodunu girdiğimiz kısım
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CariAciklama(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(210, 15, 10, 0),
                      height: 50,
                      width: 200,
                      decoration: const BoxDecoration(
                      

                          ),
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(

                                    
                              
                            ))),
                            //barkod okuduğumuz kısım
                            onPressed: () {
                              scanQRCode();
                            },
                            child: Text('Barkod Oku'),
                          ),
                        ],
                      )),
                ],
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
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Alış Fiyatı",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //alış fiyatını girdiğimiz kısım
                      Align(
                        alignment: Alignment.center,
                        child: hizmetNumericField(),
                      ),
                    ],
                  )),

              
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
                                "KDV Dahil",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                              value: "haric",
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
                                "KDV Hariç",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                              value: "dahil",
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
                          "Birim Satış Fiyatı",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //satış fiyatını girdiğimiz kısım
                      Align(
                        alignment: Alignment.center,
                        child: hizmetNumericField(),
                      ),
                    ],
                  )),
          
              Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 12, 240, 4),
                      height: 63,
                      width: 200,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                      child: Column(
                        children: [
                          const Align(
                            child: Text(
                              "Vergi Kodu",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //vergi kodunu girdiğimiz kısım
                          Align(
                            child: CariAdiButton(
                              onTap: () {},
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(120, 12, 0, 4),
                      height: 63,
                      width: 200,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                      child: Column(
                        children: [
                          const Align(
                            child: Text(
                              "Birim",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //ürün birimini girdiğimiz kısım
                          Align(
                            child: vergiKoduDropdown(
                              onTap: () {},
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(295, 12, 0, 0),
                      height: 63,
                      width: 200,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                      child: Column(
                        children: [
                          const Align(
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
                          //ürün miktarını girdiğimiz kısım
                          Align(
                            child: AlisFiyatiHizmet(),
                          ),
                        ],
                      )),
                ],
              ),

               Stack(
                children: [
                   Container(
                      margin: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                      height: 78,
                      width: 200,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                      child: Column(
                        children: [
                          const Align(
                            child: Text(
                              "Demirbaş",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //ürün miktarını girdiğimiz kısım
                          Align(
                            child: CheckboxExample(),
                          ),
                        ],
                      )),

                
                  Container(
                      margin: const EdgeInsets.fromLTRB(170, 12, 0, 4),
                      height: 78,
                      width: 200,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                      child: Column(
                        children: [
                          const Align(
                            child: Text(
                              "Stok Takibi Yapılsın",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //ürün birimini girdiğimiz kısım
                          Align(
                            child: stokTakibiChechkBox(
                            
                            ),
                          ),
                        ],
                      )),
              
                ],
              ),

              
             

              Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 150, 0),
                      height: 63,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                          //ürünü kaydettiğimiz buton
                      child: const Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: KaydetButton(),
                          ),
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(150, 10, 10, 0),
                      height: 63,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                          //ürünü kaydetmekten vazgeçtiğimiz vazgeç butonu
                      child: const Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: VazgecButton(),
                          ),
                        ],
                      )),
                ],
              )
            ],
          ),
        )));
  }
}
