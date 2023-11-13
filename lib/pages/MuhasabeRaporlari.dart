import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/widgets/searchTextBox.dart';
import '../const.dart';
import '../drawer_widget.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:open_file/open_file.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'dart:typed_data';

import '../model/caseAndBankJSClass.dart'; 


class MuhasabeRaporlari extends StatefulWidget {
  const MuhasabeRaporlari(
      {Key? key, required this.containerTitle, required this.deviceTitle,})
      : super(key: key);

        final String containerTitle;
  final String deviceTitle;

  @override
  State<MuhasabeRaporlari> createState() => _MuhasabeRaporlariState();
}

class _MuhasabeRaporlariState extends State<MuhasabeRaporlari> {

  

   List<ChartData> getdeviceTempHumiList=[];

     CaseAndBankListJsn? kasaVeBankalarListe;

  kasaVeBankalarcheck() async {
    kasaVeBankalarListe = await caseAndBankFunc();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    kasaVeBankalarcheck();
  }
    
 
 

  Future<void> _createPDF(String officeQeueNo, String baseNo, String decisionNo, 
                        String fileDescription, String itemType ) async {
   
  //Create a new PDF document
  PdfDocument document = PdfDocument();
   //late Uint8List fontDataBold;
 Uint8List fontData;
     List<int> fontBinaryData = [/* ... */]; // Buradaki içeriği gerçek bir font verisi ile doldurmalısınız

  // Uint8List'e dönüştürme
  Uint8List fontDataBold = Uint8List.fromList(fontBinaryData);
 // PdfTrueTypeFont font = PdfTrueTypeFont(fontDataBold,2);
  

  final PdfPage coverInfoPage = document.pages.add();


PdfPageTemplateElement pwtext({
  String? textValue,
  PdfTextAlignment? aligment,
  double fontSize = 9,
  bool? drawLineUp,
  bool? drawLineDown,
  PdfTrueTypeFont? font, // font parametresi eklendi
}) {
  PdfPageTemplateElement textData = PdfPageTemplateElement(
    Rect.fromLTWH(0, 0, document.pageSettings.size.width, 50),
  );

  if (drawLineUp == true) {
    textData.graphics.drawLine(
      PdfPen(PdfColor(255, 0, 0)),
      Offset(0, 1),
      Offset(coverInfoPage.size.width, 1),
    );
  }
textData.graphics.drawString(
  textValue!,
  PdfStandardFont(PdfFontFamily.helvetica, 20), // Helvetica standard bir TrueType font
  bounds: Rect.fromLTWH(
    0,
    0,
    coverInfoPage.getClientSize().width,
    coverInfoPage.getClientSize().height,
  ),
);




  if (drawLineDown == true) {
    textData.graphics.drawLine(
      PdfPen(PdfColor(255, 0, 0)),
      Offset(0, 30),
      Offset(coverInfoPage.size.width, 30),
    );
  }
  return textData;
}

  

  PdfBorders bordertypes({bool? left,bool? right,bool? top, bool? bottom, double width = 0,}) {  
  return PdfBorders(
    left: PdfPen(PdfColor(0, 0, 0,left==true ? 255: 0), width: width),
    top: PdfPen(PdfColor(0, 0, 0,top==true ? 255: 0 ), width: width),
    bottom: PdfPen(PdfColor(0, 0, 0,bottom==true ? 255: 0), width:width),
    right: PdfPen(PdfColor(0, 0, 0,right==true ? 255: 0), width: width));
} 

  pageTitles({String? titleName, PdfPage? relatedPage}) {
   PdfGrid pageTitle = PdfGrid();
    pageTitle.style.cellPadding = PdfPaddings(left: 5, top: 5);
    pageTitle.style.font = PdfTrueTypeFont(fontDataBold, 9);
    pageTitle.columns.add(count:1);
    PdfGridRow pageTitleRow = pageTitle.rows.add();    
      pageTitleRow.cells[0].style=PdfGridCellStyle(
                                    backgroundBrush:PdfBrushes.lightGray,
                                    borders:bordertypes(bottom: true));
      pageTitleRow.cells[0].value = titleName;
      pageTitle.draw(
      page: relatedPage,
      bounds: Rect.fromLTWH(
      0, 0, relatedPage!.getClientSize().width, relatedPage.getClientSize().height)
      );    
      return pageTitle;
      }

       gridHeader({String? cell1,cell2,cell3,PdfTextAlignment cell1alignment= PdfTextAlignment.left,
    cell2alignment=PdfTextAlignment.left,cell3alignment=PdfTextAlignment.left, 
    PdfPage? relatedPage}){
    PdfGrid grid = PdfGrid();
    grid.style.cellPadding = PdfPaddings(left: 5, top: 5);
    grid.style.font = PdfTrueTypeFont(fontDataBold, 9);;
    grid.columns.add(count:3);
    grid.columns[0].width=60;
    grid.columns[1].width=110;
    PdfGridRow gridRow = grid.rows.add();    
      gridRow.cells[0].style.stringFormat = PdfStringFormat(
        alignment: cell1alignment,);
      gridRow.cells[0].style.borders=bordertypes(bottom: true,width:0);
      gridRow.cells[0].value = cell1;

      gridRow.cells[1].style.stringFormat = PdfStringFormat(
        alignment: cell2alignment,);
      gridRow.cells[1].style.borders=bordertypes(bottom: true,width:0);
      gridRow.cells[1].value = cell2;
      
      gridRow.cells[2].style.stringFormat = PdfStringFormat(
        alignment: cell3alignment,);
      gridRow.cells[2].style.borders=bordertypes(bottom: true,width:0);
      gridRow.cells[2].value = cell3;
      grid.draw(
      page: relatedPage,
      bounds: Rect.fromLTWH(
      0, 20, relatedPage!.getClientSize().width, relatedPage.getClientSize().height)
      ); 
      return grid; 
  }

    gridData({int? gridDataType, PdfPage? relatedPage,CaseAndBankListJsn? transacitonData,
    CaseAndBankListJsn? fileNoteLst, CaseAndBankListJsn? expenseLst }){
    PdfGrid gridDatas = PdfGrid();
    gridDatas.style.cellPadding = PdfPaddings(left: 5, top: 5);
    //gridDatas.style.font = PdfTrueTypeFont(fontData, 9);
    gridDatas.columns.add(count:3);
    gridDatas.columns[0].width=60;
    gridDatas.columns[1].width=110;
    for(int i=0; i<(gridDataType==1 ?  5 : 
                    gridDataType==2 ? 5 :
                    gridDataType==3 ? 5:1); i++){
      gridDatas.rows.add();
      gridDatas.rows[i].cells[0].style.borders=bordertypes(right: true);
      gridDatas.rows[i].cells[0].value= 
        gridDataType==1 ?  kasaVeBankalarListe?.result??[i] : 
        gridDataType==2 ? kasaVeBankalarListe?.result??[i] : 
        gridDataType==3 ? kasaVeBankalarListe?.result??[i] :"";
      




    }
    gridDatas.draw(
      page: relatedPage,
      bounds: Rect.fromLTWH(
      0, 40, relatedPage!.getClientSize().width, relatedPage.getClientSize().height)
      );  
      return gridDatas;
  }


  

   document.template.top = pwtext(
  textValue: "deneme+",
  aligment: PdfTextAlignment.center,
  fontSize: 18,
  drawLineDown: true,
  //font: PdfTrueTypeFont(fontDataBold,3), // PdfTrueTypeFont'u burada kullanın
);

  final PdfGrid fileItemTypeGrid = PdfGrid();
    fileItemTypeGrid.style.cellPadding = PdfPaddings(left: 5, top: 5);
    //fileItemTypeGrid.style.font = PdfTrueTypeFont(fontData, 9);
    fileItemTypeGrid.columns.add(count:2);
    fileItemTypeGrid.columns[0].width=55;
    PdfGridRow itemTypeRow = fileItemTypeGrid.rows.add();        
      itemTypeRow.cells[0].value = 'Kalem:';
      itemTypeRow.cells[0].style=PdfGridCellStyle(
                                  //font: PdfTrueTypeFont(fontDataBold, 9), 
                                  borders:bordertypes());
      itemTypeRow.cells[0].style.stringFormat=PdfStringFormat();
      itemTypeRow.cells[1].value = itemType ?? "";
      itemTypeRow.cells[1].style.borders = bordertypes();
    PdfLayoutResult? fileItemTypeGridReult = fileItemTypeGrid.draw(
      page: coverInfoPage,
      bounds: Rect.fromLTWH(
      0, 0, coverInfoPage.getClientSize().width, coverInfoPage.getClientSize().height)
      );

       //-------BSN, Esasa No ve Karar No--------------------------------------------  
   final PdfGrid fileNummersGrid = PdfGrid();
    fileNummersGrid.style.cellPadding = PdfPaddings(left: 5,top:5);
    //fileNummersGrid.style.font = PdfTrueTypeFont(fontData, 9);
    fileNummersGrid.columns.add(count:3);
    PdfGridRow nummerRow = fileNummersGrid.rows.add();    
     
      nummerRow.cells[0].value = 'Büro No: '+officeQeueNo ?? "";
      nummerRow.cells[0].style.borders = bordertypes();
      nummerRow.cells[1].value = 'Esas No: '+baseNo ?? "";
      nummerRow.cells[1].style.borders = bordertypes();
      nummerRow.cells[2].value = 'Karar No: '+decisionNo ?? "";
      nummerRow.cells[2].style.borders = bordertypes();
 
   PdfLayoutResult? fileNummersGridResult = fileNummersGrid.draw(
    
     page: coverInfoPage,
     bounds: Rect.fromLTWH(
      0,
      fileItemTypeGridReult!.bounds.bottom , 
      coverInfoPage.getClientSize().width, 
      coverInfoPage.getClientSize().height)
    );

      //-------Hakkında bilgisi-----------------------------------------------------
  final PdfGrid fileAboutGrid = PdfGrid();
    fileAboutGrid.style.cellPadding = PdfPaddings(left: 5, top: 5);
    //fileAboutGrid.style.font = PdfTrueTypeFont(fontData, 9);
    fileAboutGrid.columns.add(count:2);
    fileAboutGrid.columns[0].width=55;
    PdfGridRow fileAboutRow = fileAboutGrid.rows.add();    
      fileAboutRow.cells[0].value = 'Hakkında:';
      fileAboutRow.cells[0].style=PdfGridCellStyle(
                             //    font: PdfTrueTypeFont(fontDataBold, 9), 
                                  borders:bordertypes());
      fileAboutRow.cells[1].value = fileDescription ?? "";
      fileAboutRow.cells[1].style.borders = bordertypes();
    PdfLayoutResult? fileAboutGridResult = fileAboutGrid.draw(
      page: coverInfoPage,
      bounds: Rect.fromLTWH(
        0, 
        fileNummersGridResult!.bounds.bottom ,
        coverInfoPage.getClientSize().width, 
        coverInfoPage.getClientSize().height)
      );  

      //----------------------MÜVEKKİL VE TARAFLAR----------------------------------
  //-------Müvekkil ve Taraf Başlıkları-----------------------------------------
  final PdfGrid clientSideTitleGrid = PdfGrid();
    clientSideTitleGrid.style.cellPadding = PdfPaddings(left: 5, top: 5);
   // clientSideTitleGrid.style.font = PdfTrueTypeFont(fontData, 9); //burası bold olacak örnek.
    clientSideTitleGrid.columns.add(count:2);
    PdfGridRow clientSideTitleRow = clientSideTitleGrid.rows.add();    
      clientSideTitleRow.cells[0].value = 'Müvekkiller:';
      clientSideTitleRow.cells[0].style = PdfGridCellStyle(
                                  //font: PdfTrueTypeFont(fontDataBold, 9), 
                                  borders:bordertypes(bottom: true, right: true,width: 1));
      clientSideTitleRow.cells[1].value = 'Karşı Taraf';
      clientSideTitleRow.cells[1].style= PdfGridCellStyle(
                                  //font: PdfTrueTypeFont(fontDataBold, 9), 
                                  borders:bordertypes(bottom: true, width: 1));
    PdfLayoutResult? clientSideTitleGridRsult = clientSideTitleGrid.draw(
      page: coverInfoPage,
      bounds: Rect.fromLTWH(
        0, 
        fileAboutGridResult!.bounds.bottom+50 ,
        coverInfoPage.getClientSize().width, 
        coverInfoPage.getClientSize().height)
      );  

     
      




      

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
    sheet1.getRangeByIndex(1, 4).columnWidth = 12;
    sheet1.getRangeByIndex(1, 5).columnWidth = 12;
    
    
 
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
    sheet1.getRangeByName('D3:E3').cellStyle.backColor = '#D9E1F2';
    sheet1.getRangeByName('D3:E3').cellStyle.hAlign =  xlsio.HAlignType.right;
    sheet1.getRangeByName('D3:E3').cellStyle.vAlign =  xlsio.VAlignType.center;
    sheet1.getRangeByName('D3:E3').cellStyle.bold = true;

    sheet1.getRangeByName('A3:A7').cellStyle.vAlign =  xlsio.VAlignType.center;
    sheet1.getRangeByName('A1:A3').rowHeight=20;
    sheet1.getRangeByName('A1:A2').cellStyle.bold = true;
    sheet1.getRangeByName('A1').text="LOKASYON:";   sheet1.getRangeByName('B2').text=widget.containerTitle;
    sheet1.getRangeByName('A2').text="Cihaz Adı:";  sheet1.getRangeByName('B2').text=widget.deviceTitle;
 

    sheet1.getRangeByIndex(3, 1).text = 'Tarih';
    sheet1.getRangeByIndex(3, 2).text = 'Fatura Tipi';
    sheet1.getRangeByIndex(3, 3).text = 'Cari';
    sheet1.getRangeByIndex(3, 4).text = 'Belge No';
    sheet1.getRangeByIndex(3, 5).text = 'Tutar';

     for(int i=0;i<=getdeviceTempHumiList.length-1;i++){
      sheet1.getRangeByIndex(i+4,1).rowHeight = 20;
      sheet1.getRangeByIndex(i+4, 1).text = getdeviceTempHumiList[i].time;
      sheet1.getRangeByIndex(i+4, 2).text = getdeviceTempHumiList[i].bill.toString();
      sheet1.getRangeByIndex(i+4, 3).text = getdeviceTempHumiList[i].current.toString();
      sheet1.getRangeByIndex(i+4, 4).text = getdeviceTempHumiList[i].doc.toString();
      sheet1.getRangeByIndex(i+4, 5).text = getdeviceTempHumiList[i].amount.toString();
      sheet1.getRangeByIndex(i+4,2).cellStyle.hAlign = xlsio.HAlignType.right;
      sheet1.getRangeByIndex(i+4,3).cellStyle.hAlign =  xlsio.HAlignType.right;
      sheet1.getRangeByIndex(i+4,4).cellStyle.hAlign = xlsio.HAlignType.right;
      sheet1.getRangeByIndex(i+4,5).cellStyle.hAlign =  xlsio.HAlignType.right;
      sheet1.getRangeByIndex(i+4,1).cellStyle.borders.right.lineStyle = xlsio.LineStyle.thin;
      sheet1.getRangeByIndex(i+4,2).cellStyle.borders.right.lineStyle = xlsio.LineStyle.thin;
      sheet1.getRangeByIndex(i+4,3).cellStyle.borders.right.lineStyle = xlsio.LineStyle.thin;
      sheet1.getRangeByIndex(i+4,4).cellStyle.borders.right.lineStyle = xlsio.LineStyle.thin;
      sheet1.getRangeByIndex(i+4,5).cellStyle.borders.right.lineStyle = xlsio.LineStyle.thin;
     
     
    }
    
   final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

     
  
   
    await FileSaveHelper.saveAndLaunchFile(bytes, 'OMWeatherReport.xlsx');
  
 
  }
   Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return 
          
