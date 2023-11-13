import 'package:flutter/material.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';
import 'package:murekkapp/widgets/widgets_button.dart';

import '../const.dart';
import '../drawer_widget.dart';
import '../model/ticketJSClass.dart';
import '../widgets/widgetKartlarAyarlar.dart';
class EtiketHavuzu extends StatefulWidget {
  const EtiketHavuzu({super.key});

  @override
  State<EtiketHavuzu> createState() => _EtiketHavuzuState();
}

class _EtiketHavuzuState extends State<EtiketHavuzu> {

  

 

    TicketListJsn? etiketListe;

  ticketlistecheck() async {
    etiketListe = await ticketfunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ticketlistecheck();
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
            'Etiket Havuzu',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
        drawer: const Drawer(
          child: DrawerWidget(),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 730,
          width: double.infinity,
          decoration: BoxDecoration(color: anaEkranColor),
          child: Column(
            children: [
           //yeni etiket eklediğimiz kısım
              Container(
                  margin: const EdgeInsets.fromLTRB(4, 40, 4, 20),
                  padding: EdgeInsets.all(9),
                
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(53, 58, 64, 1),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Etiket Adı",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //etiket adıini girdiğimiz kısım
                      Container(
                        height: 85,
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        margin: EdgeInsets.only(top: 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: CariAciklama(),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(250, 7, 0, 0),
                          height: 40,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              //color: Color.fromRGBO(243, 54, 2, 1),

                              ),
                          child: const Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: KaydetButton(),
                              ),
                            ],
                          )),
                    ],
                  )),
                  Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Etiket Ara",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //eklenmiş etiketleri aradığımız kısım
                      Container(
                        height: 85,
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        margin: EdgeInsets.only(top: 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: SearchTextBox(hintText: "hintText", valueList: kdvlist, textControl: myController)
                        ),
                      ),
                    Expanded(
                    child:
       ListView.builder(
    itemCount: etiketListe?.result!.length,
    padding: const EdgeInsets.symmetric(vertical: 16),
    itemBuilder: (BuildContext context, index) {
      return Dismissible(
         background: Container(
            color: Colors.red,
            child: Icon(Icons.delete,color: Colors.white,),
          ),
        key: Key('item ${etiketListe?.result![index]}'),
        onDismissed: (DismissDirection direction) {
         
 
          setState(() {
            etiketListe?.result!.removeAt(index);
          });
        },
         child:KtaegoriAdiContainer(kategoriAdi: etiketListe?.result![index].ticketName.toString() ?? "",),
     
      );
    }
  ),
                
                  
                ),
              
            ],
          ),
        ));
  }
}

Widget etiketAdi() {
  return Container(
      height: 33,
      width: double.infinity,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Center(
        child: TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            hintText: "Etiket Adı",
          ),
        ),
      ));
}




