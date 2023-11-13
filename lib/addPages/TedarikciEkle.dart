import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/addPages/saglananHizmet.dart';
import 'package:murekkapp/pages/musteriler.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/pages/tedarikciler.dart';
import 'package:murekkapp/widgets/widgetDrop.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../const.dart';
import '../model/currentsProductJSClass.dart';
import '../model/invoiceDetailJSClass.dart';
import '../widgets/widgetKartlarAyarlar.dart';

class TedarikciEkle extends StatefulWidget {
  const TedarikciEkle({super.key});

  @override
  State<TedarikciEkle> createState() => _TedarikciEkleState();
}

class _TedarikciEkleState extends State<TedarikciEkle> {
  CurrentProductListJsn? carilerUrunlerListe;

  carilerUrunlerlistecheck() async {
    carilerUrunlerListe = await currentsProductFunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    carilerUrunlerlistecheck();
  }

  final myController = TextEditingController();
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
            //geri ok a bastığımızda müşteriye mi yoksa tedarikçiye gideceğini ayıran kod
            onPressed: () {
              if (musteriCheck == 1) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Musteriler()));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Tedarikciler()));
              }
            },
          ),
          centerTitle: true,
          title: Text(
            TMBaslik,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 850,
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
                        "Firma/Şahıs Adı",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),

                  //firma/şahıs adını seçtiğimiz kısım
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
                              "T.C Kimlik No/Vergi/Kimlik No",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //T.C. kimlik numarasını girdiğimiz kısım
                          Align(
                            alignment: Alignment.center,
                            child: CariAciklama(),
                          ),
                        ],
                      )),
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
                              "Vergi Dairesi",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //vergi dairesini girdiğimiz kısım
                          Align(
                            alignment: Alignment.center,
                            child: CariAciklama(),
                          ),
                        ],
                      )),
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
                              "Email",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //email i girdiğimiz kısım
                          Align(
                            alignment: Alignment.center,
                            child: CariAciklama(),
                          ),
                        ],
                      )),
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
                              "Telefon",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //telefon numarasaının girdiğimiz kısım
                          Align(
                            alignment: Alignment.center,
                            child: CariAciklama(),
                          ),
                        ],
                      )),
                  //müşetirinin yada firmanın il ve ilçesini girdiğimiz kısım
                  Stack(
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 145, 10),
                          height: 63,
                          width: 200,
                          decoration: const BoxDecoration(
                              //color: Color.fromRGBO(243, 54, 2, 1),

                              ),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "İl",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: IlVeilce(
                                  onTap: () {},
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
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "İlçe",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: IlVeilce(
                                  onTap: () {},
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),

                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 120,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                      child: const Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Adres",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //açık adresi girdiğimiz kısım
                          Align(
                            alignment: Alignment.center,
                            child: Address(),
                          ),
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 120,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Cari Tipi",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          // cari tipini girdiğimiz kısım
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CariTipiDw(
                              onTap: () {},
                            ),
                          ),
                        ],
                      )),

                  Stack(
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 150, 0),
                          height: 63,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              //color: Color.fromRGBO(243, 54, 2, 1),

                              ),
                          //müşteriyi kaydetmemizi sağlayan buton
                          child: const Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: KaydetButton(),
                              ),
                            ],
                          )),
                      Container(
                          margin: const EdgeInsets.fromLTRB(150, 0, 10, 0),
                          height: 63,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              //color: Color.fromRGBO(243, 54, 2, 1),

                              ),
                          //müşteri kaydetmekten vazgeçmemizi sağlayan kod
                          child: const Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: VazgecButton(),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      height: 63,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                      //müşteri kaydetmekten vazgeçmemizi sağlayan kod
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child:   InkWell(
                               onTap: () {
                                  Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const saglananHizmet()));
                               },
      child: Container(
        padding: const EdgeInsets.all(2),

        height: 60,
        width: 185,

        //height: 40,
        //width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.red),
        child: Text(
          saglananhizmet,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: girisFontColor,
            //fontWeight: FontWeight.bold
          ),
        ),
      ),
    ),
                          ),
                        ],
                      )),
                  //müşterinin/tedarikçinin sağladığı ürün ve hizmetleri girdiğimiz kısım
                ],
              ),
            ),
            
            
          ],
        )));
  }
}

class tedarikciButton extends StatefulWidget {
  const tedarikciButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<tedarikciButton> createState() => _tedarikciButtonState();
}

class _tedarikciButtonState extends State<tedarikciButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(2),

        height: 60,
        width: 185,

        //height: 40,
        //width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.red),
        child: Text(
          saglananhizmet,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: girisFontColor,
            //fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

class saglananHizmetButton extends StatefulWidget {
  const saglananHizmetButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<saglananHizmetButton> createState() => _saglananHizmetButtonState();
}

class _saglananHizmetButtonState extends State<saglananHizmetButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 192, 70, 9)),
      child: ElevatedButton.icon(
        onPressed: () {
          widget.onTap;
        },
        icon: Icon(
          // <-- Icon
          Icons.download,
          size: 24.0,
        ),
        label: Text('Download'), // <-- Text
      ),
    );
  }
}
