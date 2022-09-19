class BillingModel {
  BillingModel({
    this.billingDmrActivityWise,
    this.responseMessege,
  });

  List<BillingDmrActivityWise> billingDmrActivityWise;
  ResponseMessege responseMessege;

  factory BillingModel.fromJson(Map<String, dynamic> json) => BillingModel(
    billingDmrActivityWise: List<BillingDmrActivityWise>.from(json["billingDMRActivityWise"].map((x) => BillingDmrActivityWise.fromJson(x))),
    //billingDmrMonthWise: List<BillingDmrMonthWise>.from(json["billingDMRMonthWise"].map((x) => BillingDmrMonthWise.fromJson(x))),
    responseMessege: ResponseMessege.fromJson(json["responseMessege"]),
  );

  Map<String, dynamic> toJson() => {
    "billingDMRActivityWise": List<dynamic>.from(billingDmrActivityWise.map((x) => x.toJson())),
    //"billingDMRMonthWise": List<dynamic>.from(billingDmrMonthWise.map((x) => x.toJson())),
    "responseMessege": responseMessege.toJson(),
  };
}

class BillingDmrActivityWise {
  BillingDmrActivityWise({
    this.displayMonth,
    this.import,
    this.export,
    this.bond,
    this.domestic,
    this.mnr,
    this.misc,
    this.credit,
    this.total,
    this.asOnDate,
    this.asOnMonth,
  });

  String displayMonth;
  String import;
  String export;
  String bond;
  String domestic;
  String mnr;
  String misc;
  String credit;
  String total;
  String asOnDate;
  String asOnMonth;

  factory BillingDmrActivityWise.fromJson(Map<String, dynamic> json) => BillingDmrActivityWise(
    displayMonth: json["DisplayMonth"],
    import: json["Import"],
    export: json["Export"],
    bond: json["Bond"],
    domestic: json["Domestic"],
    mnr: json["MNR"],
    misc: json["MISC"],
    credit: json["Credit"],
    total: json["Total"],
    asOnDate: json["AsOnDate"],
    asOnMonth: json["AsOnMonth"],
  );

  Map<String, dynamic> toJson() => {
    "DisplayMonth": displayMonth,
    "Import": import,
    "Export": export,
    "Bond": bond,
    "Domestic": domestic,
    "MNR": mnr,
    "MISC": misc,
    "Credit": credit,
    "Total": total,
    "AsOnDate": asOnDate,
    "AsOnMonth": asOnMonth,
  };
}

// class BillingDmrMonthWise {
//   BillingDmrMonthWise({
//     this.srNo,
//     this.displayMonth,
//     this.total,
//     this.asOnDate,
//     this.asOnMonth,
//   });
//
//   int srNo;
//   String displayMonth;
//   String total;
//   String asOnDate;
//   String asOnMonth;
//
//   factory BillingDmrMonthWise.fromJson(Map<String, dynamic> json) => BillingDmrMonthWise(
//     srNo: json["SrNo"],
//     displayMonth: json["DisplayMonth"],
//     total: json["Total"],
//     asOnDate: json["AsOnDate"],
//     asOnMonth: json["AsOnMonth"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "SrNo": srNo,
//     "DisplayMonth": displayMonth,
//     "Total": total,
//     "AsOnDate": asOnDate,
//     "AsOnMonth": asOnMonth,
//   };
// }

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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
