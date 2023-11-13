import 'package:flutter/material.dart';


class widgetKasaVeBankalar extends StatefulWidget {
  const widgetKasaVeBankalar({
    Key? key,
    required this.hesapTuru,
    required this.dovizCinsi,
    required this.hesapIsmi,
    required this.bakiye,
  }) : super(key: key);

  final String hesapTuru;
  final String dovizCinsi;
  final String hesapIsmi;
  final String bakiye;

  @override
  State<widgetKasaVeBankalar> createState() => _widgetKasaVeBankalarState();
}

class _widgetKasaVeBankalarState extends State<widgetKasaVeBankalar> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 0, 18, 7),
       padding: EdgeInsets.all(7),
    
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
     
     child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
              Text(
                        "Hesap Türü:  "+  widget.hesapTuru,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white

                            //color: Colors.white,
                            //fontWeight: FontWeight.bold
                            ),
                      ),
                       Text(
                        "Döviz Cinsi:  "+ widget.dovizCinsi,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                         fontSize: 16,
                            color: Colors.white

                            //color: Colors.white,
                            //fontWeight: FontWeight.bold
                            ),
                      ),
                      Text(
                        "Hesap ismi : "+widget.hesapIsmi,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                           fontSize: 16,
                            color: Colors.white

                            //color: Colors.white,
                            //fontWeight: FontWeight.bold
                            ),
                      ),

                      Text(
                        "Bakiye:  "+ widget.bakiye,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                        fontSize: 16,
                            color: Colors.white

                            //color: Colors.white,
                            //fontWeight: FontWeight.bold
                            ),
                      ),


        
        ],
      ),
     
    );
  }
}

class ParaIslemleriContainer extends StatefulWidget {
  const ParaIslemleriContainer({
    Key? key,
    required this.islemT,
    required this.miktarFatura,
    required this.tarihTahsilat,
    required this.bilgi,
  }) : super(key: key);

  final String miktarFatura;
  final String tarihTahsilat;
  final String bilgi;
  final String islemT;

  @override
  State<ParaIslemleriContainer> createState() => _ParaIslemleriContainerState();
}

class _ParaIslemleriContainerState extends State<ParaIslemleriContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(18, 9, 18, 5),
          padding: EdgeInsets.all(5),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(53, 58, 64, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
             "İşlem Türü: "+ widget.islemT,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
        
            Stack(
              children: [
                 Align(
              alignment: Alignment.bottomLeft,
                child:  Text(
              "Miktar:  ",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 227, 224, 224),
                //fontWeight: FontWeight.bold
              ),
            ),
            ),
            Container(
               margin: const EdgeInsets.fromLTRB(65, 0, 0, 0),
               child:    Text(
            widget.miktarFatura,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                color: Colors.green,
                //fontWeight: FontWeight.bold
              ),
            ) ,
            ),
         
             
         
              
          

              ],
            ),
            Text(
              "Tarih:"+widget.tarihTahsilat,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Bilgi:  "+widget.bilgi,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17, color: Colors.white

                    //fontWeight: FontWeight.bold
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParaIslemleriGiderContainer extends StatefulWidget {
  const ParaIslemleriGiderContainer({
    Key? key,
    required this.islemT,
    required this.miktarFatura,
    required this.tarihTahsilat,
    required this.bilgi,
  }) : super(key: key);

  final String miktarFatura;
  final String tarihTahsilat;
  final String bilgi;
  final String islemT;

  @override
  State<ParaIslemleriGiderContainer> createState() =>
      _ParaIslemleriGiderContainerState();
}

class _ParaIslemleriGiderContainerState
    extends State<ParaIslemleriGiderContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(18, 9, 18, 5),
          padding: EdgeInsets.all(5),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(53, 58, 64, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "İşlem Türü:  "+widget.islemT,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
             Stack(
              children: [
                 Align(
              alignment: Alignment.bottomLeft,
                child:  Text(
              "Miktar:  ",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 227, 224, 224),
                //fontWeight: FontWeight.bold
              ),
            ),
            ),
            Container(
               margin: const EdgeInsets.fromLTRB(65, 0, 0, 0),
               child:    Text(
             widget.miktarFatura,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                color: Colors.red,
                //fontWeight: FontWeight.bold
              ),
            ) ,
            ),
  

              ],
            ),
            Text(
              "Tarih:  "+widget.tarihTahsilat,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Bilgi:  "+widget.bilgi,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17, color: Colors.white

                    //fontWeight: FontWeight.bold
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

