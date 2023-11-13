// To parse this JSON data, do
//
//     final ticketListJsn = ticketListJsnFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

TicketListJsn ticketListJsnFromJson(String str) => TicketListJsn.fromJson(json.decode(str));

String ticketListJsnToJson(TicketListJsn data) => json.encode(data.toJson());

class TicketListJsn {
    bool? success;
    List<Result>? result;

    TicketListJsn({
        this.success,
        this.result,
    });

    factory TicketListJsn.fromJson(Map<String, dynamic> json) => TicketListJsn(
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
    String? ticketName;

    Result({
        this.id,
        this.ticketName,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        ticketName: json["ticketName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ticketName": ticketName,
    };
}

//-----------------Dashobard listesini çeken jsonfonksiyonu------------------

Future<TicketListJsn> ticketfunc()async{

  final response =  await rootBundle.loadString("asssets/simpledata/TicketList.json");
    final data = await jsonDecode(response);
    final jsoncontrol = TicketListJsn.fromJson(data);
   

    
 return jsoncontrol;
}

