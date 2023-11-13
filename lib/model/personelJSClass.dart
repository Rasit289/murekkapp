// To parse this JSON data, do
//
//     final personelListJsn = personelListJsnFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

PersonelListJsn personelListJsnFromJson(String str) => PersonelListJsn.fromJson(json.decode(str));

String personelListJsnToJson(PersonelListJsn data) => json.encode(data.toJson());

class PersonelListJsn {
    bool? success;
    List<Result>? result;

    PersonelListJsn({
        this.success,
        this.result,
    });

    factory PersonelListJsn.fromJson(Map<String, dynamic> json) => PersonelListJsn(
        success: json["success"],
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    int? id;
    String? nameSurname;
    String? phone;
    String? email;
    String? duty;
    String? tcno;

    Result({
        this.id,
        this.nameSurname,
        this.phone,
        this.email,
        this.duty,
        this.tcno,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        nameSurname: json["nameSurname"],
        phone: json["phone"],
        email: json["email"],
        duty: json["duty"],
        tcno: json["tcno"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameSurname": nameSurname,
        "phone": phone,
        "email": email,
        "duty": duty,
        "tcno": tcno,
    };
}

//-----------------Personel listesini çeken jsonfonksiyonu------------------

Future<PersonelListJsn> personFunc()async{

  final response =  await rootBundle.loadString("asssets/simpledata/PersonList.json");
    final data = await jsonDecode(response);
    final jsoncontrol = PersonelListJsn.fromJson(data);
   

    
 return jsoncontrol;
}

