import 'package:flutter/material.dart';

import '../const.dart';


class MusteriAlacakli extends StatefulWidget {
  const MusteriAlacakli({
    Key? key,
    required this.firmaAd,
      required this.musteriNumber,
    required this.musteriEposta,
    required this.musterilerDurum,
    required this.musteriBakiye,
  
  }) : super(key: key);

  final String firmaAd;
  final String musteriNumber;
  final String musteriEposta;
  final String musterilerDurum;
   final String musteriBakiye;

  @override
  State<MusteriAlacakli> createState() => _MusteriAlacakliState();
}

class _MusteriAlacakliState extends State<MusteriAlacakli> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 9, 40, 5),
        padding: EdgeInsets.all(8),
    
      width: 350,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
     
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           
          Text(
           "Müşteri:  "+widget.firmaAd,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
            Text(
            "Telefon Numarası:  "+widget.musteriNumber,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
     
     
          Text(
            "E-Posta Adresi:  "+widget.musteriEposta,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
           Text(
            widget.musterilerDurum,
           
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: tahsil_edilmemis_color,

                    //color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
          ),
           Text(
            "Müşteri Bakiye:  "+widget.musteriBakiye,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
         
        ],
      ),
   
    );
  }
}

class musteriAlacaksiz extends StatefulWidget {
  const musteriAlacaksiz({
    Key? key,
    required this.firmaAd,
      required this.musteriNumber,
    required this.musteriEposta,
    required this.musterilerDurum,
    required this.musteriBakiye,
  
  }) : super(key: key);

  final String firmaAd;
  final String musteriNumber;
  final String musteriEposta;
  final String musterilerDurum;
   final String musteriBakiye;

  @override
  State<musteriAlacaksiz> createState() => _musteriAlacaksizState();
}

class _musteriAlacaksizState extends State<musteriAlacaksiz> {
  @override
   Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 9, 40, 5),
        padding: EdgeInsets.all(8),
    
      width: 350,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
     
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           
          Text(
           "Müşteri:  "+ widget.firmaAd,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
            Text(
            "Telefon Numarası"+widget.musteriNumber,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
     
     
          Text(
            "E-Posta Adresi:  "+widget.musteriEposta,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
           Text(
            widget.musterilerDurum,
           
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: tahsil_edilmis_color,

                    //color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
          ),
           Text(
            "Müşteri Bakiye:  "+widget.musteriBakiye,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
         
        ],
      ),
   
    );
  }
}

