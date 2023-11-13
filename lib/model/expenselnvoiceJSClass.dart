import 'dart:convert';

import 'package:flutter/services.dart';

ExpenseInvoiceListJsn expenseInvoiceListJsnFromJson(String str) =>
    ExpenseInvoiceListJsn.fromJson(json.decode(str));

String expenseInvoiceListJsnToJson(ExpenseInvoiceListJsn data) =>
    json.encode(data.toJson());

class ExpenseInvoiceListJsn {
  bool? success;
  Result? result;

  ExpenseInvoiceListJsn({
    this.success,
    this.result,
  });

  factory ExpenseInvoiceListJsn.fromJson(Map<String, dynamic> json) =>
      ExpenseInvoiceListJsn(
        success: json["success"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
      };
}

class Result {
  double? totalInvoice;
 double? totalInMount;
  List<ExpenseInvoice>? expenseInvoices;

  Result({
    this.totalInvoice,
    this.totalInMount,
    this.expenseInvoices,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        totalInvoice: json["totalInvoice"]?.toDouble(),
        totalInMount: json["totalInMount"],
        expenseInvoices: json["expenseInvoices"] == null
            ? []
            : List<ExpenseInvoice>.from(json["expenseInvoices"]!
                .map((x) => ExpenseInvoice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalInvoice": totalInvoice,
        "totalInMount": totalInMount,
        "expenseInvoices": expenseInvoices == null
            ? []
            : List<dynamic>.from(expenseInvoices!.map((x) => x.toJson())),
      };
}

class ExpenseInvoice {
  int? invoiceId;
  String? docType;
  String? docNo;
  String? information;
  String? dateOfIssuance;
  String? parentStatus;
 double? docAmount;
  double? remainingAmount;
 double? totalPayment;
  List<PaymentHistory>? paymentHistory;

  ExpenseInvoice({
    this.invoiceId,
    this.docType,
    this.docNo,
    this.information,
    this.dateOfIssuance,
    this.parentStatus,
    this.docAmount,
    this.remainingAmount,
    this.totalPayment,
    this.paymentHistory,
  });

  factory ExpenseInvoice.fromJson(Map<String, dynamic> json) => ExpenseInvoice(
        invoiceId: json["InvoiceId"],
        docType: json["docType"],
        docNo: json["docNo"],
        information: json["information"],
        dateOfIssuance: json["dateOfIssuance"],
        parentStatus: json["parentStatus"],
        docAmount: json["docAmount"],
        remainingAmount: json["remainingAmount"],
        totalPayment: json["totalPayment"],
        paymentHistory: json["paymentHistory"] == null
            ? []
            : List<PaymentHistory>.from(
                json["paymentHistory"]!.map((x) => PaymentHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "InvoiceId": invoiceId,
        "docType": docType,
        "docNo": docNo,
        "information": information,
        "dateOfIssuance": dateOfIssuance,
        "parentStatus": parentStatus,
        "docAmount": docAmount,
        "remainingAmount": remainingAmount,
        "totalPayment": totalPayment,
        "paymentHistory": paymentHistory == null
            ? []
            : List<dynamic>.from(paymentHistory!.map((x) => x.toJson())),
      };
}

class PaymentHistory {
  String? paymentDate;
  double? paymentAmount;
  String? paymentCase;
  String? paymentType;

  PaymentHistory({
    this.paymentDate,
    this.paymentAmount,
    this.paymentCase,
    this.paymentType,
  });

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => PaymentHistory(
        paymentDate: json["paymentDate"],
        paymentAmount: json["paymentAmount"],
        paymentCase: json["paymentCase"],
        paymentType: json["paymentType"],
      );

  Map<String, dynamic> toJson() => {
        "paymentDate": paymentDate,
        "paymentAmount": paymentAmount,
        "paymentCase": paymentCase,
        "paymentType": paymentType,
      };
}

//-----------------ExpenseInvoice listesini çeken jsonfonksiyonu------------------

Future<ExpenseInvoiceListJsn> expenselInvoice() async {
  final responseExpenseln =
      await rootBundle.loadString("asssets/simpledata/ExpenseInvoiceList.json");
  final dataExpenseln = await jsonDecode(responseExpenseln);
  final jsoncontrolExpenseIn = ExpenseInvoiceListJsn.fromJson(dataExpenseln);

  return jsoncontrolExpenseIn;
}
