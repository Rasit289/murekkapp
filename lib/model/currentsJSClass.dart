// To parse this JSON data, do
//
//     final currentsListJsn = currentsListJsnFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

CurrentsListJsn currentsListJsnFromJson(String str) => CurrentsListJsn.fromJson(json.decode(str));

String currentsListJsnToJson(CurrentsListJsn data) => json.encode(data.toJson());

class CurrentsListJsn {
    bool? success;
    Result? result;

    CurrentsListJsn({
        this.success,
        this.result,
    });

    factory CurrentsListJsn.fromJson(Map<String, dynamic> json) => CurrentsListJsn(
        success: json["success"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
    };
}

class Result {
    double? collectionInMonth;
    List<CurrentList>? currentList;

    Result({
        this.collectionInMonth,
        this.currentList,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        collectionInMonth: json["collectionInMonth"],
        currentList: json["currentList"] == null ? [] : List<CurrentList>.from(json["currentList"]!.map((x) => CurrentList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "collectionInMonth": collectionInMonth,
        "currentList": currentList == null ? [] : List<dynamic>.from(currentList!.map((x) => x.toJson())),
    };
}

class CurrentList {
    int? currentId;
    String? currentName;
    String? currentEmail;
    int? currenctTaxId;
    String? currenctTaxNo;
    String? currentPhone;
    int? cityId;
    int? countryId;
    double? currentBalanceDue;

    CurrentList({
        this.currentId,
        this.currentName,
        this.currentEmail,
        this.currenctTaxId,
        this.currenctTaxNo,
        this.currentPhone,
        this.cityId,
        this.countryId,
        this.currentBalanceDue,
    });

    factory CurrentList.fromJson(Map<String, dynamic> json) => CurrentList(
        currentId: json["currentId"],
        currentName: json["currentName"],
        currentEmail: json["currentEmail"],
        currenctTaxId: json["currenctTaxId"],
        currenctTaxNo: json["currenctTaxNo"],
        currentPhone: json["currentPhone"],
        cityId: json["cityId"],
        countryId: json["countryId"],
        currentBalanceDue: json["currentBalanceDue"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "currentId": currentId,
        "currentName": currentName,
        "currentEmail": currentEmail,
        "currenctTaxId": currenctTaxId,
        "currenctTaxNo": currenctTaxNo,
        "currentPhone": currentPhone,
        "cityId": cityId,
        "countryId": countryId,
        "currentBalanceDue": currentBalanceDue,
    };
}


//-----------------Currents(cariler) listesini çeken jsonfonksiyonu------------------

Future<CurrentsListJsn> currentfunc() async {
  final responsecurrents =
      await rootBundle.loadString("asssets/simpledata/Currents.json");
  final datacurrents = await jsonDecode(responsecurrents);
  final jsoncontrolcurrents = CurrentsListJsn.fromJson(datacurrents);

  return jsoncontrolcurrents;
}

