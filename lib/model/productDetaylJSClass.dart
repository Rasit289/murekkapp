// To parse this JSON data, do
//
//     final productDetaylJsn = productDetaylJsnFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

ProductDetaylJsn productDetaylJsnFromJson(String str) => ProductDetaylJsn.fromJson(json.decode(str));

String productDetaylJsnToJson(ProductDetaylJsn data) => json.encode(data.toJson());

class ProductDetaylJsn {
    bool? success;
    Result? result;

    ProductDetaylJsn({
        this.success,
        this.result,
    });

    factory ProductDetaylJsn.fromJson(Map<String, dynamic> json) => ProductDetaylJsn(
        success: json["success"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
    };
}

class Result {
    int? invoiceCount;
    double? totalSalary;
    List<InvoiceList>? invoiceList;

    Result({
        this.invoiceCount,
        this.totalSalary,
        this.invoiceList,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        invoiceCount: json["invoiceCount"],
        totalSalary: json["totalSalary"]?.toDouble(),
        invoiceList: json["invoiceList"] == null ? [] : List<InvoiceList>.from(json["invoiceList"]!.map((x) => InvoiceList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "invoiceCount": invoiceCount,
        "totalSalary": totalSalary,
        "invoiceList": invoiceList == null ? [] : List<dynamic>.from(invoiceList!.map((x) => x.toJson())),
    };
}

class InvoiceList {
    int? invoiceId;
    String? customerName;
    String? documentCode;
    double? totalInvoice;

    InvoiceList({
        this.invoiceId,
        this.customerName,
        this.documentCode,
        this.totalInvoice,
    });

    factory InvoiceList.fromJson(Map<String, dynamic> json) => InvoiceList(
        invoiceId: json["invoiceId"],
        customerName: json["customerName"],
        documentCode: json["documentCode"],
        totalInvoice: json["totalInvoice"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "invoiceId": invoiceId,
        "customerName": customerName,
        "documentCode": documentCode,
        "totalInvoice": totalInvoice,
    };
}
//-----------------Dashobard listesini çeken jsonfonksiyonu------------------

Future<ProductDetaylJsn> productDetaylFunc()async{

  final response =  await rootBundle.loadString("asssets/simpledata/ProductsDetayl.json");
    final data = await jsonDecode(response);
    final jsoncontrol = ProductDetaylJsn.fromJson(data);
   

    
 return jsoncontrol;
}
