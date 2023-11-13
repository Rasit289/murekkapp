// To parse this JSON data, do
//
//     final currentProductListJsn = currentProductListJsnFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

CurrentProductListJsn currentProductListJsnFromJson(String str) => CurrentProductListJsn.fromJson(json.decode(str));

String currentProductListJsnToJson(CurrentProductListJsn data) => json.encode(data.toJson());

class CurrentProductListJsn {
    bool? success;
    List<Result>? result;

    CurrentProductListJsn({
        this.success,
        this.result,
    });

    factory CurrentProductListJsn.fromJson(Map<String, dynamic> json) => CurrentProductListJsn(
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
    int? productAmount;
    int? productUnitId;
    double? buyingPrice;
    bool? taxStatus;
    String? taxCode;
    bool? inventory;
    bool? stockTracking;

    Result({
        this.productId,
        this.productName,
        this.productCode,
        this.productAmount,
        this.productUnitId,
        this.buyingPrice,
        this.taxStatus,
        this.taxCode,
        this.inventory,
        this.stockTracking,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        productId: json["productId"],
        productName: json["productName"],
        productCode: json["productCode"],
        productAmount: json["productAmount"],
        productUnitId: json["productUnitId"],
        buyingPrice: json["buyingPrice"],
        taxStatus: json["taxStatus"],
        taxCode: json["taxCode"],
        inventory: json["inventory"],
        stockTracking: json["stockTracking"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "productCode": productCode,
        "productAmount": productAmount,
        "productUnitId": productUnitId,
        "buyingPrice": buyingPrice,
        "taxStatus": taxStatus,
        "taxCode": taxCode,
        "inventory": inventory,
        "stockTracking": stockTracking,
    };
}

//-----------------Current Products(carilerin ürünleri ) listesini çeken json fonksiyonu------------------

Future<CurrentProductListJsn> currentsProductFunc()async{

  final response =  await rootBundle.loadString("asssets/simpledata/CurrentProducts.json");
    final data = await jsonDecode(response);
    final jsoncontrol = CurrentProductListJsn.fromJson(data);
   

    
 return jsoncontrol;
}
