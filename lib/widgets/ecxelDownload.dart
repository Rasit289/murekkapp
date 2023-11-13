import 'dart:io';

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import 'package:murekkapp/simplaListData.dart';
import 'package:path_provider/path_provider.dart';
import '../const.dart';
import '../drawer_widget.dart';
import '../widgets/WidgetRaporlarKartlar.dart';
import '../widgets/widgetKartlarFatura.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


class excelDown extends StatefulWidget {
  const excelDown({super.key});

  @override
  State<excelDown> createState() => _excelDownState();
}

class _excelDownState extends State<excelDown> {
 List<ChartData> getdeviceTempHumiList=[];
 
  var FileSaveHelper;

  Future<void> _createPDF() async {
  //Create a new PDF document
  PdfDocument document = PdfDocument();

  //Add a new page and draw text
  document.pages.add().graphics.drawString(
      'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 20),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: Rect.fromLTWH(0, 0, 500, 50));

  //Save the document
  List<int> bytes = await document.save();

  //Dispose the document
  document.dispose();
  //Get external storage directory
final directory = await getApplicationSupportDirectory();

//Get directory path
final path = directory.path;

//Create an empty file to write PDF data
File file = File('$path/Output.pdf');

//Write PDF data
await file.writeAsBytes(bytes, flush: true);

//Open the PDF document in mobile
OpenFile.open('$path/Output.pdf');
}
    Future<void> _createExcel() async {
  
     final xlsio.Workbook workbook =  xlsio.Workbook(0);
  
    final  xlsio.Worksheet sheet1 = workbook.worksheets.addWithName('İki Tarih Arası Ort. Değerler');
    sheet1.showGridlines = false;

  
      sheet1.getRangeByIndex(1, 1).columnWidth = 18;
    sheet1.getRangeByIndex(1, 2).columnWidth = 12;
    sheet1.getRangeByIndex(1, 3).columnWidth = 12;
    
 
    final  xlsio.Style style1 = workbook.styles.add('Style1');
    style1.backColor = '#D9E1F2';
    style1.hAlign =  xlsio.HAlignType.left;
    style1.vAlign =  xlsio.VAlignType.center;
    style1.bold = true;

    final  xlsio.Style style2 = workbook.styles.add('Style2');
    style2.backColor = '#8EA9DB';
    style2.vAlign =  xlsio.VAlignType.center;
    style2.numberFormat = r'[Red]($#,###)';
    style2.bold = true;

    sheet1.getRangeByName('A3').cellStyle = style1;
    sheet1.getRangeByName('B3:C3').cellStyle.backColor = '#D9E1F2';
    sheet1.getRangeByName('B3:C3').cellStyle.hAlign =  xlsio.HAlignType.right;
    sheet1.getRangeByName('B3:C3').cellStyle.vAlign =  xlsio.VAlignType.center;
    sheet1.getRangeByName('B3:C3').cellStyle.bold = true;

    sheet1.getRangeByName('A3:A7').cellStyle.vAlign =  xlsio.VAlignType.center;
    sheet1.getRangeByName('A1:A3').rowHeight=20;
    sheet1.getRangeByName('A1:A2').cellStyle.bold = true;
    sheet1.getRangeByName('A1').text="LOKASYON:";   sheet1.getRangeByName('B1').text="aaa";
    sheet1.getRangeByName('A2').text="Cihaz Adı:";  sheet1.getRangeByName('B2').text="bb";
 

    sheet1.getRangeByIndex(3, 1).text = 'Tarih';
    sheet1.getRangeByIndex(3, 2).text = 'Sıcaklık (c)';
    sheet1.getRangeByIndex(3, 3).text = 'Nem %';

     for(int i=0;i<=getdeviceTempHumiList.length-1;i++){
      sheet1.getRangeByIndex(i+4,1).rowHeight = 20;
      sheet1.getRangeByIndex(i+4, 1).text = getdeviceTempHumiList[i].time;
      sheet1.getRangeByIndex(i+4, 2).text = getdeviceTempHumiList[i].temp.toString();
      sheet1.getRangeByIndex(i+4, 3).text = getdeviceTempHumiList[i].humi.toString();
      sheet1.getRangeByIndex(i+4,2).cellStyle.hAlign = xlsio.HAlignType.right;
      sheet1.getRangeByIndex(i+4,3).cellStyle.hAlign =  xlsio.HAlignType.right;
      sheet1.getRangeByIndex(i+4,1).cellStyle.borders.right.lineStyle = xlsio.LineStyle.thin;
      sheet1.getRangeByIndex(i+4,2).cellStyle.borders.right.lineStyle = xlsio.LineStyle.thin;
     
    }
    
   final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
  
   
    //await FileSaveHelper.saveAndLaunchFile(bytes, 'OMWeatherReport.xlsx');
  
    //await FileSaveHelper.saveAndLaunchFile(bytes, 'OMWeatherReport.xlsx');

  // Excel dosyasını cihaza kaydedin
  /*final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();

  final String fileName = 'my_excel.xlsx';
  final String path = (await getApplicationDocumentsDirectory()).path;
  final String filePath = '$path/$fileName';
  File file = File(filePath);
  await file.writeAsBytes(bytes);

  // Kullanıcıya oluşturulan Excel dosyasını kaydetme bağlantısı sunun
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Excel dosyası oluşturuldu ve kaydedildi: $filePath'),
  ));

    
  
    workbook.dispose();




*/
  
   // var FileSaveHelper;
    //await FileSaveHelper.saveAndLaunchFile(bytes, 'OMWeatherReport.xlsx');
  }
   final myController = TextEditingController();

  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // <-- SEE HERE
            //title: const Text('Select Booking Type'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Düzenle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Yazdır PDF'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('E-Faturaya İşle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('E-Arşive işle'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Tahsilat & Ödeme Geçmişi'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Yüklenen Belgeler'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Kaldır'),
              ),
            ],
          );
        });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anaEkranColor,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'KDV Raporu ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: anaEkranColor,
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                      ElevatedButton(
            onPressed: _createExcel,
            child: Text('Excel Dosyasını İndir'),
          ),
                       ElevatedButton(
            onPressed: _createPDF,
            child: Text('pdf Dosyasını İndir'),
          ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    height: 25,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        //color: Color.fromRGBO(243, 54, 2, 1),

                        ),
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Aylara Göre KDV Toplantıları",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 350,
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
                        //KDV raporlarının arandığı kısım
                        Container(
                          height: 70,
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                          margin: EdgeInsets.only(top: 0),
                          child: Align(
                              alignment: Alignment.center,
                              child: SearchTextBox(
                                  hintText: "hintText",
                                  valueList: kdvlist,
                                  textControl: myController)),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                          height: 210,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(57, 56, 72, 1),
                          ),
                          child: Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,

                                //padding: const EdgeInsets.all(8),
                                itemCount: 4,
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
                                                  backgroundColor:
                                                      Color(0xFFFE4A49),
                                                  foregroundColor: Colors.white,
                                                  icon: Icons.delete,
                                                  label: 'Sil',
                                                ),
                                              ],
                                            ),
                                            endActionPane: const ActionPane(
                                              motion: ScrollMotion(),
                                              children: [
                                                SlidableAction(
                                                  onPressed: null,
                                                  backgroundColor:
                                                      Color(0xFF0392CF),
                                                  foregroundColor: Colors.white,
                                                  icon: Icons.settings,
                                                  label: 'Düzenle',
                                                ),
                                              ],
                                            ),
                                            child: KDVRaporuContainer(
                                              donem: kdvRaporuTest[index][0]
                                                  .toString(),
                                              hesaplananKDV:
                                                  kdvRaporuTest[index][1]
                                                      .toString(),
                                              indirilecekKDV:
                                                  kdvRaporuTest[index][2]
                                                      .toString(),
                                              netKDV: kdvRaporuTest[index][3]
                                                  .toString(),
                                            )),
                                      ));
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 65, 20, 0),
                    height: 25,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        //color: Color.fromRGBO(243, 54, 2, 1),

                        ),
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "KDV Dökümü",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 560,
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
                        //KDV dökümünün arandığı kısım
                        Container(
                          height: 70,
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
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
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                        
                            color: Color.fromRGBO(57, 56, 72, 1),
                          ),
                          child: Expanded(
                              child: Swiper.children(
                                  control: SwiperControl(
                                    iconPrevious: Icons.arrow_back_ios,
                                    iconNext: Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                  children: [
                                ListView.builder(
                                    shrinkWrap: true,

                                    //padding: const EdgeInsets.all(8),
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index == 0) {
                                        // return the header
                                        return Stack(
                                          children: [
                                            Visibility(
                                              visible: tumFaturalarContainer,
                                              child: const Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  "Tümü",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.white,
                                                    //fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                      if (index == 1) {
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
                                                        backgroundColor:
                                                            Color(0xFFFE4A49),
                                                        foregroundColor:
                                                            Colors.white,
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
                                                          _showSimpleDialog();
                                                        },
                                                        backgroundColor:
                                                            Color(0xFF0392CF),
                                                        foregroundColor:
                                                            Colors.white,
                                                        icon: Icons.settings,
                                                        label: 'Düzenle',
                                                      ),
                                                    ],
                                                  ),
                                                  //child: Center(child: Text('Entry ${entries[index]}')),
                                                  child: TahsilEdilmemis(
                                                      firmaAd:
                                                          KDVdokumuTest[index]
                                                                  [0]
                                                              .toString(),
                                                      belgeNumarasiEdilmemis:
                                                          KDVdokumuTest[index]
                                                                  [1]
                                                              .toString(),
                                                      belgeTutariYazi:
                                                          KDVdokumuTest[index]
                                                                  [2]
                                                              .toString(),
                                                                vadeDurumuEdilmemis:
                                                          KDVdokumuTest[index]
                                                                  [2]
                                                              .toString(),
                                                      TahsilatDurumu:
                                                          KDVdokumuTest[index]
                                                                  [3]
                                                              .toString(),
                                                      tarihTahsilat:
                                                          KDVdokumuTest[index]
                                                                  [4]
                                                              .toString(),)),
                                            ));
                                      }
                                      if (index == 2) {
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
                                                        backgroundColor:
                                                            Color(0xFFFE4A49),
                                                        foregroundColor:
                                                            Colors.white,
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
                                                          _showSimpleDialog();
                                                        },
                                                        backgroundColor:
                                                            Color(0xFF0392CF),
                                                        foregroundColor:
                                                            Colors.white,
                                                        icon: Icons.settings,
                                                        label: 'Düzenle',
                                                      ),
                                                    ],
                                                  ),
                                                  //child: Center(child: Text('Entry ${entries[index]}')),
                                                  child: TahsilEdilmis(
                                                    firmaAd:
                                                        KDVdokumuTest2[index][0]
                                                            .toString(),
                                                    belgeNumarasi:
                                                        KDVdokumuTest2[index][1]
                                                            .toString(),
                                                    belgeTutariYazi:
                                                        KDVdokumuTest2[index][2]
                                                            .toString(),
                                                    vadeDurumu:
                                                        KDVdokumuTest2[index][1]
                                                            .toString(),
                                                    TahsilatDurumu:
                                                        KDVdokumuTest2[index][3]
                                                            .toString(),
                                                    tarihTahsilat:
                                                        KDVdokumuTest2[index][4]
                                                            .toString(),
                                                  )),
                                            ));
                                      }
                                      return null;
                                    }),
                                ListView.builder(
                                    shrinkWrap: true,
                                    //padding: const EdgeInsets.all(8),
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index == 0) {
                                        // return the header
                                        return Stack(
                                          children: [
                                            Visibility(
                                              visible: tumFaturalarContainer,
                                              child: const Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  "Giderler",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.white,
                                                    //fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }

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
                                                      backgroundColor:
                                                          Color(0xFFFE4A49),
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.delete,
                                                      label: 'Sil',
                                                    ),
                                                  ],
                                                ),
                                                endActionPane: const ActionPane(
                                                  motion: ScrollMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      onPressed: null,
                                                      backgroundColor:
                                                          Color(0xFF0392CF),
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.settings,
                                                      label: 'Düzenle',
                                                    ),
                                                  ],
                                                ),
                                                //child: Center(child: Text('Entry ${entries[index]}')),
                                                child: TahsilEdilmemis(
                                                    firmaAd:
                                                        KDVdokumuTest[index][0]
                                                            .toString(),
                                                    belgeNumarasiEdilmemis:
                                                        KDVdokumuTest[index][1]
                                                            .toString(),
                                                    belgeTutariYazi:
                                                        KDVdokumuTest[index][2]
                                                            .toString(),
                                                                vadeDurumuEdilmemis:
                                                          KDVdokumuTest[index]
                                                                  [2]
                                                              .toString(),
                                                    TahsilatDurumu:
                                                        KDVdokumuTest[index][3]
                                                            .toString(),
                                                    tarihTahsilat:
                                                        KDVdokumuTest[index][4]
                                                            .toString())),
                                          ));
                                    }),
                                ListView.builder(
                                    shrinkWrap: true,

                                    //padding: const EdgeInsets.all(8),
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index == 0) {
                                        // return the header
                                        return Stack(
                                          children: [
                                            Visibility(
                                              visible: tumFaturalarContainer,
                                              child: const Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  "Satışlar",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.white,
                                                    //fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }
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
                                                      backgroundColor:
                                                          Color(0xFFFE4A49),
                                                      foregroundColor:
                                                          Colors.white,
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
                                                        _showSimpleDialog();
                                                      },
                                                      backgroundColor:
                                                          Color(0xFF0392CF),
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.settings,
                                                      label: 'Düzenle',
                                                    ),
                                                  ],
                                                ),
                                                child: TahsilEdilmis(
                                                    firmaAd:
                                                        KDVdokumuTest2[index][0]
                                                            .toString(),
                                                    belgeNumarasi:
                                                        KDVdokumuTest2[index][1]
                                                            .toString(),
                                                    belgeTutariYazi:
                                                        KDVdokumuTest2[index][2]
                                                            .toString(),
                                                                vadeDurumu:
                                                        KDVdokumuTest2[index][1]
                                                            .toString(),
                                                    TahsilatDurumu:
                                                        KDVdokumuTest2[index][3]
                                                            .toString(),
                                                    tarihTahsilat:
                                                        KDVdokumuTest2[index][4]
                                                            .toString())),
                                          ));
                                    }),
                              ])),
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

  class ChartData {
        ChartData(this.time,this.temp,this.humi );
        final String time;
         final String temp;
          final String humi;
        
    }