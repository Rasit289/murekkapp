import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murekkapp/widgets/widgetBilgiler.dart';

class WidgetFilePicker extends StatefulWidget {
  const WidgetFilePicker({super.key});

  @override
  State<WidgetFilePicker> createState() => _WidgetFilePickerState();
}

class _WidgetFilePickerState extends State<WidgetFilePicker> {
  FilePickerResult? result;
  //belgeyi silmemizi yada vazgeçmemizi sağlayan ShowDialog
  Future<void> _dialogBuilder() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Belge Silinsin mi ?",
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(53, 58, 64, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //if (result != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      'Yüklenen Belgeler:',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  //yüklenen belgelerin bulunduğu Container
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: result?.files.length ?? 0,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.fromLTRB(0, 2, 20, 2),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromRGBO(53, 58, 64, 1),
                            ),
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Center(
                                  child: Slidable(
                                    key: const ValueKey(0),
                                    startActionPane: ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        //eklenen belgelerin silmesini sağlar
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

                                  
                                    child: Stack(
                                      children: [
                                        Container(
                                          //yüklenen belgenin ismini ve ikonu koyar
                                          child: Row(
                                            children: [
                                              
                                              Icon(
                                                Icons
                                                    .arrow_right_alt, // Drawer ikonu
                                                color: Colors
                                                    .white, //DrawerItem İkon rengi
                                              ),
                                              Text(
                                                  result?.files[index].name ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          );
                        }),
                  ),
                ],
              ),
            ),
            //belge eklememizi sağlayan buton
            Container(
              margin: const EdgeInsets.fromLTRB(20, 2, 20, 10),
              height: 40,
              width: double.infinity,
              child: Center(
                child: BelgeEkleButton(
                  buttonText: "Belge Ekle",
                  onTap: () async {
                    result = await FilePicker.platform
                        .pickFiles(allowMultiple: true);
                    if (result == null) {
                      print("No file selected");
                    } else {
                      setState(() {});
                      result?.files.forEach((element) {
                        print(element.name);
                      });
                    }
                  },
                ),
              ),
            ),
            //fatura açıklamasının yapıldığı kısım
            Container(
              margin: const EdgeInsets.fromLTRB(20, 2, 20, 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Açıklama',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(6, 0, 6, 17),
              child: Address(),
            ),
          ],
        ),
      ),
    );
  }
}



//Belge Eklememizi sağlayan butonun tasarlandığı Class
class BelgeEkleButton extends StatelessWidget {
  const BelgeEkleButton({
    Key? key,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  final String buttonText;
  final Function()? onTap;

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      height: 70,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: FloatingActionButton.extended(
        heroTag: "butonEkle",

        label: Text(
          'Belge Ekle ',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold),
        ), // <-- Text
        backgroundColor: Color.fromARGB(255, 2, 94, 168),
        icon: const Icon(
          // <-- Icon
          Icons.cloud_download_outlined,
          size: 30.0,
        ),
        onPressed: onTap,
      ),
    );
  }
}


