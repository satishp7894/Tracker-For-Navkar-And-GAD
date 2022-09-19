import 'dart:async';

import 'package:navkar_tracker/models/kdm_model.dart';

import '../models/billing_model.dart';
import '../services/api_clients1.dart';


class KDMBloc{
  final _apiClient1 = ApiClient1();

  final _icdController = StreamController<KdModel>.broadcast();

  Stream<KdModel> get icdStream => _icdController.stream;

  fetchICDKDM() async {
    try {
      final results = await _apiClient1.getIFCKDM();
      _icdController.sink.add(results);
      print("ifc kdm bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _icdController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  final _cfsController = StreamController<KdModel>.broadcast();
  Stream<KdModel> get cfsStream => _cfsController.stream;

  fetchCFSKDM() async {
    try {
      final results = await _apiClient1.getCFSKDM();
      _cfsController.sink.add(results);
      print("cfs kdm bloc ${results.responseMessege}");

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