// To parse this JSON data, do
//
//     final dashboardListJsn = dashboardListJsnFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart';
DashboardListJsn dashboardListJsnFromJson(String str) => DashboardListJsn.fromJson(json.decode(str));

String dashboardListJsnToJson(DashboardListJsn data) => json.encode(data.toJson());

class DashboardListJsn {
    bool? success;
    Result? result;

    DashboardListJsn({
        this.success,
        this.result,
    });

    factory DashboardListJsn.fromJson(Map<String, dynamic> json) => DashboardListJsn(
        success: json["success"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
    };
}

class Result {
    double? allAssets;
    double? moneyCase;
    double? moneyBank;
    double? willCollection;
    double? willPayment;
    List<MoneyGraphic>? moneyGraphic;

    Result({
        this.allAssets,
        this.moneyCase,
        this.moneyBank,
        this.willCollection,
        this.willPayment,
        this.moneyGraphic,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        allAssets: json["allAssets"]?.toDouble(),
        moneyCase: json["moneyCase"]?.toDouble(),
        moneyBank: json["moneyBank"]?.toDouble(),
        willCollection: json["willCollection"]?.toDouble(),
        willPayment: json["willPayment"]?.toDouble(),
        moneyGraphic: json["moneyGraphic"] == null ? [] : List<MoneyGraphic>.from(json["moneyGraphic"]!.map((x) => MoneyGraphic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "allAssets": allAssets,
        "moneyCase": moneyCase,
        "moneyBank": moneyBank,
        "willCollection": willCollection,
        "willPayment": willPayment,
        "moneyGraphic": moneyGraphic == null ? [] : List<dynamic>.from(moneyGraphic!.map((x) => x.toJson())),
    };
}

class MoneyGraphic {
    String? date;
    double? inCome;
    double? expense;

    MoneyGraphic({
        this.date,
        this.inCome,
        this.expense,
    });

    factory MoneyGraphic.fromJson(Map<String, dynamic> json) => MoneyGraphic(
        date: json["date"],
        inCome: json["inCome"]?.toDouble(),
        expense: json["expense"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "inCome": inCome,
        "expense": expense,
    };
}

//-----------------Dashobard listesini çeken jsonfonksiyonu------------------

Future<DashboardListJsn> dashboardfunc()async{

  final response =  await rootBundle.loadString("asssets/simpledata/DashboardList.json");
    final data = await jsonDecode(response);
    final jsoncontrol = DashboardListJsn.fromJson(data);
   

    
 return jsoncontrol;
}
