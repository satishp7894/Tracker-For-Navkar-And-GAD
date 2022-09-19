class CollectionModel {
  CollectionModel({
    this.collection,
    this.responseMessege,
  });

  List<Collection> collection;
  ResponseMessege responseMessege;

  factory CollectionModel.fromJson(Map<String, dynamic> json) => CollectionModel(
    collection: List<Collection>.from(json["Collection"].map((x) => Collection.fromJson(x))),
    responseMessege: ResponseMessege.fromJson(json["responseMessege"]),
  );

  Map<String, dynamic> toJson() => {
    "Collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    "responseMessege": responseMessege.toJson(),
  };
}

class Collection {
  Collection({
    this.srNo,
    this.display,
    this.cash,
    this.cheque,
    this.dd,
    this.rtgs,
    this.total,
    this.date,
  });

  int srNo;
  String display;
  String cash;
  String cheque;
  String dd;
  String rtgs;
  String total;
  String date;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    srNo: json["SrNo"],
    display: json["Display"],
    cash: json["Cash"],
    cheque: json["Cheque"],
    dd: json["DD"],
    rtgs: json["RTGS"],
    total: json["Total"],
    date: json["Date"],
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "Display": display,
    "Cash": cash,
    "Cheque": cheque,
    "DD": dd,
    "RTGS": rtgs,
    "Total": total,
    "Date": date,
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
