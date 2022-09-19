// To parse this JSON data, do
//
//     final performanceModel = performanceModelFromJson(jsonString);

import 'dart:convert';

PerformanceModel performanceModelFromJson(String str) => PerformanceModel.fromJson(json.decode(str));

String performanceModelToJson(PerformanceModel data) => json.encode(data.toJson());

class PerformanceModel {
  PerformanceModel({
    this.responseMessege,
    this.performances,
    this.monthHeaders,
  });

  ResponseMessege responseMessege;
  List<Performance> performances;
  List<MonthHeader> monthHeaders;

  factory PerformanceModel.fromJson(Map<String, dynamic> json) => PerformanceModel(
    responseMessege: ResponseMessege.fromJson(json["responseMessege"]),
    performances: List<Performance>.from(json["Performances"].map((x) => Performance.fromJson(x))),
    monthHeaders: List<MonthHeader>.from(json["monthHeaders"].map((x) => MonthHeader.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseMessege": responseMessege.toJson(),
    "Performances": List<dynamic>.from(performances.map((x) => x.toJson())),
    "monthHeaders": List<dynamic>.from(monthHeaders.map((x) => x.toJson())),
  };
}

class MonthHeader {
  MonthHeader({
    this.srNo,
    this.month,
  });

  int srNo;
  String month;

  factory MonthHeader.fromJson(Map<String, dynamic> json) => MonthHeader(
    srNo: json["SrNo"],
    month: json["Month"],
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "Month": month,
  };
}

class Performance {
  Performance({
    this.srNo,
    this.salsePerson,
    this.saleMonthWises,
  });

  int srNo;
  String salsePerson;
  List<SaleMonthWise> saleMonthWises;

  factory Performance.fromJson(Map<String, dynamic> json) => Performance(
    srNo: json["SrNo"],
    salsePerson: json["SalsePerson"],
    saleMonthWises: List<SaleMonthWise>.from(json["saleMonthWises"].map((x) => SaleMonthWise.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "SalsePerson": salsePerson,
    "saleMonthWises": List<dynamic>.from(saleMonthWises.map((x) => x.toJson())),
  };
}

class SaleMonthWise {
  SaleMonthWise({
    this.month,
    this.tues,
  });

  String month;
  int tues;

  factory SaleMonthWise.fromJson(Map<String, dynamic> json) => SaleMonthWise(
    month: json["Month"],
    tues: json["TUES"],
  );

  Map<String, dynamic> toJson() => {
    "Month": month,
    "TUES": tues,
  };
}

class ResponseMessege {
  ResponseMessege({
    this.messege,
    this.status,
  });

  dynamic messege;
  int status;

  factory ResponseMessege.fromJson(Map<String, dynamic> json) => ResponseMessege(
    messege: json["Messege"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Messege": messege,
    "Status": status,
  };
}