          SimpleDialog(
            
          
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
                child: const Text('İndir'),
              ),
                SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Fatura Detayı'),
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
            "Silmek İstediğinize Emin misiniz ?",
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anaEkranColor,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Muhasebe Raporu ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: anaEkranColor,
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 665,
              width: double.infinity,
              decoration: BoxDecoration(color: anaEkranColor),
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
                    margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                    height: 275,
                    width: double.infinity,
                    decoration: BoxDecoration(color: anaEkranColor),
                    child: Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,

                          //padding: const EdgeInsets.all(8),
                          itemCount: 2,
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
                                               _showSimpleDialog();
                                             
                                              },
                                              backgroundColor:
                                                  Color(0xFF0392CF),
                                              foregroundColor: Colors.white,
                                              icon: Icons.settings,
                                              label: 'Düzenle',
                                            ),
                                          ],
                                        ),
                                      //muhasabeRaporlariGiderTest[index][0].toString(),
                                      child: MuhasabeRaporlariContainer(
                                          firmaAd:
                                              muhasabeRaporlariGiderTest[index]
                                                      [0]
                                                  .toString(),
                                                    belgeNoMuhasabe:
                                              muhasabeRaporlariGiderTest[index]
                                                      [1]
                                                  .toString(),
                                          tutar:
                                              muhasabeRaporlariGiderTest[index]
                                                      [2]
                                                  .toString(),
                                          giderMuahasebe:
                                              muhasabeRaporlariGiderTest[index]
                                                      [3]
                                                  .toString(),
                                          tarih:
                                              muhasabeRaporlariGiderTest[index]
                                                      [4]
                                                  .toString(), )),
                                ));
                          }),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                    height: 275,
                    width: double.infinity,
                    decoration: BoxDecoration(color: anaEkranColor),
                    child: Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,

                          //padding: const EdgeInsets.all(8),
                          itemCount: 2,
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
                                               _showSimpleDialog();
                                             
                                              },
                                              backgroundColor:
                                                  Color(0xFF0392CF),
                                              foregroundColor: Colors.white,
                                              icon: Icons.settings,
                                              label: 'Düzenle',
                                            ),
                                          ],
                                        ),
                                  //muhasabeRaporlariGelirTest[index][0].toString(),
                                  child: GelirMuhasebe(
                                    firmaAd: muhasabeRaporlariGelirTest[index]
                                            [0]
                                        .toString(),
                                           tutar: muhasabeRaporlariGelirTest[index][1]
                                        .toString(),
                                    belgeNoMuasabe: muhasabeRaporlariGelirTest[index][2]
                                        .toString(),
                                    gelirMuhasebeString:
                                        muhasabeRaporlariGelirTest[index][3]
                                            .toString(),
                                    tarihGelir:
                                        muhasabeRaporlariGelirTest[index][4]
                                            .toString(),
                                  ),
                                )));
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 5, 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox.fromSize(
  size: Size(100, 73),

    child: Material(
        borderRadius: BorderRadius.circular(15),
      color: Color.fromRGBO(92, 90, 115, 1),
        child: InkWell(
      
        onTap: () {
          _createPDF("145", "baseNo", "decisionNo", "fileDescription", "itemType");
        }, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Icon(
                          // <-- Icon
                          Icons.download,
                          size: 24.0,
                          color: Colors.white), // <-- Icon
            Text(
                        'PDF',
                        style: TextStyle(color: Colors.white),
                      ), // <-- Text
          ],
        ),
      ),
    ),
  
)
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(150, 10, 5, 0),
                  decoration: BoxDecoration(
                    
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox.fromSize(
  size: Size(100, 73),

    child: Material(
        borderRadius: BorderRadius.circular(15),
      color: Color.fromRGBO(92, 90, 115, 1),
      child: InkWell(
      
        onTap: () {
          _createExcel();
        }, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Icon(
                          // <-- Icon
                          Icons.download,
                          size: 24.0,
                          color: Colors.white), // <-- Icon
            Text(
                        'Excel',
                        style: TextStyle(color: Colors.white),
                      ), // <-- Text
          ],
        ),
      ),
    ),
  
)
                  ),
                ),
              ],
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
     
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
      child:SingleChildScrollView(
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
     
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Color.fromRGBO(50, 55, 59, 1),
      ),
      child: SingleChildScrollView(
      child:Column(
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

  class ChartData {
        ChartData(this.time,this.bill,this.current,this.doc,this.amount,);
        final dynamic time;
         final String bill;
          final String current;
            final String doc;
          final num amount;

   
        
    }

    class FileSaveHelper {
  ///To save the Excel file in the device
  static Future<void> saveAndLaunchFile(
      List<int> bytes, String fileName) async {
    String? path;
    if (Platform.isAndroid ||
        Platform.isIOS ||
        Platform.isLinux ||
        Platform.isWindows) {
      final Directory directory = await getApplicationSupportDirectory();
      path = directory.path;
    } else {
      path = await PathProviderPlatform.instance.getApplicationSupportPath();
    }
    final File file =
        File(Platform.isWindows ? '$path\\$fileName' : '$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    if (Platform.isAndroid || Platform.isIOS) {
      OpenFile.open(file.path);
      // Bu kısımdan aşağısı daha sonra SİLİNECEK!!!!!
    } else if (Platform.isWindows) {
      await Process.run('start', <String>['$path\\$fileName'],
          runInShell: true);
    } else if (Platform.isMacOS) {
      await Process.run('open', <String>['$path/$fileName'], runInShell: true);
    } else if (Platform.isLinux) {
      await Process.run('xdg-open', <String>['$path/$fileName'],
          runInShell: true);
    }
  }
}
