import 'package:flutter/material.dart';

import '../const.dart';

class TahsilEdilmis extends StatefulWidget {
  const TahsilEdilmis({
    Key? key,
    required this.firmaAd,
     required this.belgeNumarasi,
    required this.belgeTutariYazi,
      required this.TahsilatDurumu,
    required this.vadeDurumu,
    required this.tarihTahsilat,
  }) : super(key: key);

  final String firmaAd;
  final String belgeTutariYazi;
  final String TahsilatDurumu;
  final String vadeDurumu;
  final String tarihTahsilat;
   final String belgeNumarasi;

  @override
  State<TahsilEdilmis> createState() => _TahsilEdilmisState();
}

class _TahsilEdilmisState extends State<TahsilEdilmis> {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 9, 40, 5),
      padding: EdgeInsets.all(5),
      
      width: 350,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
       
             
                
                Text(
                  "Bilgi:  "+widget.firmaAd,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: guncelDurumTitleColor,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                    Text(
                  "Belge Numarası:  "+widget.belgeNumarasi,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
           
          Text(
            "Belge Tutarı:  "+widget.belgeTutariYazi,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
            Text(
            "Vade Durumu:  "+widget.vadeDurumu,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  widget.TahsilatDurumu,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: tahsil_edilmis_color,

                    //color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  widget.tarihTahsilat,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
     
    );
  }
}


class TahsilEdilmemis extends StatefulWidget {
  const TahsilEdilmemis({
    Key? key,
    required this.firmaAd,
      required this.belgeNumarasiEdilmemis,
    required this.belgeTutariYazi,
     required this.vadeDurumuEdilmemis,
    required this.TahsilatDurumu,
    required this.tarihTahsilat,
  
  }) : super(key: key);

  final String firmaAd;
  final String belgeTutariYazi;
  final String TahsilatDurumu;
  final String vadeDurumuEdilmemis;
  final String tarihTahsilat;
   final String belgeNumarasiEdilmemis;

  @override
  State<TahsilEdilmemis> createState() => _TahsilEdilmemisState();
}

class _TahsilEdilmemisState extends State<TahsilEdilmemis> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 9, 40, 5),
        padding: EdgeInsets.all(5),
    
      width: 350,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
     
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           
          Text(
           "Bilgi:  "+ widget.firmaAd,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 17,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
            Text(
           "Belge Numarası:  "+ widget.belgeNumarasiEdilmemis,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
     
     
          Text(
            "Belge Tutarı: "+widget.belgeTutariYazi,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
           Text(
            "Vade Durumu:  "+widget.vadeDurumuEdilmemis,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  widget.TahsilatDurumu,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: tahsil_edilmemis_color,

                    //color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  widget.tarihTahsilat,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
   
    );
  }
}


class KismiTahsilEdilmis extends StatefulWidget {

  const KismiTahsilEdilmis({
    Key? key,
    required this.firmaAd,
    required this.belgeNumarasiKismi,
    required this.belgeTutariYazi,
     required this.vadeDurumukismi,
    required this.TahsilatDurumu,
    required this.tarihTahsilat,
  }) : super(key: key);

  final String firmaAd;
  final String belgeTutariYazi;
  final String TahsilatDurumu;
  final String vadeDurumukismi;
  final String tarihTahsilat;
  final String belgeNumarasiKismi;

  @override
  State<KismiTahsilEdilmis> createState() => _KismiTahsilEdilmisState();
}

class _KismiTahsilEdilmisState extends State<KismiTahsilEdilmis> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 9, 40, 5),
        padding: EdgeInsets.all(5),

      width: 350,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
    
     child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         
          Text(
            "Bilgi:  "+widget.firmaAd,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
           Text(
           "Belge Numarası:  "+ widget.belgeNumarasiKismi,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
         
          Text(
            "Belge Tutarı:  "+widget.belgeTutariYazi,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
             Text(
            "Vade Durumu:  "+widget.vadeDurumukismi,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  widget.TahsilatDurumu,
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 16, color: kismi_tahsil_edildi_color

                          //fontWeight: FontWeight.bold
                          ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  widget.tarihTahsilat,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
     
    );
  }
}