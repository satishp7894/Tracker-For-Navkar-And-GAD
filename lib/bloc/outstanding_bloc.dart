import 'dart:async';

import 'package:navkar_tracker/models/outstanding_cust_model.dart';
import 'package:navkar_tracker/models/overall_model.dart';

import '../models/outstanding_model.dart';
import '../services/api_clients1.dart';


class OutstandingBloc{
  final _apiClient1 = ApiClient1();

  final _icdOutController = StreamController<OutstandingModel>.broadcast();

  Stream<OutstandingModel> get icdOutStream => _icdOutController.stream;

  fetchICDOut() async {
    try {
      final results = await _apiClient1.getIFCOutDetails();
      _icdOutController.sink.add(results);
      print("ifc out bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _icdOutController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  final _cfsOutController = StreamController<OutstandingModel>.broadcast();
  Stream<OutstandingModel> get cfsOutStream => _cfsOutController.stream;

  fetchCFSOut() async {
    try {
      final results = await _apiClient1.getCFSOutDetails();
      _cfsOutController.sink.add(results);
      print("cfs out bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _cfsOutController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  //overall

  final _icdOverallController = StreamController<OverallModel>.broadcast();

  Stream<OverallModel> get icdOverallStream => _icdOverallController.stream;

  fetchICDOverall() async {
    try {
      final results = await _apiClient1.getIFCOverallDetails();
      _icdOverallController.sink.add(results);
      print("ifc Overall bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _icdOverallController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  final _cfsOverallController = StreamController<OverallModel>.broadcast();
  Stream<OverallModel> get cfsOverallStream => _cfsOverallController.stream;

  fetchCFSOverall() async {
    try {
      final results = await _apiClient1.getCFSOverallDetails();
      _cfsOverallController.sink.add(results);
      print("cfs out bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _cfsOverallController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  //custwise
  final _icdCustController = StreamController<OutstandingCustModel>.broadcast();

  Stream<OutstandingCustModel> get icdCustStream => _icdCustController.stream;

  fetchICDCust(String from, String to) async {
    try {
      final results = await _apiClient1.getIFCCustDetails(from,to);
      _icdCustController.sink.add(results);
      print("ifc cust bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _icdCustController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  final _cfsCustController = StreamController<OutstandingCustModel>.broadcast();
  Stream<OutstandingCustModel> get cfsCustStream => _cfsCustController.stream;

  fetchCFSCust(String from, String to) async {
    try {
      final results = await _apiClient1.getCFSCustDetails(from, to);
      _cfsCustController.sink.add(results);
      print("cfs cust bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _cfsCustController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  dispose(){
    _icdOutController.close();
    _icdOverallController.close();
    _icdCustController.close();
    _cfsOutController.close();
    _cfsOverallController.close();
    _cfsCustController.close();
  }

}