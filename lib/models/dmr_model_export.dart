class DmrModelExport {
  DmrModelExport({
    this.ICDExportArrival,
    this.ICDExportstuffed,
    this.ICDExportMovemet,
    this.ICDExportInventory,
    this.ICDExportEmptyOut,
    this.ICDExportMonthWiseCollectionList,
    this.ICDExportPortWisePendency,
    this.ICDExportPortShutOut,
    this.ICDExportReMovement,
    this.ICDExportReWorking,
    this.ICDExportCartedIn,
    this.ICDExportCartedOut,
    this.ICDExportFactoryOut,
    this.ICDExportDocOut,
    this.responseMessege
  });

  List<ArrivalTueExport> ICDExportArrival;
  List<ArrivalTueExport> ICDExportstuffed;
  List<ArrivalTueExport> ICDExportMovemet;
  List<ArrivalTueExport> ICDExportInventory;
  List<ArrivalTueExport> ICDExportEmptyOut;
  List<ArrivalTueExport> ICDExportMonthWiseCollectionList;
  List<ArrivalTueExport> ICDExportPortWisePendency;
  List<ArrivalTueExport> ICDExportPortShutOut;
  List<ArrivalTueExport> ICDExportReMovement;
  List<ArrivalTueExport> ICDExportReWorking;
  List<ArrivalTueExport> ICDExportCartedIn;
  List<ArrivalTueExport> ICDExportCartedOut;
  List<ArrivalTueExport> ICDExportFactoryOut;
  List<ArrivalTueExport> ICDExportDocOut;
  ResponseMessegeExport responseMessege;

  factory DmrModelExport.fromJson(Map<String, dynamic> json) => DmrModelExport(
    ICDExportArrival: List<ArrivalTueExport>.from(json["ICDExportArrival"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportstuffed: List<ArrivalTueExport>.from(json["ICDExportstuffed"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportMovemet: List<ArrivalTueExport>.from(json["ICDExportMovemet"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportInventory: List<ArrivalTueExport>.from(json["ICDExportInventory"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportEmptyOut: List<ArrivalTueExport>.from(json["ICDExportEmptyOut"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportMonthWiseCollectionList: List<ArrivalTueExport>.from(json["ICDExportMonthWiseCollectionList"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportPortWisePendency: List<ArrivalTueExport>.from(json["ICDExportPortWisePendency"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportPortShutOut: List<ArrivalTueExport>.from(json["ICDExportPortShutOut"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportReMovement: List<ArrivalTueExport>.from(json["ICDExportReMovement"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportReWorking: List<ArrivalTueExport>.from(json["ICDExportReWorking"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportCartedIn: List<ArrivalTueExport>.from(json["ICDExportCartedIn"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportCartedOut: List<ArrivalTueExport>.from(json["ICDExportCartedOut"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportFactoryOut: List<ArrivalTueExport>.from(json["ICDExportFactoryOut"].map((x) => ArrivalTueExport.fromJson(x))),
    ICDExportDocOut: List<ArrivalTueExport>.from(json["ICDExportDocOut"].map((x) => ArrivalTueExport.fromJson(x))),
    responseMessege: ResponseMessegeExport.fromJson(json["responseMessege"]),
  );

  Map<String, dynamic> toJson() => {
    "ICDExportArrival": List<dynamic>.from(ICDExportArrival.map((x) => x.toJson())),
    "ICDExportstuffed": List<dynamic>.from(ICDExportstuffed.map((x) => x.toJson())),
    "ICDExportMovemet": List<dynamic>.from(ICDExportMovemet.map((x) => x.toJson())),
    "ICDExportInventory": List<dynamic>.from(ICDExportInventory.map((x) => x.toJson())),
    "ICDExportEmptyOut": List<dynamic>.from(ICDExportEmptyOut.map((x) => x.toJson())),
    "ICDExportMonthWiseCollectionList": List<dynamic>.from(ICDExportMonthWiseCollectionList.map((x) => x.toJson())),
    "ICDExportPortWisePendency": List<dynamic>.from(ICDExportPortWisePendency.map((x) => x.toJson())),
    "ICDExportPortShutOut": List<dynamic>.from(ICDExportPortShutOut.map((x) => x.toJson())),
    "ICDExportReMovement": List<dynamic>.from(ICDExportReMovement.map((x) => x.toJson())),
    "ICDExportReWorking": List<dynamic>.from(ICDExportReWorking.map((x) => x.toJson())),
    "ICDExportCartedIn": List<dynamic>.from(ICDExportCartedIn.map((x) => x.toJson())),
    "ICDExportCartedOut": List<dynamic>.from(ICDExportCartedOut.map((x) => x.toJson())),
    "ICDExportFactoryOut": List<dynamic>.from(ICDExportFactoryOut.map((x) => x.toJson())),
    "ICDExportDocOut": List<dynamic>.from(ICDExportDocOut.map((x) => x.toJson())),
    "responseMessege": responseMessege.toJson(),
  };
}

class ArrivalTueExport {
  ArrivalTueExport({
    this.process,
    this.t20,
    this.t40,
    this.t45,
    this.total,
    this.tues,
    this.year,
    this.month,
    this.monthNo,
    this.date,
    this.grandTotal
  });

  String process;
  String t20;
  String t40;
  String t45;
  String total;
  String tues;
  String year;
  String month;
  String monthNo;
  String date;
  String grandTotal;

  factory ArrivalTueExport.fromJson(Map<String, dynamic> json) => ArrivalTueExport(
    process: json["Process"] ?? "null",
    t20: json["T20"] ?? "null",
    t40: json["T40"] ?? "null",
    t45: json["T45"] ?? "null",
    total: json["Total"] ?? "null",
    tues: json["Teus"] ?? "null",
    year: json["Year"] ?? "null",
    month: json["Month"] ?? "null",
    monthNo: json["MonthNo"] ?? "null",
    date: json["Date"] ?? "null",
    grandTotal: json["GrandTotal"] ?? "null",
  );

  Map<String, dynamic> toJson() => {
    "Process": process ?? "null",
    "T20": t20 ?? "null",
    "T40": t40 ?? "null",
    "T45": t45 ?? "null",
    "Total": total ?? "null",
    "Teus": tues ?? "null",
    "Year": year ?? "null",
    "Month": month ?? "null",
    "MonthNO": monthNo ?? "null",
    "Date": date ?? "null",
    "GrandTotal": grandTotal ?? "null",
  };
}

class ResponseMessegeExport {
  ResponseMessegeExport({
    this.messege,
    this.status,
  });

  dynamic messege;
  int status;

  factory ResponseMessegeExport.fromJson(Map<String, dynamic> json) => ResponseMessegeExport(
    messege: json["Messege"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Messege": messege,
    "Status": status,
  };
}

