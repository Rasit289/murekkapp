
import 'package:flutter/material.dart';

import '../const.dart';
class FaturalarOrnek extends StatefulWidget {
  const FaturalarOrnek({
    Key? key,
    required this.firma3,
    required this.musteriBelgeTutariYazi4,
    required this.tarihTahsilat1,
    required this.FaturaNumrasi,
  }) : super(key: key);

  final String firma3;
  final String musteriBelgeTutariYazi4;
  final String tarihTahsilat1;
  final String FaturaNumrasi;

  @override
  State<FaturalarOrnek> createState() => _FaturalarOrnekState();
}

class _FaturalarOrnekState extends State<FaturalarOrnek> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(40, 9, 40, 5),
        padding: EdgeInsets.all(5),
    
      width: 450,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
     
    
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.firma3,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
      
          Text(
                  widget.FaturaNumrasi,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                    Text(
            widget.musteriBelgeTutariYazi4,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
        
          Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child:   Text(
            widget.tarihTahsilat1,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: guncelDurumTitleColor,

              //color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ) ,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(190, 0, 0, 0),
                child: InkWell(
                  onTap: null,
                  child: Container(
                    padding: const EdgeInsets.all(2),

                    height: 30,
                    width: 150,

                    //height: 40,
                    //width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Color.fromRGBO(50, 55, 59, 1),
                    ),
                    child: Text(
                      "Faturaya Git",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
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

class musteriRapor extends StatefulWidget {
const musteriRapor({
    Key? key,
    required this.firmaAd,
      required this.musteriNumber,
    required this.musteriEposta,
    required this.vergiDiresi,
    required this.TCnumarasi,
    required this.musteriBakiye,
  
  }) : super(key: key);

  final String firmaAd;
  final String musteriNumber;
  final String musteriEposta;
  final String vergiDiresi;
  final String TCnumarasi;
   final String musteriBakiye;

  @override
  State<musteriRapor> createState() => _musteriRaporState();
}

class _musteriRaporState extends State<musteriRapor> {
  @override
  
   Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 9, 40, 5),
       padding: EdgeInsets.all(5),
    
      width: 300,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
     
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           
          Text(
            widget.firmaAd,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
            Text(
            widget.musteriNumber,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
     
     
          Text(
            widget.musteriEposta,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
           Text(
            widget.vergiDiresi,
           
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,

                    //color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
          ),
           Text(
            widget.TCnumarasi,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
           Text(
            widget.musteriBakiye,
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

class TahsilatRaporuContainer extends StatefulWidget {
  const TahsilatRaporuContainer({
    Key? key,
    required this.firma5,
    required this.belgeNoTahsilat,
    required this.musteriBelgeTutariYazi5,
    required this.tahsilatTarihi,
    required this.VadeDurumu,
  }) : super(key: key);

  final String firma5;
  final String musteriBelgeTutariYazi5;
  final String tahsilatTarihi;
  final String VadeDurumu;
  final String belgeNoTahsilat;

  @override
  State<TahsilatRaporuContainer> createState() =>
      _TahsilatRaporuContainerState();
}

class _TahsilatRaporuContainerState extends State<TahsilatRaporuContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(18, 4, 18, 5),
         padding: EdgeInsets.all(12),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(50, 55, 59, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.firma5,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.belgeNoTahsilat,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.musteriBelgeTutariYazi5,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: guncelDurumTitleColor,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.tahsilatTarihi,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: guncelDurumTitleColor,

                //color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.VadeDurumu,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(230, 0, 0, 0),
              child: InkWell(
                onTap: null,
                child: Container(
                  padding: const EdgeInsets.all(2),

                  height: 30,
                  width: 150,

                  //height: 40,
                  //width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(50, 55, 59, 1),
                  ),
                  child: Text(
                    "Faturaya Git",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KDVRaporuContainer extends StatefulWidget {
  const KDVRaporuContainer({
    Key? key,
    required this.donem,
    required this.hesaplananKDV,
    required this.indirilecekKDV,
    required this.netKDV,
  }) : super(key: key);

  final String donem;
  final String hesaplananKDV;
  final String indirilecekKDV;
   final String netKDV;


  @override
  State<KDVRaporuContainer> createState() => _KDVRaporuContainerState();
}

class _KDVRaporuContainerState extends State<KDVRaporuContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 9, 18, 5),
       padding: EdgeInsets.all(5),
    
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
       
      ),
      child: SingleChildScrollView(
     child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.donem,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
          Text(
            widget.hesaplananKDV,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          Text(
            widget.indirilecekKDV,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
            Text(
            widget.netKDV,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class MuhasabeRaporlariContainer extends StatefulWidget {
  const MuhasabeRaporlariContainer({
    Key? key,
    required this.firmaAd,
    required this.belgeNoMuhasabe,
    required this.tutar,
    required this.giderMuahasebe,
    required this.tarih,
  }) : super(key: key);

  final String firmaAd;
  final String tutar;
  final String giderMuahasebe;
  final String tarih;
  final String belgeNoMuhasabe;

  @override
  State<MuhasabeRaporlariContainer> createState() =>
      _MuhasabeRaporlariContainerState();
}

class _MuhasabeRaporlariContainerState
    extends State<MuhasabeRaporlariContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 9, 18, 5),
       padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
      child: SingleChildScrollView(
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
              widget.belgeNoMuhasabe,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.tutar,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.giderMuahasebe,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 255, 1, 1),
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.tarih,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GelirMuhasebe extends StatefulWidget {
  const GelirMuhasebe(
      {Key? key,
      required this.firmaAd,
      required this.belgeNoMuasabe,
      required this.tutar,
      required this.gelirMuhasebeString,
      required this.tarihGelir})
      : super(key: key);

  final String firmaAd;
  final String tutar;
  final String gelirMuhasebeString;
  final String tarihGelir;
  final String belgeNoMuasabe;

  @override
  State<GelirMuhasebe> createState() => _GelirMuhasebeState();
}

class _GelirMuhasebeState extends State<GelirMuhasebe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 9, 18, 5),
       padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
      child: SingleChildScrollView(
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
              widget.belgeNoMuasabe,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.tutar,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.gelirMuhasebeString,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 17, color: Colors.green
                  //fontWeight: FontWeight.bold
                  ),
            ),
            Text(
              widget.tarihGelir,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}

