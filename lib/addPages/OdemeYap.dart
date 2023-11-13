import 'package:flutter/material.dart';
import 'package:murekkapp/widgets/widgetDrop.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';
import 'package:murekkapp/widgets/widgets_button.dart';
import '../const.dart';
import 'package:murekkapp/pages/gelirFaturalari.dart';
import 'package:murekkapp/pages/giderFatura.dart';

class OdemeYap extends StatefulWidget {
  const OdemeYap({super.key});

  @override
  State<OdemeYap> createState() => _OdemeYapState();
}

class _OdemeYapState extends State<OdemeYap> {
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
      //geri ok butonuna bastığımızda gelir faturalarına mı yoksa gider faturalarına mı gideceğini ayırdığımız kısım
      onPressed: () {
        if(kontrolOdeme==1){
              Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const gelirFaturalari()));

        }
        else{
              Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const giderFatura()));

        }
      
        
      },
    ),
          centerTitle: true,
          title:  Text(
            odemeYapBaslik,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
        
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 730,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(53, 58, 64, 1),
          ),
          child: Column(
            children: [

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
                          "Firma/Şahıs Adı",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //firma/şahıs adının girildiği alan
                      Align(
                        alignment: Alignment.center,
                        child: CariAciklama(),
                      ),
                    ],
                  )),
            
              Container(
                 margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                      //belge numarasının girildiği alan
                      Align(
                        alignment: Alignment.center,
                        child: CariAciklama(),
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                          "Kalan Tutar",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //kalan tutarının girildiği kısm
                      Align(
                        alignment: Alignment.center,
                        child: CariAciklama(),
                      ),
                    ],
                  )),
              Container(
               margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                          "Belge Tarih",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //belge tarihini girdiğimiz kısım
                      Align(
                        alignment: Alignment.center,
                        child: CariAciklama(),
                      ),
                    ],
                  )),

                    Container(
                   margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                          "Hareket Türü",
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
                        alignment: Alignment.bottomCenter,
                        child: odemeHareketTuru(
                          onTap: () {},
                          
                        ),
                      ),
                    ],
                  )),

                    Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                          "Kasalar",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            
                          ),
                        ),
                      ),
                      //kasa türünü seçtiğimiz kısım
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: kasalarDropdown(
                          onTap: () {},
                        ),
                      ),
                    ],
                  )),

                      Container(
                 margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  height: 63,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(243, 54, 2, 1),

                      ),
                  child:  Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          OdemeYapGiris,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      //ödeme/tahsil edilecek tutarını girildiği kısım
                      Align(
                        alignment: Alignment.center,
                        child: CariAciklama(),
                      ),
                    ],
                  )),

                    const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Kalan Tutar \n  0,00 ₺",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),


           
             
           
            
             
          
              Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 30, 150, 0),
                      height: 63,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          //color: Color.fromRGBO(243, 54, 2, 1),

                          ),
                          //tahsilat ve ödeme yaptığımız kısım
                      child: const Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: OdemeYapButton(),
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
                          //tahsilat ve ödeme yapmaktan vazgeçtiğimiz kısım
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

class OdemeYapButton extends StatefulWidget {
  const OdemeYapButton({super.key});

  @override
  State<OdemeYapButton> createState() => _OdemeYapButtonState();
}

class _OdemeYapButtonState extends State<OdemeYapButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 0.8,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: null,
          child: Container(
            padding: const EdgeInsets.all(5),

            height: 40,
            width: 120,

            //height: 40,
            //width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Color.fromARGB(255, 14, 193, 17)),
            child:  Text(
              odemeYapButtonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}



