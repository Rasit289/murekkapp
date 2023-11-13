import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/addPages/TedarikciEkle.dart';
import 'package:murekkapp/addPages/addMusteri.dart';

import '../const.dart';
import '../drawer_widget.dart';
import '../model/currentsProductJSClass.dart';
import '../widgets/widgetKartlarAyarlar.dart';

class saglananHizmet extends StatefulWidget {
  const saglananHizmet({super.key});

  @override
  State<saglananHizmet> createState() => _saglananHizmetState();
}

class _saglananHizmetState extends State<saglananHizmet> {
   final myController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        backgroundColor: anaEkranColor,
         appBar: AppBar(
          backgroundColor: anaEkranColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            //geri ok butonuna basatığımızda tekrar kasa ve bankalara döndüğümüz kısım
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TedarikciEkle()));
            },
          ),
          
        
        ),
       
        body: Container(
          
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 665,
          width: double.infinity,
          
          child: Column(
            children: [
            
             Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                 saglananhizmet,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            //müşteri/tedarikçinin sağladığı hizmet ve ürünlerin gösterildiği alan
            Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 4),
                height: 375,
                width: double.infinity,
                decoration: BoxDecoration(color: anaEkranColor),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,

                          //padding: const EdgeInsets.all(8),
                          itemCount:  carilerUrunlerListe?.result!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                            
                              width: double.infinity,
                              child: Center(

                                   child:Slidable(
                              key: const ValueKey(0),
                                    startActionPane: ActionPane(
                          
                                      motion: const ScrollMotion(),
                                      dismissible:
                                          DismissiblePane(onDismissed: () {}),

                                      children: const [
                                    
                                        SlidableAction(
                                          onPressed: null,
                                          backgroundColor: Color(0xFFFE4A49),
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'sil',
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
                                  child: TedarikciContainer(
                                      urunAdi:
                                          carilerUrunlerListe?.result![index].productName?? "",
                                           miktarTedarikci:
                                          carilerUrunlerListe?.result![index].productCode.toString()?? "",
                                      urunKoduMusteri:
                                         carilerUrunlerListe?.result![index].productAmount.toString()?? "",
                                      kdvMiktari:
                                      carilerUrunlerListe?.result![index].taxCode.toString()?? "",
                                      satisFiyati:
                                        carilerUrunlerListe?.result![index].buyingPrice.toString()?? "",)),)
                            );
                          }),
                    ),
                  ],
                )),
               
        
            ],
          ),
        ));
  }
}

