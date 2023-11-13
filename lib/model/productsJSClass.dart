// To parse this JSON data, do
//
//     final productJsn = productJsnFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

ProductJsn productJsnFromJson(String str) => ProductJsn.fromJson(json.decode(str));

String productJsnToJson(ProductJsn data) => json.encode(data.toJson());

class ProductJsn {
    bool? success;
    List<Result>? result;

    ProductJsn({
        this.success,
        this.result,
    });

    factory ProductJsn.fromJson(Map<String, dynamic> json) => ProductJsn(
        success: json["success"],
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    int? productId;
    String? productName;
    String? productCode;
    String? unitAndQuantity;
    double? taxAmount;
    double? salary;

    Result({
        this.productId,
        this.productName,
        this.productCode,
        this.unitAndQuantity,
        this.taxAmount,
        this.salary,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        productId: json["productId"],
        productName: json["productName"],
        productCode: json["productCode"],
        unitAndQuantity: json["unitAndQuantity"],
        taxAmount: json["taxAmount"]?.toDouble(),
        salary: json["salary"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "productCode": productCode,
        "unitAndQuantity": unitAndQuantity,
        "taxAmount": taxAmount,
        "salary": salary,
    };
}

//-----------------product listesini çeken jsonfonksiyonu------------------

Future<ProductJsn> productsFunc()async{

  final response =  await rootBundle.loadString("asssets/simpledata/Products.json");
    final data = await jsonDecode(response);
    final jsoncontrol = ProductJsn.fromJson(data);
   

    
 return jsoncontrol;
}



