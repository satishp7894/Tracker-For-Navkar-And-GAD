class KdModel {
  KdModel({
    this.responseMessege,
    this.kdm,
  });

  ResponseMessege responseMessege;
  List<Kdm> kdm;

  factory KdModel.fromJson(Map<String, dynamic> json) => KdModel(
    responseMessege: ResponseMessege.fromJson(json["responseMessege"]),
    kdm: List<Kdm>.from(json["KDM"].map((x) => Kdm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseMessege": responseMessege.toJson(),
    "KDM": List<dynamic>.from(kdm.map((x) => x.toJson())),
  };
}

class Kdm {
  Kdm({
    this.kdm,
    this.outStanding,
    this.srNo,
  });

  String kdm;
  String outStanding;
  int srNo;

  factory Kdm.fromJson(Map<String, dynamic> json) => Kdm(
    kdm: json["KDM"],
    outStanding: json["OutStanding"],
    srNo: json["SrNo"],
  );

  Map<String, dynamic> toJson() => {
    "KDM": kdm,
    "OutStanding": outStanding,
    "SrNo": srNo,
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
