import 'dart:async';

import 'package:navkar_tracker/models/performance_model.dart';

import '../services/api_clients1.dart';


class PerformanceBloc{
  final _apiClient1 = ApiClient1();

  final _icdController = StreamController<PerformanceModel>.broadcast();

  Stream<PerformanceModel> get icdStream => _icdController.stream;

  fetchICDPerformance() async {
    try {
      final results = await _apiClient1.getIFCPerformance();
      _icdController.sink.add(results);
      print("ifc Performance bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _icdController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  final _cfsController = StreamController<PerformanceModel>.broadcast();
  Stream<PerformanceModel> get cfsStream => _cfsController.stream;

  fetchCFSPerformance() async {
    try {
      final results = await _apiClient1.getCFSPerformance();
      _cfsController.sink.add(results);
      print("cfs Performance bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _cfsController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  dispose(){
    _icdController.close();
    _cfsController.close();
  }

}