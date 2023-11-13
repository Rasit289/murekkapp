import 'package:flutter/material.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../const.dart';
import '../drawer_widget.dart';



class MusteriEkle extends StatefulWidget {
  const MusteriEkle({super.key});

  @override
  State<MusteriEkle> createState() => _MusteriEkleState();
}

class _MusteriEkleState extends State<MusteriEkle> {
   final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: anaEkranColor,
          centerTitle: true,
          title:  Text(
           carilerBaslik,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
        drawer: const Drawer(
          child: DrawerWidget(),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 665,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(53, 58, 64, 1),
          ),
          child: Column(
            children: [
            
                        Container(
                        padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
                      child:    Align(
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
                          "T.C Kimlik No/Vergi Kimlik No",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
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
                      Align(
                        alignment: Alignment.center,
                        child: CariAciklama(),
                      ),
                    ],
                  )),
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
                         const  Align(
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
                      Align(
                        alignment: Alignment.center,
                        child: Address(),
                      ),
                    ],
                  )),
          
              Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 30, 150, 0),
                      height: 63,
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
                  Container(
                      margin: const EdgeInsets.fromLTRB(150, 30, 10, 0),
                      height: 63,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
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
        ));
  }
}
