// To parse this JSON data, do
//
//     final invoiceDetaylJsn = invoiceDetaylJsnFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

InvoiceDetaylJsn invoiceDetaylJsnFromJson(String str) => InvoiceDetaylJsn.fromJson(json.decode(str));

String invoiceDetaylJsnToJson(InvoiceDetaylJsn data) => json.encode(data.toJson());

class InvoiceDetaylJsn {
    bool? success;
    Result? result;

    InvoiceDetaylJsn({
        this.success,
        this.result,
    });

    factory InvoiceDetaylJsn.fromJson(Map<String, dynamic> json) => InvoiceDetaylJsn(
        success: json["success"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
    };
}

class Result {
    int? invoiceId;
    String? currentName;
    String? invoiceDate;
    String? invoiceNo;
    String? invoiceContent;
    List<Ticket>? invoiceTicket;
    List<Product>? products;
    double? subToptal;
    String? invoiceDampRate;
    int? invoiceDamp;
    int? invoiceTax;
    int? invoiceTevkifatId;
    double? invoceTotalSum;
    List<InvoceDoc>? invoceDocs;
    String? invoiceSubContent;

    Result({
        this.invoiceId,
        this.currentName,
        this.invoiceDate,
        this.invoiceNo,
        this.invoiceContent,
        this.invoiceTicket,
        this.products,
        this.subToptal,
        this.invoiceDampRate,
        this.invoiceDamp,
        this.invoiceTax,
        this.invoiceTevkifatId,
        this.invoceTotalSum,
        this.invoceDocs,
        this.invoiceSubContent,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        invoiceId: json["invoiceId"],
        currentName: json["currentName"],
        invoiceDate: json["invoiceDate"],
        invoiceNo: json["invoiceNo"],
        invoiceContent: json["invoiceContent"],
        invoiceTicket: json["invoiceTicket"] == null ? [] : List<Ticket>.from(json["invoiceTicket"]!.map((x) => Ticket.fromJson(x))),
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        subToptal: json["subToptal"],
        invoiceDampRate: json["invoiceDampRate"],
        invoiceDamp: json["invoiceDamp"],
        invoiceTax: json["invoiceTax"],
        invoiceTevkifatId: json["invoiceTevkifatId"],
        invoceTotalSum: json["invoceTotalSum"],
        invoceDocs: json["invoceDocs"] == null ? [] : List<InvoceDoc>.from(json["invoceDocs"]!.map((x) => InvoceDoc.fromJson(x))),
        invoiceSubContent: json["invoiceSubContent"],
    );

    Map<String, dynamic> toJson() => {
        "invoiceId": invoiceId,
        "currentName": currentName,
        "invoiceDate": invoiceDate,
        "invoiceNo": invoiceNo,
        "invoiceContent": invoiceContent,
        "invoiceTicket": invoiceTicket == null ? [] : List<dynamic>.from(invoiceTicket!.map((x) => x.toJson())),
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "subToptal": subToptal,
        "invoiceDampRate": invoiceDampRate,
        "invoiceDamp": invoiceDamp,
        "invoiceTax": invoiceTax,
        "invoiceTevkifatId": invoiceTevkifatId,
        "invoceTotalSum": invoceTotalSum,
        "invoceDocs": invoceDocs == null ? [] : List<dynamic>.from(invoceDocs!.map((x) => x.toJson())),
        "invoiceSubContent": invoiceSubContent,
    };
}

class InvoceDoc {
    int? documentId;
    String? documentName;

    InvoceDoc({
        this.documentId,
        this.documentName,
    });

    factory InvoceDoc.fromJson(Map<String, dynamic> json) => InvoceDoc(
        documentId: json["documentId"],
        documentName: json["DocumentName"],
    );

    Map<String, dynamic> toJson() => {
        "documentId": documentId,
        "DocumentName": documentName,
    };
}

class Ticket {
    int? ticketId;
    String? ticketName;

    Ticket({
        this.ticketId,
        this.ticketName,
    });

    factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        ticketId: json["ticketId"],
        ticketName: json["ticketName"],
    );

    Map<String, dynamic> toJson() => {
        "ticketId": ticketId,
        "ticketName": ticketName,
    };
}

class Product {
    int? productId;
    String? productName;
    int? stockCount;
    int? amound;
    List<Ticket>? productTicket;
    double? unitPrice;
    String? taxRate;
    String? specialTaxRate;
    int? specialTaxSum;
    String? specialDampTaxRate;
    int? specialDampTax;
    String? dampRate;
    double? damp;
    double? productSum;

    Product({
        this.productId,
        this.productName,
        this.stockCount,
        this.amound,
        this.productTicket,
        this.unitPrice,
        this.taxRate,
        this.specialTaxRate,
        this.specialTaxSum,
        this.specialDampTaxRate,
        this.specialDampTax,
        this.dampRate,
        this.damp,
        this.productSum,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        productName: json["productName"],
        stockCount: json["stockCount"],
        amound: json["amound"],
        productTicket: json["productTicket"] == null ? [] : List<Ticket>.from(json["productTicket"]!.map((x) => Ticket.fromJson(x))),
        unitPrice: json["unitPrice"],
        taxRate: json["taxRate"],
        specialTaxRate: json["specialTaxRate"],
        specialTaxSum: json["specialTaxSum"],
        specialDampTaxRate: json["specialDampTaxRate"],
        specialDampTax: json["specialDampTax"],
        dampRate: json["dampRate"],
        damp: json["damp"],
        productSum: json["productSum"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "stockCount": stockCount,
        "amound": amound,
        "productTicket": productTicket == null ? [] : List<dynamic>.from(productTicket!.map((x) => x.toJson())),
        "unitPrice": unitPrice,
        "taxRate": taxRate,
        "specialTaxRate": specialTaxRate,
        "specialTaxSum": specialTaxSum,
        "specialDampTaxRate": specialDampTaxRate,
        "specialDampTax": specialDampTax,
        "dampRate": dampRate,
        "damp": damp,
        "productSum": productSum,
    };
}


//-----------------invoiceDetail listesini çeken jsonfonksiyonu------------------

Future<InvoiceDetaylJsn> invoiceDetailFunc()async{

  final response =  await rootBundle.loadString("asssets/simpledata/InvoiceDetail.json");
    final data = await jsonDecode(response);
    final jsoncontrol = InvoiceDetaylJsn.fromJson(data);
   

    
 return jsoncontrol;
}
