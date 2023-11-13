import 'package:flutter/material.dart';
import '../const.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  final String buttonText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 0.8,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 40,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(33, 36, 41, 1),
            ),
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton2 extends StatelessWidget {
  const LoginButton2({
    Key? key,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  final String buttonText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 0.8,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(2),

            height: 30,
            width: 150,

            //height: 40,
            //width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: girisColor),
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: girisFontColor,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    Key? key,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  final String buttonText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 0.8,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(2),

            height: 30,
            width: 150,

            //height: 40,
            //width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: kayitOlColor),
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, color: kayitOlFontColor
                  //fontWeight: FontWeight.bold
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  const AddButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 48, 192, 9)),
      child: IconButton(
        icon: const Icon(Icons.add_circle_outline_sharp),
        color: Colors.white,
        iconSize: 38,
        onPressed: widget.onTap,
      ),
    );
  }
}

class IleriOkButton extends StatelessWidget {
  const IleriOkButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      height: 30,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: anaEkranColor),
      child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: onTap,
          backgroundColor: anaEkranColor,
          //tooltip: 'Increment',
          child: const Icon(
            Icons.arrow_forward_outlined,
            size: 30,
            color: Colors.white,
          )),
    );
  }
}

class GeriOkButonu extends StatelessWidget {
  const GeriOkButonu({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;
  //  Icons.arrow_back_outlined,

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      height: 30,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: anaEkranColor),
      child: FloatingActionButton(
          heroTag: "btn2",
          onPressed: onTap,
          backgroundColor: anaEkranColor,
          //tooltip: 'Increment',
          child: const Icon(
            Icons.arrow_back_outlined,
            size: 30,
            color: Colors.white,
          )),
    );
  }
}




class CariAdiButton extends StatefulWidget {
  CariAdiButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<CariAdiButton> createState() => _CariAdiButtonState();
}

class _CariAdiButtonState extends State<CariAdiButton> {
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
              items: tedarikciDrop
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

class TarihButton extends StatefulWidget {
  const TarihButton({super.key});

  @override
  State<TarihButton> createState() => _TarihButtonState();
}

class _TarihButtonState extends State<TarihButton> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 155,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Center(
            child: TextField(
          controller: dateinput,
          decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today), labelText: ""),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101));

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              //you can implement different kind of Date Format here according to your requirement

              setState(() {
                dateinput.text =
                    formattedDate; //set output date to TextField value.
              });
            } else {
              print("Date is not selected");
            }
          },
        )));
  }
}

class BelgeNo extends StatefulWidget {
  const BelgeNo({super.key});

  @override
  State<BelgeNo> createState() => _BelgeNoState();
}

class _BelgeNoState extends State<BelgeNo> {
  TextEditingController belgeinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 155,
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


class AlisFiyatiHizmet extends StatefulWidget {
  const AlisFiyatiHizmet({super.key});

  @override
  State<AlisFiyatiHizmet> createState() => _AlisFiyatiHizmetState();
}

class _AlisFiyatiHizmetState extends State<AlisFiyatiHizmet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
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

class aciklamaGelir extends StatefulWidget {
  const aciklamaGelir({super.key});

  @override
  State<aciklamaGelir> createState() => _aciklamaGelirState();
}

class _aciklamaGelirState extends State<aciklamaGelir> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 63,
        width: double.infinity,
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
class hizmetNumericField extends StatefulWidget {
  const hizmetNumericField({super.key});

  @override
  State<hizmetNumericField> createState() => _hizmetNumericFieldState();
}

class _hizmetNumericFieldState extends State<hizmetNumericField> {
   @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Center(
          child: TextFormField(
             keyboardType: TextInputType.number,
            decoration: const InputDecoration(
           
              border: UnderlineInputBorder(),
            ),
          ),
        ));
  }
}


class CariAciklama extends StatefulWidget {
  const CariAciklama({super.key});

  @override
  State<CariAciklama> createState() => _CariAciklamaState();
}

class _CariAciklamaState extends State<CariAciklama> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: double.infinity,
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


class FaturalarDropDown extends StatefulWidget {
  const FaturalarDropDown({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<FaturalarDropDown> createState() => _FaturalarDropDownState();
}

class _FaturalarDropDownState extends State<FaturalarDropDown> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Faturalar',
      'Müşteriler',
      'Hizmet/Ürünler',
    ];

    String? selectedValue;

    return Container(
        height: 50,
        width: double.infinity,
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

class KDVDropDown extends StatefulWidget {
  const KDVDropDown({super.key});

  @override
  State<KDVDropDown> createState() => _KDVDropDownState();
}

class _KDVDropDownState extends State<KDVDropDown> {
  String value1 = kdvlist.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value1,
      dropdownColor: Color.fromRGBO(57, 56, 72, 1),
      iconSize: 40,
      underline: SizedBox(),
      elevation: 16,
      style: const TextStyle(color: Colors.white, fontSize: 22),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          value1 = value!;
        });
      },
      items: kdvlist.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          onTap: () {
            setState(() {
              if (value1 == "four") {
                print("ff");
              }

              print(value1);
            });
          },
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      dropdownColor: Color.fromRGBO(57, 56, 72, 1),
      iconSize: 40,
      underline: SizedBox(),
      elevation: 16,
      style: const TextStyle(color: Colors.white, fontSize: 22),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          onTap: () {},
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.white;
    }

    return Checkbox(
      checkColor: Colors.black,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class stokTakibiChechkBox extends StatefulWidget {
  const stokTakibiChechkBox({super.key});

  @override
  State<stokTakibiChechkBox> createState() => _stokTakibiChechkBoxState();
}

class _stokTakibiChechkBoxState extends State<stokTakibiChechkBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
       return Colors.white;
    }

    return Checkbox(
      checkColor: Colors.black,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
