class DmrModel {
  DmrModel({
    this.arrivalTues,
    this.loadedDelivery,
    this.deStuffDelivery,
    this.inventory,
    this.jobOrderReceived,
    this.portPendency,
    this.importJoInHand,
    this.inTransit,
    this.joInHand,
    this.responseMessege
  });

  List<ArrivalTue> arrivalTues;
  List<ArrivalTue> loadedDelivery;
  List<ArrivalTue> deStuffDelivery;
  List<ArrivalTue> inventory;
  List<ArrivalTue> jobOrderReceived;
  List<ArrivalTue> portPendency;
  List<ArrivalTue> importJoInHand;
  List<ArrivalTue> inTransit;
  List<ArrivalTue> joInHand;
  ResponseMessege responseMessege;

  factory DmrModel.fromJson(Map<String, dynamic> json) => DmrModel(
    arrivalTues: List<ArrivalTue>.from(json["arrivalTUES"].map((x) => ArrivalTue.fromJson(x))),
    loadedDelivery: List<ArrivalTue>.from(json["loadedDelivery"].map((x) => ArrivalTue.fromJson(x))),
    deStuffDelivery: List<ArrivalTue>.from(json["deStuffDelivery"].map((x) => ArrivalTue.fromJson(x))),
    inventory: List<ArrivalTue>.from(json["inventory"].map((x) => ArrivalTue.fromJson(x))),
    jobOrderReceived: List<ArrivalTue>.from(json["jobOrderReceived"].map((x) => ArrivalTue.fromJson(x))),
    portPendency: List<ArrivalTue>.from(json["portPendency"].map((x) => ArrivalTue.fromJson(x))),
    importJoInHand: List<ArrivalTue>.from(json["importJoInHand"].map((x) => ArrivalTue.fromJson(x))),
    inTransit: List<ArrivalTue>.from(json["inTransit"].map((x) => ArrivalTue.fromJson(x))),
    joInHand: List<ArrivalTue>.from(json["joInHand"].map((x) => ArrivalTue.fromJson(x))),
    responseMessege: ResponseMessege.fromJson(json["responseMessege"]),
  );

  Map<String, dynamic> toJson() => {
    "arrivalTUES": List<dynamic>.from(arrivalTues.map((x) => x.toJson())),
    "loadedDelivery": List<dynamic>.from(loadedDelivery.map((x) => x.toJson())),
    "deStuffDelivery": List<dynamic>.from(deStuffDelivery.map((x) => x.toJson())),
    "inventory": List<dynamic>.from(inventory.map((x) => x.toJson())),
    "jobOrderReceived": List<dynamic>.from(jobOrderReceived.map((x) => x.toJson())),
    "portPendency": List<dynamic>.from(portPendency.map((x) => x.toJson())),
    "importJoInHand": List<dynamic>.from(importJoInHand.map((x) => x.toJson())),
    "inTransit": List<dynamic>.from(inTransit.map((x) => x.toJson())),
    "joInHand": List<dynamic>.from(joInHand.map((x) => x.toJson())),
    "responseMessege": responseMessege.toJson(),
  };
}

class ArrivalTue {
  ArrivalTue({
    this.process,
    this.size20,
    this.size40,
    this.size45,
    this.total,
    this.tues,
    this.port,
    this.month,
  });

  String process;
  int size20;
  int size40;
  int size45;
  int total;
  int tues;
  String port;
  String month;

  factory ArrivalTue.fromJson(Map<String, dynamic> json) => ArrivalTue(
    process: json["Process"] == null ? null : json["Process"],
    size20: json["Size20"],
    size40: json["Size40"],
    size45: json["Size45"],
    total: json["Total"],
    tues: json["TUES"],
    port: json["Port"] == null ? null : json["Port"],
    month: json["Month"] == null ? null : json["Month"],
  );

  Map<String, dynamic> toJson() => {
    "Process": process == null ? null : process,
    "Size20": size20,
    "Size40": size40,
    "Size45": size45,
    "Total": total,
    "TUES": tues,
    "Port": port == null ? null : port,
    "Month": month == null ? null : month,
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

