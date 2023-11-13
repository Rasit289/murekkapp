import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import '../addPages/OdemeYap.dart';
import '../addPages/createGelirFaturasi.dart';
import '../addPages/tahsilatGecmisi.dart';
import '../addPages/yuklenenBelgeler.dart';
import '../widgets/WidgetRaporlarKartlar.dart';
import '../widgets/tahsilatRaporuWidget.dart';
import '../const.dart';
import '../drawer_widget.dart';

class OdemelerRaporu extends StatefulWidget {
  const OdemelerRaporu({super.key});

  @override
  State<OdemelerRaporu> createState() => _OdemelerRaporuState();
}

class _OdemelerRaporuState extends State<OdemelerRaporu> {
    final myController = TextEditingController();
    //ödemeler raporunun işlemlerinin bulunduğu kısım
        Future<void> _dialogBuilder() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
         "Silmek İstediğinize Emin Misiniz ?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              //fontWeight: FontWeight.bold
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Sil',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Vazgeç'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //fatura ile ilgili olan işlevleri görmemizi ve işlemleri yapmamızı sağlayan simple dialog
  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                        faturaCheck = 1;
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GelirFaturasi()));
                },
                child: const Text('Düzenle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  kontrolOdeme = 1;
                  OdemeYapGiris = "Tahsil Edilecek Tutar";
                  odemeYapBaslik = 'Tahsilat Yap';
                  odemeYapButtonText = "Tahsilat Yap";
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OdemeYap()));
                },
                child: const Text('Tahsilat & Ödeme Yap'),
              ),
              SimpleDialogOption(
                onPressed: () {
                        faturaCheck = 1;
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GelirFaturasi()));
                },
                child: const Text('Yazdır PDF'),
              ),
              SimpleDialogOption(
                onPressed: () {
                        faturaCheck = 1;
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GelirFaturasi()));
                },
                child: const Text('E-Faturaya İşle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                        faturaCheck = 1;
                 Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GelirFaturasi()));
                },
                child: const Text('E-Arşive işle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  tahsilatGecmisiBaslik="Tahsilat Tarihi";
                  odemeGecmisiTarih="Tahsilat Geçmişi:  ";
                   odemeGecmisiMiktar="Tahsilat Miktarı:  ";
                    odemeGecmisiKasa="İlgili Kasa:  ";
                     odemeGecmisiTur="Tahsilat Türü:  ";
                         faturaCheck = 1;
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const tahsilatGecmisi()));
                },
                child: const Text('Tahsilat & Ödeme Geçmişi'),
              ),
              SimpleDialogOption(
                onPressed: () {
                    faturaCheck = 1;
                    belgeKontrol=1;
                  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const yuklenenBelgeler()));
                },
                child: const Text('Yüklenen Belgeler'),
              ),
             
            ],
          );
        });
  }
  
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anaEkranColor,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Ödeme Raporu ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: anaEkranColor,
      //çekmece(darwer)ın bulunduğu kısım
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                Container(
                     margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    height: 430,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                         color: Color.fromRGBO(57, 56, 72, 1),
                    ),
                    child:tahsilatRaporuGiris() ,
                  ),
                  Container(
                    child: tahsilatRaporubilgiler(),
                  ),
                 
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    height: 400,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(57, 56, 72, 1),
                    ),
                    child: Column(
                      children: [
                           Container(
                          padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Fatura Ara",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        //daha önceden eklenmiş faturaların arandığı ve seçildiği kısım
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
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 7, 10, 0),
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(57, 56, 72, 1),
                          ),
                          child: Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,

                                //padding: const EdgeInsets.all(8),
                                itemCount: 2,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                  
                                    width: double.infinity,
                                    child: Center(
                                      child:Slidable(
                              key: const ValueKey(0),
                                         startActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (value) {
                                          _dialogBuilder();
                                        },
                                        backgroundColor: Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Sil',
                                      ),
                                    ],
                                  ),
                                    endActionPane:  ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                         SlidableAction(
                                               onPressed: (value) {
                                                _showSimpleDialog();
                                              },
                                              backgroundColor:
                                                  Color(0xFF0392CF),
                                              foregroundColor: Colors.white,
                                              icon: Icons.settings,
                                              label: 'İşlemler',
                                            ),
                                      ],
                                    ),
                                        child:TahsilatRaporuContainer(firma5: tahsilatRaporuTest[index][0].toString(), 
                                        belgeNoTahsilat: tahsilatRaporuTest[index][1].toString(), 
                                        musteriBelgeTutariYazi5: tahsilatRaporuTest[index][2].toString(), 
                                         tahsilatTarihi: tahsilatRaporuTest[index][3].toString(), 
                                          VadeDurumu: tahsilatRaporuTest[index][4].toString(),  )),),

                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



