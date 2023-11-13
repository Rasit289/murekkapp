// To parse this JSON data, do
//
//     final caseFlowListJsn = caseFlowListJsnFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

CaseFlowListJsn caseFlowListJsnFromJson(String str) => CaseFlowListJsn.fromJson(json.decode(str));

String caseFlowListJsnToJson(CaseFlowListJsn data) => json.encode(data.toJson());

class CaseFlowListJsn {
    bool? success;
    List<Result>? result;

    CaseFlowListJsn({
        this.success,
        this.result,
    });

    factory CaseFlowListJsn.fromJson(Map<String, dynamic> json) => CaseFlowListJsn(
        success: json["success"],
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    int? invoiceId;
    String? processType;
    double? amount;
    String? date;
    String? info;
    List<Doc>? docs;

    Result({
        this.invoiceId,
        this.processType,
        this.amount,
        this.date,
        this.info,
        this.docs,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        invoiceId: json["invoiceId"],
        processType: json["processType"],
        amount: json["amount"],
        date: json["date"],
        info: json["info"],
        docs: json["docs"] == null ? [] : List<Doc>.from(json["docs"]!.map((x) => Doc.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "invoiceId": invoiceId,
        "processType": processType,
        "amount": amount,
        "date": date,
        "info": info,
        "docs": docs == null ? [] : List<dynamic>.from(docs!.map((x) => x.toJson())),
    };
}

class Doc {
    String? docDate;
    String? docName;
    String? downloadLink;

    Doc({
        this.docDate,
        this.docName,
        this.downloadLink,
    });

    factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        docDate: json["docDate"],
        docName: json["docName"],
        downloadLink: json["downloadLink"],
    );

    Map<String, dynamic> toJson() => {
        "docDate": docDate,
        "docName": docName,
        "downloadLink": downloadLink,
    };
}

//-----------------CaseFlow listesini çeken jsonfonksiyonu------------------

Future<CaseFlowListJsn> caseFlowFunc()async{

  final response =  await rootBundle.loadString("asssets/simpledata/CaseFlow.json");
    final data = await jsonDecode(response);
    final jsoncontrol = CaseFlowListJsn.fromJson(data);
   

    
 return jsoncontrol;
}
