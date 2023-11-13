import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/widgets/widgetGelirFaturasi.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../const.dart';
import '../drawer_widget.dart';
import '../model/personelJSClass.dart';
import '../widgets/widgetKartlarAyarlar.dart';

class PersonelEkle extends StatefulWidget {
  const PersonelEkle({super.key});

  @override
  State<PersonelEkle> createState() => _PersonelEkleState();
}

class _PersonelEkleState extends State<PersonelEkle> {

    PersonelListJsn? peronelListe;

  personlistecheck() async {
    peronelListe = await personFunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    personlistecheck();
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
    final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: anaEkranColor,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Text(
            'Personel Ekle',
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
            //personel eklediğimiz kısım
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(53, 58, 64, 1),
              ),
              child: Column(
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
                              "Ad Soyad",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //personel ad ve soyadını girdiğimiz kısım
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
                              "T.C Kimlik No",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //T.C. kimlik numrasını girdiğimiz alan
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
                          //email girdiğimiz alan
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
                          //personel telefon numarasını girdiğimiz kısım
                          Align(
                            alignment: Alignment.center,
                            child: CariAciklama(),
                          ),
                        ],
                      )),
              Container(
          margin: const EdgeInsets.fromLTRB(7, 0, 7, 5),
          height: 75,
          width: double.infinity,
          decoration: const BoxDecoration(
              //color: Color.fromRGBO(243, 54, 2, 1),

              ),
          child:  Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: 10),
                child:    Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Görev",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
              ),

              
             
              
           
            //personel görevini girdiğimiz kısım
              Align(
                alignment: Alignment.center,
                child: FaturaEtiketi()
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
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Şifre",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          //personel için şifre girdiğimiz kısım
                          Align(
                            alignment: Alignment.center,
                            child: CariAciklama(),
                          ),
                        ],
                      )),

                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          height: 63,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              //color: Color.fromRGBO(243, 54, 2, 1),

                              ),
                              //personel eklediğimiz kısım
                          child:  Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: personelEkleButton(),
                              ),
                            ],
                          )),
                 
               
          
                ],
              ),
            ),
            //aktif personel listesini gösterdiğimiz alan
            Container(
              margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Aktif Personel Listesi",
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
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child:    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Personel Ara",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),

                       //personel aradığımız kısım
                      Container(
                        height: 70,
                        padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                        margin: EdgeInsets.only(top: 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: SearchTextBox(hintText: "hintText", valueList: kdvlist, textControl: myController)
                        ),
                      ),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 4),
                height: 375,
                width: double.infinity,
                decoration: BoxDecoration(color: anaEkranColor),
                child:Expanded(
                  child:
                 Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,

                          //padding: const EdgeInsets.all(8),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                             
                              width: double.infinity,
                              child: Center(

                                   child:Slidable(
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
                                    endActionPane: const ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: null,
                                          backgroundColor: Color(0xFF0392CF),
                                          foregroundColor: Colors.white,
                                          icon: Icons.settings,
                                          label: 'Düzenle',
                                        ),
                                      ],
                                    ),
                                    // tedarikciTest[index][0].toString(),
                                  child:Personeller(adSoyad:   peronelListe?.result![0].nameSurname.toString() ?? "",
                                   telefonPersonel: peronelListe?.result![0].phone.toString() ?? "",
                                    eMailPersonel: peronelListe?.result![0].email.toString() ?? "",
                                     gorev: peronelListe?.result![0].duty.toString() ?? "",
                                      TCno: peronelListe?.result![0].tcno.toString() ?? "",)),)
                            );
                          }),
                    ),
                  ],
                ))),
          ],
        )));
  }
}

