class Connection{

  static String ip = "http://103.236.154.131:70/api/Navkar/";
  static String ipc = "http://122.200.19.33:65/api/Navkar/";
  static String ipcNew = "http://trackermobileapi.gadlogistics.in/api/GAD/";
  static String ipNew = "http://trackermobileapi.gadlogistics.in/api/GAD/";


  static String dashboard = ip+"api/Navkar/GetMenuDetails?UserID=";

  //ips for ICD
  static String login = ip+"ValidateLogin";
  static String detailIcd = ip+"GetDashboardICD";
  static String dmr = ip+"GetDMR";
  static String dmrNew = ipNew+"GetDMRYardIII";
  static String ifcOut = ip+"GetCustomerWiseOutStandingAgingICD";
  static String ifcBill = ip+"GetBillingDMRICD";
  static String ifcOverall = ip+"GetOverallOutstandingICD";
  static String ifcCustAeging = ip+"GetOutstandingCustWiseAgingICD";
  static String totalOutIcd = ip+"GetTotalOutStandingAgingICD";
  static String kdmIcd = ip+"GetKDMWiseReportForICD";
  static String collectionIcd = ip+"GetBillingCollectionICD";
  static String performnaceIcd = ip+"GetSalesPersonMonthlyReportICD";

  //ips for CFS
  static String detailCfs = ipc+"GetDashboardCFS";
  static String dmrCfs = ipc+"GetDMRCFS";
  static String dmrYard1 = ipc+"GetDMRYArdI";
  static String dmrYard2 = ipc+"GetDMRYArdII";
  static String dmrYard3 = ipc+"GetDMRYArdIII";
  static String cfsOut = ipc+"GetCustomerWiseOutStandingAgingCFS";
  static String cfsBill = ipcNew+"GetBillingDMRCFS";
  static String cfsOverall = ipc+"GetOverallOutstandingCFS";
  static String cfsCustAeging = ipc+"GetOutstandingCustWiseAgingCFS";
  static String totalOutCfs = ipc+"GetTotalOutStandingAgingCFS";
  static String kdmCfs = ipc+"GetKDMWiseReportForCFS";
  static String collectionCfs = ipcNew+"GetBillingCollectionCFS";
  static String performanceCfs = ipc+"GetSalesPersonMonthlyReportCFS";

}