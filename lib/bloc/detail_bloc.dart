import 'dart:async';

import '../models/detail_model.dart';
import '../services/api_clients.dart';

class DetailBloc{
  final _apiclient = ApiClient();

  final _detailICDController = StreamController<DetailModel>.broadcast();

  Stream<DetailModel> get detailICDStream => _detailICDController.stream;

  fetchICDDetail() async{

    try{
      final results = await _apiclient.getICDDetails();
      print("ICD $results");
      _detailICDController.sink.add(results);
    } on Exception catch(e){
      print(e.toString());
      _detailICDController.sink.addError("something went wrong ${e.toString()}");
    }

  }

  final _detailCFSController = StreamController<DetailModel>.broadcast();

  Stream<DetailModel> get detailCFSStream => _detailCFSController.stream;

  fetchCFSDetail() async{

    try{
      final results = await _apiclient.getCFSDetails();
      print("CFS $results");
      _detailCFSController.sink.add(results);
    } on Exception catch(e){
      print(e.toString());
      _detailCFSController.sink.addError("something went wrong ${e.toString()}");
    }

  }

  dispose(){
    _detailCFSController.close();
    _detailICDController.close();
  }

}