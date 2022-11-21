import '../models/detail_model.dart';
import '../models/dmr_model.dart';

import 'package:http/http.dart'as http;
import 'dart:convert';
import '../models/dmr_model_export.dart';
import 'connection.dart';

class ApiClient {

  Future<DetailModel> getCFSDetails() async {
    var response = await http.post(Uri.parse(Connection.detailCfs));
    var result = json.decode(response.body);

    DetailModel _detailcfs;

    print("cfs result $result");
      _detailcfs = (DetailModel.fromJson(result));
    print('cfs details ${_detailcfs}');
    return _detailcfs;
  }

  Future<DetailModel> getICDDetails() async {
    var response = await http.post(Uri.parse(Connection.detailIcd));
    var result = json.decode(response.body);

    DetailModel _detailicd;

    print("icd result $result");
    _detailicd = (DetailModel.fromJson(result));
    print('icd details $_detailicd');
    return _detailicd;
  }

  Future<DmrModel> getDMRDetails() async {
    var response = await http.get(Uri.parse(Connection.dmrNew));
    print("url ${Connection.dmrNew}");
    var result = json.decode(response.body);

    DmrModel _detailDmr;


    _detailDmr = (DmrModel.fromJson(result));
    //print('dmr details $_detailDmr');
    return _detailDmr;
  }

  Future<DmrModelExport> getDMRDetailsExport() async {
    var response = await http.get(Uri.parse(Connection.dmrNewExport));
    print("url dmrNewExport  ===========${Connection.dmrNewExport}");
    var result = json.decode(response.body);

    DmrModelExport _detailDmrExport;


    _detailDmrExport = (DmrModelExport.fromJson(result));
    //print('dmr details $_detailDmr');
    return _detailDmrExport;
  }

  Future<DmrModel> getDMRCfs() async {
    var response = await http.get(Uri.parse(Connection.dmrCfs));
    var result = json.decode(response.body);

    DmrModel _detailDmr;


    _detailDmr = (DmrModel.fromJson(result));
    //print('dmrcfs details $_detailDmr');
    return _detailDmr;
  }

  Future<DmrModel> getDMRYard1() async {
    var response = await http.get(Uri.parse(Connection.dmrYard1));
    var result = json.decode(response.body);

    DmrModel _detailDmr;


    _detailDmr = (DmrModel.fromJson(result));
    //print('yard1 details $_detailDmr');
    return _detailDmr;
  }

  Future<DmrModel> getDMRYard2() async {
    var response = await http.get(Uri.parse(Connection.dmrYard2));
    var result = json.decode(response.body);

    DmrModel _detailDmr;


    _detailDmr = (DmrModel.fromJson(result));
    //print('yard2 details $_detailDmr');
    return _detailDmr;
  }

  Future<DmrModel> getDMRYard3() async {
    var response = await http.get(Uri.parse(Connection.dmrYard3));
    var result = json.decode(response.body);
    DmrModel _detailDmr;


    _detailDmr = (DmrModel.fromJson(result));
    print('yard3 details $_detailDmr');
    return _detailDmr;
  }
}