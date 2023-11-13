import 'package:flutter/material.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';
import 'package:murekkapp/widgets/widgetCreateGelirFaturasi.dart';
import 'package:murekkapp/widgets/widgetDrop.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../const.dart';

class kasaHareketleriGiris extends StatefulWidget {
  const kasaHareketleriGiris({super.key});

  @override
  State<kasaHareketleriGiris> createState() => _kasaHareketleriGirisState();
}

class _kasaHareketleriGirisState extends State<kasaHareketleriGiris> {
   final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return    Container(
              
                height: 850,
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
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "İşlem Türü",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            //işlem türünü belirttiğimiz kısım
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: islemTuruDropdown(
                                onTap: () {},
                              ),
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
                                "Miktar",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            //miktarı girdiğimiz kısım
                            Align(
                              alignment: Alignment.center,
                              child: CariAciklama(),
                            ),
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Cari Seçimi(İsteğe Bağlı)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    //eklenmiş carileri seçme kısmı
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
                                    "Tarih",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                //kasa tarihini girdiğimiz kısım
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: TarihButton()),
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
                                    "Haraket Türü",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                //hareket türünü girdiğimiz kısım
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: hareketTuruDropdown(
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),

                    //makbuz veya dekont (belge) eklediğimiz kısım
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Makbuz Veya Dekont",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 410,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(53, 58, 64, 1),
                        ),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          child: WidgetFilePicker(),
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
                            //kasa hareketini kaydettiğimiz buton
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
                            //kasa hareketini kaydetmekten vazgeçtiğimiz vazgeç butonu
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
                  ],
                ),
              );
  }
}

