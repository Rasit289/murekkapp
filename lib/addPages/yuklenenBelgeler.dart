import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/pages/kasaVeBankalar.dart';
import '../const.dart';
import '../model/CaseFlowJSClass.dart';
import '../model/caseAndBankJSClass.dart';
import '../pages/gelirFaturalari.dart';

class yuklenenBelgeler extends StatefulWidget {
  const yuklenenBelgeler({super.key});

  @override
  State<yuklenenBelgeler> createState() => _yuklenenBelgelerState();
}

class _yuklenenBelgelerState extends State<yuklenenBelgeler> {

 

 CaseFlowListJsn? kasaHareketleriListe;

  kasaHareketlerilistecheck() async {
    kasaHareketleriListe = await caseFlowFunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    kasaHareketlerilistecheck();
  }

 

  Future<void> _dialogBuilder() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
               "Silmek istediğinize Emin misiniz ?",
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

  final myController = TextEditingController();
  bool kontrol = true;
  int i = 0;
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
        if(belgeKontrol==1){
              Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const gelirFaturalari()));

      }
      else{
            Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const kasaVeBankalar()));

      }
       
       
          

      
      
        
      },
    ),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Text(
            "Fatura Belgeleri",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
       
        body: Container(
            //child : DrawerWidget(),

            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
             
                //yüklenen belgeleri gördüğümüz kısım
              
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,

                      //padding: const EdgeInsets.all(8),
                      itemCount: kasaHareketleriListe?.result!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: Slidable(
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
                               
                                  child: yuklenenBelgelerContainer(belgeTarihi: kasaHareketleriListe
                                                      ?.result![index].docs?[0]
                                                      .docDate
                                                      .toString() ??
                                                  "", belgeAdi: kasaHareketleriListe
                                                      ?.result![index].docs?[0]
                                                      .docName
                                                      .toString() ??
                                                  "", indirmeBaglantisi: kasaHareketleriListe
                                                      ?.result![index].docs?[0]
                                                      .downloadLink
                                                      .toString() ??
                                                  "",)),
                            ));
                      }),
                ),

                 
                
           
              ],
            )));
  }
}

class yuklenenBelgelerContainer extends StatefulWidget {
const yuklenenBelgelerContainer({
    Key? key,
    required this.belgeTarihi,
    required this.belgeAdi,
    required this.indirmeBaglantisi,

 
  }) : super(key: key);

  final String belgeTarihi;
  final String belgeAdi;
   final String indirmeBaglantisi;
 

  @override
  State<yuklenenBelgelerContainer> createState() => _yuklenenBelgelerContainerState();
}

class _yuklenenBelgelerContainerState extends State<yuklenenBelgelerContainer> {
     Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
             
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:  
           Text(
             "İndirme Bağlantısı:  "+widget.indirmeBaglantisi,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              //fontWeight: FontWeight.bold
            ),
          ),
              ),
            ],
          );
        });
  }
   @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 9, 18, 5),
      padding: EdgeInsets.all(5),
      
     
      width: double.infinity,
      decoration:  BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
          borderRadius: BorderRadius.circular(7),
        

      ),

      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Text(
             "Belge Adı:  "+widget.belgeAdi,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 17,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
            
          
        
                Stack(
                  children: [

                    Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child:    Text(
                 "Belge Tarihi:  "+widget.belgeTarihi,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),

                   

                Container(
                margin: EdgeInsets.fromLTRB(230, 3, 5, 0),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox.fromSize(
                      size: Size(80, 40),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(114, 112, 142, 1),
                        child: InkWell(
                          onTap: () {
                            _showSimpleDialog();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                  // <-- Icon
                                  Icons.download,
                                  size: 24.0,
                                  color: Colors.white), // <-- Icon
                               // <-- Text
                            ],
                          ),
                        ),
                      ),
                    )),
              ),

                  ],
                ),
          

        
      
        ],
      ),
  
    );
  }
}