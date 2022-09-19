import 'dart:async';

import '../models/dmr_model.dart';
import '../services/api_clients.dart';

class DmrBloc{
  final _apiclient = ApiClient();

  final _dmrController = StreamController<DmrModel>.broadcast();

  Stream<DmrModel> get dmrStream => _dmrController.stream;

  fetchDMRDetail() async{

    try{
      final results = await _apiclient.getDMRDetails();
      _dmrController.sink.add(results);
      print("dmrNew $results");
    } on Exception catch(e){
      print(e.toString());
      _dmrController.sink.addError("something went wrong ${e.toString()}");
    }

  }



  final _dmrCfsController = StreamController<DmrModel>.broadcast();

  Stream<DmrModel> get dmrCfsStream => _dmrCfsController.stream;

  fetchDMRCfs() async{

    try{
      final results = await _apiclient.getDMRCfs();
      _dmrCfsController.sink.add(results);
      print("dmrcfs $results");
    } on Exception catch(e){
      print(e.toString());
      _dmrCfsController.sink.addError("something went wrong ${e.toString()}");
    }

  }



  final _dmr1Controller = StreamController<DmrModel>.broadcast();

  Stream<DmrModel> get dmr1Stream => _dmr1Controller.stream;

  fetchDMR1() async{

    try{
      final results = await _apiclient.getDMRYard1();
      _dmr1Controller.sink.add(results);
      print("dmr1 $results");
    } on Exception catch(e){
      print(e.toString());
      _dmr1Controller.sink.addError("something went wrong ${e.toString()}");
    }

  }


  final _dmr2Controller = StreamController<DmrModel>.broadcast();

  Stream<DmrModel> get dmr2Stream => _dmr2Controller.stream;

  fetchDMR2() async{

    try{
      final results = await _apiclient.getDMRYard2();
      _dmr2Controller.sink.add(results);
      print("dmr2 $results");
    } on Exception catch(e){
      print(e.toString());
      _dmr2Controller.sink.addError("something went wrong ${e.toString()}");
    }

  }

  final _dmr3Controller = StreamController<DmrModel>.broadcast();

  Stream<DmrModel> get dmr3Stream => _dmr3Controller.stream;

  fetchDMR3() async{

    try{
      final results = await _apiclient.getDMRYard3();
      _dmr3Controller.sink.add(results);
      print("dmr3 $results");
    } on Exception catch(e){
      print(e.toString());
      _dmr3Controller.sink.addError("something went wrong ${e.toString()}");
    }

  }

  dispose(){
    _dmrController.close();
    _dmr1Controller.close();
    _dmr2Controller.close();
    _dmr3Controller.close();
    _dmrCfsController.close();
  }

}