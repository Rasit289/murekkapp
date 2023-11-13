// To parse this JSON data, do
//
//     final caseAndBankListJsn = caseAndBankListJsnFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

CaseAndBankListJsn caseAndBankListJsnFromJson(String str) => CaseAndBankListJsn.fromJson(json.decode(str));

String caseAndBankListJsnToJson(CaseAndBankListJsn data) => json.encode(data.toJson());

class CaseAndBankListJsn {
    bool? success;
    Result? result;

    CaseAndBankListJsn({
        this.success,
        this.result,
    });

    factory CaseAndBankListJsn.fromJson(Map<String, dynamic> json) => CaseAndBankListJsn(
        success: json["success"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
    };
}

class Result {
    double? totalCase;
    double? totalBank;
    double? cacheTotal;
    List<AccountList>? accountList;

    Result({
        this.totalCase,
        this.totalBank,
        this.cacheTotal,
        this.accountList,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        totalCase: json["totalCase"]?.toDouble(),
        totalBank: json["totalBank"]?.toDouble(),
        cacheTotal: json["cacheTotal"]?.toDouble(),
        accountList: json["accountList"] == null ? [] : List<AccountList>.from(json["accountList"]!.map((x) => AccountList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalCase": totalCase,
        "totalBank": totalBank,
        "cacheTotal": cacheTotal,
        "accountList": accountList == null ? [] : List<dynamic>.from(accountList!.map((x) => x.toJson())),
    };
}

class AccountList {
    int? accountId;
    String? accountName;
    String? foreignCurrency;
    double? balance;

    AccountList({
        this.accountId,
        this.accountName,
        this.foreignCurrency,
        this.balance,
    });

    factory AccountList.fromJson(Map<String, dynamic> json) => AccountList(
        accountId: json["accountId"],
        accountName: json["accountName"],
        foreignCurrency: json["foreignCurrency"],
        balance: json["balance"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "accountName": accountName,
        "foreignCurrency": foreignCurrency,
        "balance": balance,
    };
}

//-----------------Case And Bank listesini çeken jsonfonksiyonu------------------

Future<CaseAndBankListJsn> caseAndBankFunc()async{

  final response =  await rootBundle.loadString("asssets/simpledata/CaseAndBank.json");
    final data = await jsonDecode(response);
    final jsoncontrol = CaseAndBankListJsn.fromJson(data);
   

    
 return jsoncontrol;
}

