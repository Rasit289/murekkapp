import 'package:flutter/material.dart';

import '../const.dart';


class Tahsilat extends StatefulWidget {
  const Tahsilat({
    Key? key,
    required this.firmaAd,
    required this.belgeTutariYazi,
    required this.TahsilatDurumu,
    required this.tarihTahsilat,
  }) : super(key: key);

  final String firmaAd;
  final String belgeTutariYazi;
  final String TahsilatDurumu;
  final String tarihTahsilat;

  @override
  State<Tahsilat> createState() => _TahsilatState();
}

class _TahsilatState extends State<Tahsilat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 9, 18, 5),
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
        image: DecorationImage(
          alignment: Alignment.topRight,
          image: AssetImage('images/belge_resmi.jpg'),
          scale: 3,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.firmaAd,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
          Text(
            widget.belgeTutariYazi,
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
                    fontSize: 14,
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
                    fontSize: 14,
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






class EklenenUrunVeHizmet extends StatefulWidget {
  const EklenenUrunVeHizmet({
    Key? key,
    required this.basilk,
    required this.miktar,
    required this.birim,
    required this.birimFiyat,
     required this.totalFatura,
  }) : super(key: key);

  final String basilk;
  final String miktar;
  final String birim;
  final String birimFiyat;
  final String totalFatura;

  @override
  State<EklenenUrunVeHizmet> createState() => _EklenenUrunVeHizmetState();
}

class _EklenenUrunVeHizmetState extends State<EklenenUrunVeHizmet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 9, 18, 5),
        padding: EdgeInsets.all(9),
     
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [


 
          Text(
            widget.basilk,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
          Text(
            widget.miktar,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
        
            
             
             
                Text(
                  widget.birim,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16, color: Colors.white,

                    //fontWeight: FontWeight.bold
                  ),
                ),
             
             Text(
                  widget.birimFiyat,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                   Text(
                  widget.totalFatura,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              
      
        ]
      
       
      ),
    );
  }
}
