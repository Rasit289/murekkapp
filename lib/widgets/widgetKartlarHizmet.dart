import 'package:flutter/material.dart';

import '../const.dart';

class Projeler extends StatefulWidget {
  const Projeler({
    Key? key,
    required this.musteriAdi,
    required this.tarihHizmetler,
    required this.belgeKodu,
     required this.kdvMiktari,
    required this.faturaTutari,
  }) : super(key: key);

  final String musteriAdi;
  final String tarihHizmetler;
  final String belgeKodu;
  final String kdvMiktari;
  final String faturaTutari;

  @override
  State<Projeler> createState() => _ProjelerState();
}

class _ProjelerState extends State<Projeler> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 9, 18, 5),
       padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),

      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Text(
                  "Ürün Adı:  "+widget.musteriAdi,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
          Text(
             "Ürün Kodu:  "+widget.tarihHizmetler,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
          Text(
             "Miktar:  "+widget.belgeKodu,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: guncelDurumTitleColor,

              //color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
              Text(
             "KDV Miktarı:  "+widget.kdvMiktari,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          Text(
             "Satış Fiyatı:  "+widget.faturaTutari,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
  
    );
  }
}


class urunVeIstatistikContainer extends StatefulWidget {
  const urunVeIstatistikContainer({
    Key? key,
    required this.musteriAdi,
    required this.tarihHizmetler,
    required this.belgeKodu,
    required this.faturaTutari,
  }) : super(key: key);

  final String musteriAdi;
  final String tarihHizmetler;
  final String belgeKodu;
  final String faturaTutari;


  @override
  State<urunVeIstatistikContainer> createState() => _urunVeIstatistikContainerState();
}

class _urunVeIstatistikContainerState extends State<urunVeIstatistikContainer> {
  @override
  Widget build(BuildContext context) {
     return Container(
      margin: const EdgeInsets.fromLTRB(18, 9, 18, 5),
       padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),

      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Text(
                  "Müşteri Adı :  "+widget.musteriAdi,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
          Text(
             "Belge Kodu:  "+widget.tarihHizmetler,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
          Text(
             "Fatura Tutarı:  "+widget.belgeKodu,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: guncelDurumTitleColor,

              //color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
         
          Text(
             "Tarih:  "+widget.faturaTutari,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
  
    );
  }
}
