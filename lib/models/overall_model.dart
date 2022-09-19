class OverallModel {
  OverallModel({
    this.responseMessege,
    this.outstandings,
    this.overallOutstandings,
  });

  ResponseMessege responseMessege;
  List<dynamic> outstandings;
  List<OverallOutstanding> overallOutstandings;

  factory OverallModel.fromJson(Map<String, dynamic> json) => OverallModel(
    responseMessege: ResponseMessege.fromJson(json["responseMessege"]),
    outstandings: List<dynamic>.from(json["outstandings"].map((x) => x)),
    overallOutstandings: List<OverallOutstanding>.from(json["overallOutstandings"].map((x) => OverallOutstanding.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseMessege": responseMessege.toJson(),
    "outstandings": List<dynamic>.from(outstandings.map((x) => x)),
    "overallOutstandings": List<dynamic>.from(overallOutstandings.map((x) => x.toJson())),
  };
}

class OverallOutstanding {
  OverallOutstanding({
    this.srNo,
    this.name,
    this.debit,
    this.credit,
    this.pending,
  });

  int srNo;
  String name;
  int debit;
  int credit;
  int pending;

  factory OverallOutstanding.fromJson(Map<String, dynamic> json) => OverallOutstanding(
    srNo: json["SrNo"],
    name: json["Name"],
    debit: json["Debit"],
    credit: json["Credit"],
    pending: json["Pending"],
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "Name": name,
    "Debit": debit,
    "Credit": credit,
    "Pending": pending,
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
