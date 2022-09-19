import 'dart:async';

import '../models/billing_model.dart';
import '../services/api_clients1.dart';


class BillingBloc{
  final _apiClient1 = ApiClient1();

  final _icdBillController = StreamController<BillingModel>.broadcast();

  Stream<BillingModel> get icdBillStream => _icdBillController.stream;

  fetchICDBill() async {
    try {
      final results = await _apiClient1.getICDBillDetails();
      _icdBillController.sink.add(results);
      print("ifc bill bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _icdBillController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  final _cfsBillController = StreamController<BillingModel>.broadcast();
  Stream<BillingModel> get cfsBillStream => _cfsBillController.stream;

  fetchCFSBill() async {
    try {
      final results = await _apiClient1.getCFSBillDetails();
      _cfsBillController.sink.add(results);
      print("cfs bill bloc ${results.responseMessege}");

    } on Exception catch (e) {
      print(e.toString());
      _cfsBillController.sink.addError("something went wrong ${e.toString()}");
    }
  }

  dispose(){
    _icdBillController.close();
    _cfsBillController.close();
  }

}