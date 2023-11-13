import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../const.dart';
import '../model/expenselnvoiceJSClass.dart';
import '../model/productsJSClass.dart';
import '../pages/gelirFaturalari.dart';
import '../pages/giderFatura.dart';

class tahsilatGecmisi extends StatefulWidget {
  const tahsilatGecmisi({super.key});

  @override
  State<tahsilatGecmisi> createState() => _tahsilatGecmisiState();
}

class _tahsilatGecmisiState extends State<tahsilatGecmisi> {
   ExpenseInvoiceListJsn? gelirListe;

  gelirlistecheck() async {
    gelirListe = await expenselInvoice();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    gelirlistecheck();
  }

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
            if (faturaCheck == 1) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const gelirFaturalari()));
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const giderFatura()));
            }
          },

      
      
        
     
    ),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title:  Text(
            tahsilatGecmisiBaslik,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: anaEkranColor,
       
        body: Container(
            //child : DrawerWidget(),

            margin: const EdgeInsets.fromLTRB(0, 20, 0, 100),
            child: Column(
              children: [
             
                //tahsilat geçmişini gçrdüğümüz kısım
              
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,

                      //padding: const EdgeInsets.all(8),
                      itemCount:  gelirListe?.result!.expenseInvoices?.length,
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
                                  endActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (value) {
                                      
                                        },
                                        backgroundColor: Color(0xFF0392CF),
                                        foregroundColor: Colors.white,
                                        icon: Icons.settings,
                                        label: 'Düzenle',
                                      ),
                                    ],
                                  ),
                                  //child: Center(child: Text('Entry ${entries[index]}')),
                                  //gelirListe?.result!.expenseInvoices?[0].totalPayment.toString() ?? "",
                                  child: tahsilatGecmisiContainer(odemeTarihi: gelirListe?.result!.expenseInvoices?[index].paymentHistory?[index].paymentDate.toString() ?? "",
                                         odemeMiktari: gelirListe?.result!.expenseInvoices?[index].paymentHistory?[index].paymentAmount.toString() ?? "",
                                         odemeKasasi: gelirListe?.result!.expenseInvoices?[index].paymentHistory?[index].paymentCase.toString() ?? "",
                                         OdemeTuru: gelirListe?.result!.expenseInvoices?[index].paymentHistory?[index].paymentType.toString() ?? "",)),
                            ));
                      }),
                ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(18, 20, 18, 10),
                    padding: EdgeInsets.all(8),
                 
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(57, 56, 72, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          
                          "Yapılan Toplam Tahsilat :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                           color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        //ürün için kesilen fatura adetini gösteren kısım
                        Text(
                          "",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    )),
                      Container(
                    margin: const EdgeInsets.fromLTRB(18, 2, 18, 0),
                   padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(57, 56, 72, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Kalan Tutar :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        //ürün için kesilen fatura adetini gösteren kısım
                        Text(
                          "",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ))
                
           
              ],
            )));
  }
}

class tahsilatGecmisiContainer extends StatefulWidget {
const tahsilatGecmisiContainer({
    Key? key,
    required this.odemeTarihi,
    required this.odemeMiktari,
    required this.odemeKasasi,
     required this.OdemeTuru,
 
  }) : super(key: key);

  final String odemeTarihi;
  final String odemeMiktari;
  final String odemeKasasi;
  final String OdemeTuru;
 

  @override
  State<tahsilatGecmisiContainer> createState() => _tahsilatGecmisiContainerState();
}

class _tahsilatGecmisiContainerState extends State<tahsilatGecmisiContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 9, 18, 5),
      padding: EdgeInsets.all(8),
     
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(50, 55, 59, 1),
      ),

      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Text(
                 odemeGecmisiTarih+widget.odemeTarihi,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ),
          Text(
             odemeGecmisiMiktar+widget.odemeMiktari,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: guncelDurumTitleColor,
              //fontWeight: FontWeight.bold
            ),
          ),
          Text(
             odemeGecmisiKasa+widget.odemeKasasi,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: guncelDurumTitleColor,

              //color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
              Text(
             odemeGecmisiTur+widget.OdemeTuru,
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