import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../const.dart';

class hizmetAdiDropDown extends StatefulWidget {
 hizmetAdiDropDown({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<hizmetAdiDropDown> createState() => _hizmetAdiDropDownState();
}

class _hizmetAdiDropDownState extends State<hizmetAdiDropDown> {
  @override
  Widget build(BuildContext context) {
      return Container(
        height: 35,
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
              items: items2
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
              value: cariDeger,
              onChanged: (value) {
                setState(() {
                  cariDeger = value as String;
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

class CariTipiDw extends StatefulWidget {
  CariTipiDw({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<CariTipiDw> createState() => _CariTipiDwState();
}
class _CariTipiDwState extends State<CariTipiDw> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
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
              items: items2
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
              value: cariDeger,
              onChanged: (value) {
                setState(() {
                  cariDeger = value as String;
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
class tevkifatDropdown extends StatefulWidget {
  tevkifatDropdown({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final Function()? onTap;
  @override
  State<tevkifatDropdown> createState() => _tevkifatDropdownState();
}
class _tevkifatDropdownState extends State<tevkifatDropdown> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: Text(
                '',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: tevkifatDrop
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
class kasalarDropdown extends StatefulWidget {
  kasalarDropdown({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final Function()? onTap;
  @override
  State<kasalarDropdown> createState() => _kasalarDropdownState();
}
class _kasalarDropdownState extends State<kasalarDropdown> {
  String? selectedValue = "Tüm Kasalar";
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
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
              items: kasalarDrop
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

class odemeHareketTuru extends StatefulWidget {
  odemeHareketTuru({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<odemeHareketTuru> createState() => _odemeHareketTuruState();
}

class _odemeHareketTuruState extends State<odemeHareketTuru> {
  String? selectedValue = "Havale/Eft";
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
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
              items: hareketTuruDrop
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

class hareketTuruDropdown extends StatefulWidget {
  hareketTuruDropdown({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final Function()? onTap;
  @override
  State<hareketTuruDropdown> createState() => _hareketTuruDropdownState();
}

class _hareketTuruDropdownState extends State<hareketTuruDropdown> {
  String? selectedValue = "Havale/Eft";
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
              items: hareketTuruDrop
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

class islemTuruDropdown extends StatefulWidget {
  islemTuruDropdown({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final Function()? onTap;
  @override
  State<islemTuruDropdown> createState() => _islemTuruDropdownState();
}

class _islemTuruDropdownState extends State<islemTuruDropdown> {
  String? selectedValue = "Para Girişi";
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
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
              items: islemTuruDrop
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
class hesapTuruDropdown extends StatefulWidget {
  hesapTuruDropdown({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<hesapTuruDropdown> createState() => _hesapTuruDropdownState();
}
class _hesapTuruDropdownState extends State<hesapTuruDropdown> {
  String? selectedValue = "Kasa";
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
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
              items: hesapTuruDrop
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

class vergiKoduDropdown extends StatefulWidget {
  vergiKoduDropdown({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<vergiKoduDropdown> createState() => _vergiKoduDropdownState();
}

class _vergiKoduDropdownState extends State<vergiKoduDropdown> {
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
              items: birimDrop
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

class bakiyeDurumuDropdown extends StatefulWidget {
  bakiyeDurumuDropdown({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<bakiyeDurumuDropdown> createState() => _bakiyeDurumuDropdownState();
}

class _bakiyeDurumuDropdownState extends State<bakiyeDurumuDropdown> {
  String? selectedValue = "Borcu Yok";
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
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
              items: bakiyeDurumuDrop
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

class paraCinsiDrop extends StatefulWidget {
  paraCinsiDrop({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  State<paraCinsiDrop> createState() => _paraCinsiDropState();
}

class _paraCinsiDropState extends State<paraCinsiDrop> {
  String? selectedValue = "TL";
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
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
              items: paraCinsiDropDown
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
