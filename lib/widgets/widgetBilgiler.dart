import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';



Widget FaturaAra() {
  return Container(
      height: 33,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Center(
        child: TextFormField(
          decoration: const InputDecoration(
              filled: true, //<-- SEE HERE
              fillColor: Color.fromRGBO(70, 70, 87, 1),
              hintText: 'Fatura Ara:',
              hintStyle: TextStyle(color: Colors.white)),
        ),
      ));
}

class SmallTextField extends StatefulWidget {
  const SmallTextField({super.key});

  @override
  State<SmallTextField> createState() => _SmallTextFieldState();
}

class _SmallTextFieldState extends State<SmallTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Center(
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
          ),
        ));
  }
}

class UrunEkleButton extends StatefulWidget {
  const UrunEkleButton({super.key});

  @override
  State<UrunEkleButton> createState() => _UrunEkleButtonState();
}

class _UrunEkleButtonState extends State<UrunEkleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      height: 65,
      width: 220,
      decoration: const BoxDecoration(),
      child: FloatingActionButton.extended(
        label: const Text('Ürün/Hizmet Ekle'), // <-- Text
        backgroundColor: Color.fromRGBO(59, 210, 158, 1),

        onPressed: () {},
      ),
    );
  }
}

//iskonto uygulamayı sağlayan butonun tasarımının yapıldğı class
class IndirimUygulaButton extends StatefulWidget {
  const IndirimUygulaButton({super.key});

  @override
  State<IndirimUygulaButton> createState() => _IndirimUygulaButtonState();
}

class _IndirimUygulaButtonState extends State<IndirimUygulaButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 0.8,
        borderRadius: BorderRadius.circular(2),
        child: InkWell(
          onTap: null,
          child: Container(
            padding: const EdgeInsets.all(2),

            height: 39,
            width: 220,

            //height: 40,
            //width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: const Color.fromRGBO(58, 209, 158, 1)),
            child: const Text(
              "İskonto Uygula",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FaturayiKaydet extends StatefulWidget {
  const FaturayiKaydet({super.key});

  @override
  State<FaturayiKaydet> createState() => _FaturayiKaydetState();
}

class _FaturayiKaydetState extends State<FaturayiKaydet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 0.8,
        borderRadius: BorderRadius.circular(2),
        child: InkWell(
          onTap: null,
          child: Container(
            padding: const EdgeInsets.all(2),

            height: 42,
            width: 220,

            //height: 40,
            //width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color.fromRGBO(237, 163, 4, 1)),
            child: const Text(
              "Faturayı Kaydet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget raporla() {
  return Center(
    child: Material(
      elevation: 0.8,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: null,
        child: Container(
          padding: const EdgeInsets.all(12),

          height: 50,
          width: 180,

          //height: 40,
          //width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 39, 160, 6)),
          child: const Text(
            "Rapor Oluştur",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold
                //fontWeight: FontWeight.bold
                ),
          ),
        ),
      ),
    ),
  );
}

class YeniHizmetMiktar extends StatefulWidget {
  const YeniHizmetMiktar({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<YeniHizmetMiktar> createState() => _YeniHizmetMiktarState();
}

class _YeniHizmetMiktarState extends State<YeniHizmetMiktar> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 125,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: Text(
                '',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              buttonStyleData: const ButtonStyleData(
                height: 25,
                width: double.infinity,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 27,
              ),
            ),
          ),
        ));
  }
}

class IlVeilce extends StatefulWidget {
  const IlVeilce({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<IlVeilce> createState() => _IlVeilceState();
}

class _IlVeilceState extends State<IlVeilce> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: Text(
                '',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              buttonStyleData: const ButtonStyleData(
                height: 25,
                width: double.infinity,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 27,
              ),
            ),
          ),
        ));
  }
}

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Center(
          child: TextFormField(),
        ));
  }
}

class KaydetButton extends StatefulWidget {
  const KaydetButton({super.key});

  @override
  State<KaydetButton> createState() => _KaydetButtonState();
}

class _KaydetButtonState extends State<KaydetButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 0.8,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: null,
          child: Container(
            padding: const EdgeInsets.all(5),

            height: 40,
            width: 100,

            //height: 40,
            //width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(4, 249, 8, 1)),
            child: const Text(
              "Kaydet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VazgecButton extends StatefulWidget {
  const VazgecButton({super.key});

  @override
  State<VazgecButton> createState() => _VazgecButtonState();
}

class _VazgecButtonState extends State<VazgecButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 0.8,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: null,
          child: Container(
            padding: const EdgeInsets.all(5),

            height: 40,
            width: 100,

            //height: 40,
            //width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: const Text(
              "Vazgeç",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
