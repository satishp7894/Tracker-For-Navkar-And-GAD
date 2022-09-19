import 'dart:async';

import 'package:navkar_tracker/models/collection_model.dart';
import '../services/api_clients1.dart';


class CollectionBloc{
  final _apiClient1 = ApiClient1();

  final _icdController = StreamController<CollectionModel>.broadcast();

  Stream<CollectionModel> get icdStream => _icdController.stream;

  fetchICDCollection(String date) async {
    try {
      final results = await _apiClient1.getIFCCollection(date);
      _icdController.sink.add(results);
      print("ifc collection bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _icdController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  final _cfsController = StreamController<CollectionModel>.broadcast();
  Stream<CollectionModel> get cfsStream => _cfsController.stream;

  fetchCFSCollection(String date) async {
    try {
      final results = await _apiClient1.getCFSCollection(date);
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