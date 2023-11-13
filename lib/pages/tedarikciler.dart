import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/addPages/TedarikciEkle.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../const.dart';
import '../drawer_widget.dart';
import 'package:murekkapp/simplaListData.dart';

import '../model/currentsJSClass.dart';
import '../widgets/widgetKartlarMusteri.dart';

class Tedarikciler extends StatefulWidget {
  const Tedarikciler({super.key});

  @override
  State<Tedarikciler> createState() => _TedarikcilerState();
}

class _TedarikcilerState extends State<Tedarikciler> {

   CurrentsListJsn? carilerListe;

 carilerlistecheck() async {
    carilerListe = await currentfunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    carilerlistecheck();
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
   bool kontrol = true;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: anaEkranColor,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Text(
            'Tedarikçiler',
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
                Container(
                    margin: const EdgeInsets.fromLTRB(25, 2, 25, 0),
                    height: 90,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(57, 56, 72, 1),
                      image: DecorationImage(
                        alignment: Alignment.topRight,
                        //image: AssetImage('images/tum_varliklarim.jpg'),
                         image: AssetImage('images/toplamMusteri.jpg'),
                        scale: 3,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Toplam Tedarikçi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: guncelDurumTitleColor,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        //toplam tedarikçi sayısını gösteren text
                        const Text(
                          "3",
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
                    margin: const EdgeInsets.fromLTRB(25, 9, 25, 20),
                    height: 100,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(57, 56, 72, 1),
                      image: DecorationImage(
                        alignment: Alignment.topRight,
                          image: AssetImage('images/yapilacak_tahsilat.jpg'),
                        scale: 3,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "30 Gün İçerisinde \n Yapılacak Ödemeler",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: guncelDurumTitleColor,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        //30 Gün İçerisinde  Yapılacak Ödemelerin yazıldığı kısım
                         Text(
                          carilerListe?.result!.collectionInMonth.toString() ?? "",
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
                      child:    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Tedarikçi Ara",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),

                       //daha önceden eklenen tedarikçilerin arandığı kısım
                      Container(
                        height: 70,
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
                        margin: EdgeInsets.only(top: 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: SearchTextBox(hintText: "hintText", valueList: kdvlist, textControl: myController)
                        ),
                      ),
                Expanded(
                    child: Swiper.children(
                                    control:SwiperControl(
                       
                        iconPrevious: Icons.arrow_back_ios,
                        iconNext: Icons.arrow_forward_ios,
                        
                color: Colors.white,
             
                      ),children: [
                  ListView.builder(
                      shrinkWrap: true,

                      //padding: const EdgeInsets.all(8),
                      itemCount: 3,
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
                                    "Tüm Tedarikçiler",
                                    textAlign: TextAlign.end,
                                    style:  TextStyle(
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
                                    
                                //child: Center(child: Text('Entry ${entries[index]}')),
                                child:  MusteriAlacakli(firmaAd: carilerListe?.result!.currentList?[index-1].currentName ?? "",
                                 musteriNumber:carilerListe?.result!.currentList?[index-1].currentPhone ?? "",
                                 musteriEposta: carilerListe?.result!.currentList?[index-1].currentEmail ?? "",
                                  musterilerDurum: borcuOlanMusteriTest[index][3].toString(),
                                   musteriBakiye: carilerListe?.result!.currentList?[index-1].currentBalanceDue.toString() ?? "",)),)
                          );
                        }
                        if (index == 2) {
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
                                //child: Center(child: Text('Entry ${entries[index]}')),
                                child: musteriAlacaksiz(firmaAd: carilerListe?.result!.currentList?[index-1].currentName ?? "",
                                 musteriNumber:carilerListe?.result!.currentList?[index-1].currentPhone ?? "",
                                 musteriEposta: carilerListe?.result!.currentList?[index-1].currentEmail ?? "",
                                  musterilerDurum: borcuOlmayanMusteriTest[index][3].toString(),
                                   musteriBakiye: carilerListe?.result!.currentList?[index-1].currentBalanceDue.toString() ?? "",)),)
                          );
                        }

                        return null;
                     
                   
                      }),
                  ListView.builder(
                      shrinkWrap: true,
                      //padding: const EdgeInsets.all(8),
                      itemCount: 3,
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
                                    "Alacağı Olan Tedarikçiler",
                                    textAlign: TextAlign.end,
                                    style:  TextStyle(
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
                              //child: Center(child: Text('Entry ${entries[index]}')),
                              child:  MusteriAlacakli(firmaAd: carilerListe?.result!.currentList?[index-1].currentName ?? "",
                                 musteriNumber:carilerListe?.result!.currentList?[index-1].currentPhone ?? "",
                                 musteriEposta: carilerListe?.result!.currentList?[index-1].currentEmail ?? "",
                                  musterilerDurum: borcuOlanMusteriTest[index][3].toString(),
                                   musteriBakiye: carilerListe?.result!.currentList?[index-1].currentBalanceDue.toString() ?? "",)),)
                        );
                      }),
                  ListView.builder(
                      shrinkWrap: true,

                      //padding: const EdgeInsets.all(8),
                      itemCount: 3,
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
                                    "Alacağı Olmayan Tedarikçiler",
                                    textAlign: TextAlign.end,
                                    style:  TextStyle(
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
                              //child: Center(child: Text('Entry ${entries[index]}')),
                              child: musteriAlacaksiz(firmaAd: carilerListe?.result!.currentList?[index-1].currentName ?? "",
                                 musteriNumber:carilerListe?.result!.currentList?[index-1].currentPhone ?? "",
                                 musteriEposta: carilerListe?.result!.currentList?[index-1].currentEmail ?? "",
                                  musterilerDurum: borcuOlmayanMusteriTest[index][3].toString(),
                                   musteriBakiye: carilerListe?.result!.currentList?[index-1].currentBalanceDue.toString() ?? "",)),)
                        );
                      }),
              
                ])),
                //tedarikçi eklediğimiz kısım
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                  // height: 63,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: AddButton(
                        onTap: () {
                            //müşteri ile tedarikçiyi ayırdığımız ve
                          //müşteri ile tedarikçiye özel text leri ayarladığımız kısım
                           musteriCheck=2;
                            cariDeger="Tedarikçi";
                       TMBaslik="Tedarikçi Ekle";
                          saglananHizmetler="Tedarikçinin Sağladığı Ürün/Hizmet Ekle";
                          saglananhizmet ="Tedarikçinin Sağladığı \n Ürün Ve Hizmetler";
                        Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TedarikciEkle()));
                        },
                      )),
                ),
              ],
            )));
  }
  }

