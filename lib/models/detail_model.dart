class DetailModel {
  DetailModel({
    this.lastMonth,
    this.lastMonthTillToday,
    this.thisMonth,
    this.last24HoursProgress,
    //this.last24HoursLastMonthProgess,
    //this.todayProgress,
    this.portPendency,
    this.inventory,
    this.last24HoursDelivery,
    //this.todayDelivery,
  });

  Last24HoursLastMonthProgess lastMonth;
  Last24HoursLastMonthProgess lastMonthTillToday;
  Last24HoursLastMonthProgess thisMonth;
  Last24HoursLastMonthProgess last24HoursProgress;
  //Last24HoursLastMonthProgess last24HoursLastMonthProgess;
  //Last24HoursLastMonthProgess todayProgress;
  PortPendency portPendency;
  List<Inventory> inventory;
  List<Delivery> last24HoursDelivery;
  //List<Delivery> todayDelivery;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
    lastMonth: Last24HoursLastMonthProgess.fromJson(json["lastMonth"]),
    lastMonthTillToday: Last24HoursLastMonthProgess.fromJson(json["lastMonthTillTodays"]),
    thisMonth: Last24HoursLastMonthProgess.fromJson(json["thisMonth"]),
    last24HoursProgress: Last24HoursLastMonthProgess.fromJson(json["last24HoursProgress"]),
    //last24HoursLastMonthProgess: Last24HoursLastMonthProgess.fromJson(json["last24HoursProgress"]),
    //todayProgress: Last24HoursLastMonthProgess.fromJson(json["todayProgress"]),
    portPendency: PortPendency.fromJson(json["portPendency"]),
    inventory: List<Inventory>.from(json["inventory"].map((x) => Inventory.fromJson(x))),
    last24HoursDelivery: List<Delivery>.from(json["last24HoursDelivery"].map((x) => Delivery.fromJson(x))),
    //todayDelivery: List<Delivery>.from(json["todayDelivery"].map((x) => Delivery.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "lastMonth": lastMonth.toJson(),
    "lastMonthTillToday": lastMonthTillToday.toJson(),
    "thisMonth": thisMonth.toJson(),
    "last24HoursProgress": last24HoursProgress.toJson(),
    //"last24HoursLastMonthProgess": last24HoursLastMonthProgess.toJson(),
    //"todayProgress": todayProgress.toJson(),
    "portPendency": portPendency.toJson(),
    "inventory": List<dynamic>.from(inventory.map((x) => x.toJson())),
    "last24HoursDelivery": List<dynamic>.from(last24HoursDelivery.map((x) => x.toJson())),
    //"todayDelivery": List<dynamic>.from(todayDelivery.map((x) => x.toJson())),
  };
}

class Inventory {
  Inventory({
    this.process,
    this.balInventory,
    this.mtyInventory,
    this.expInventory,
  });

  String process;
  int balInventory;
  int mtyInventory;
  int expInventory;

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
    process: json["Process"],
    balInventory: json["BalInventory"],
    mtyInventory: json["MTYInventory"],
    expInventory: json["EXPInventory"],
  );

  Map<String, dynamic> toJson() => {
    "Process": process,
    "BalInventory": balInventory,
    "MTYInventory": mtyInventory,
    "EXPInventory": expInventory,
  };
}

class Delivery {
  Delivery({
    this.process,
    this.destuff,
    this.loadedDelivery,
    this.teus,
  });

  String process;
  int destuff;
  int loadedDelivery;
  int teus;

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
    process: json["Process"],
    destuff: json["DestuffDelivery"],
    loadedDelivery: json["LoadedDelivery"],
    teus: json["TEUS"]
  );

  Map<String, dynamic> toJson() => {
    "Process": process,
    "Destuff": destuff,
    "LoadedDelivery": loadedDelivery,
    "Teus": teus
  };
}

class Last24HoursLastMonthProgess {
  Last24HoursLastMonthProgess({
    this.process,
    this.imp,
    this.exp,
    this.total,
    this.monthName,
  });

  String process;
  int imp;
  int exp;
  int total;
  String monthName;

  factory Last24HoursLastMonthProgess.fromJson(Map<String, dynamic> json) => Last24HoursLastMonthProgess(
    process: json["Process"],
    imp: json["IMP"],
    exp: json["EXP"],
    total: json["Total"],
    monthName: json["MonthName"],
  );

  Map<String, dynamic> toJson() => {
    "Process": process,
    "IMP": imp,
    "EXP": exp,
    "Total": total,
    "MonthName": monthName,
  };
}

class PortPendency {
  PortPendency({
    this.rail,
    this.road,
  });

  int rail;
  int road;

  factory PortPendency.fromJson(Map<String, dynamic> json) => PortPendency(
    rail: json["Rail"],
    road: json["Road"],
  );

  Map<String, dynamic> toJson() => {
    "Rail": rail,
    "Road": road,
  };
}
