class OutstandingCustModel {
  OutstandingCustModel({
    this.responseMessege,
    this.outstandings,
  });

  ResponseMessege responseMessege;
  List<Outstanding> outstandings;

  factory OutstandingCustModel.fromJson(Map<String, dynamic> json) => OutstandingCustModel(
    responseMessege: ResponseMessege.fromJson(json["responseMessege"]),
    outstandings: List<Outstanding>.from(json["outstandings"].map((x) => Outstanding.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseMessege": responseMessege.toJson(),
    "outstandings": List<dynamic>.from(outstandings.map((x) => x.toJson())),
  };
}

class Outstanding {
  Outstanding({
    this.srNo,
    this.from,
    this.to,
    this.debit,
    this.credit,
    this.outstanding,
    this.party,
  });

  int srNo;
  String from;
  String to;
  String debit;
  String credit;
  String outstanding;
  String party;

  factory Outstanding.fromJson(Map<String, dynamic> json) => Outstanding(
    srNo: json["SrNo"],
    from: json["From"],
    to: json["To"],
    debit: json["Debit"],
    credit: json["Credit"],
    outstanding: json["Outstanding"],
    party: json["Party"]
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "From": from,
    "To": to,
    "Debit": debit,
    "Credit": credit,
    "Outstanding": outstanding,
    "Party": party,
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
    "Messege": messege == null ? null : messege,
    "Status": status,
  };
}
