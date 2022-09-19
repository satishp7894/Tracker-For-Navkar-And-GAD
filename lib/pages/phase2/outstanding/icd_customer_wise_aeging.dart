import 'package:flutter/material.dart';
import 'package:navkar_tracker/bloc/outstanding_bloc.dart';
import 'package:navkar_tracker/models/outstanding_cust_model.dart';
import 'package:navkar_tracker/utils/alerts.dart';
import 'package:navkar_tracker/utils/app_properties.dart';

class ICDCustomerWiseAgeing extends StatefulWidget {
  final String from;
  final String to;

  ICDCustomerWiseAgeing({this.from, this.to});

  @override
  _ICDCustomerWiseAgeingState createState() => _ICDCustomerWiseAgeingState();
}

class _ICDCustomerWiseAgeingState extends State<ICDCustomerWiseAgeing> {
  final icdBloc = OutstandingBloc();
  AsyncSnapshot<OutstandingCustModel> as;
  TextEditingController searchc;
  bool search = false;
  List<Outstanding> _searchResultICD = [];
  List<Outstanding> overAllDataICD = [];

  @override
  initState(){
    super.initState();
    searchc = TextEditingController();
    icdBloc.fetchICDCust(widget.from, widget.to);
  }

  @override
  void dispose() {
    super.dispose();
    icdBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar:_appBar(),
      body: _body(),
    );
  }

  Widget _appBar(){
    return AppBar(
      backgroundColor: bg,
      centerTitle: true,
      elevation: 0,
      title: Text("Ageing Outstanding",
        style: optionStyle,),
      actions: [
        IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: (){
              Alerts.showLogOut(context, "LogOut", "Are you sure?");
            }),
      ],
    );
  }

  Widget _body(){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            color: Colors.transparent,
            child: Text(
              widget.to == "0" ? 'ICD: Ageing Outstanding\n${widget.from}' : 'ICD: Ageing Outstanding\n${widget.from}-${widget.to} days',
              textAlign: TextAlign.center,
              style: headingBar,
            ),
          ),
          _searchView(),
          StreamBuilder<OutstandingCustModel>(
            stream: icdBloc.icdCustStream,
            builder: (c, s){
              as =s;
              if (as.connectionState != ConnectionState.active) {
                print("all connection");
                return Container(height : 300, alignment: Alignment.center, child: Center(heightFactor: 50, child: CircularProgressIndicator(),));
              }
              if (as.hasError) {
                print("as error");
                return Container();
              }
              if (as.data.toString().isEmpty) {
                print("as empty");
                return Container();
              }
              overAllDataICD = as.data.outstandings;
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: as.data.responseMessege.messege == null ? Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.white),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Container(
                                  child: Text('Sr. No.',
                                    style: content1,
                                    textAlign: TextAlign.center,),
                                  alignment: Alignment.center,
                                )
                            ),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  child: Text('Name',
                                    style: content1,
                                    textAlign: TextAlign.center,),
                                  alignment: Alignment.center,
                                )
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Text('Debit',
                                    style: content1,
                                    textAlign: TextAlign.center,),
                                  alignment: Alignment.center,
                                )
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Text('Credit',
                                    style: content1,
                                    textAlign: TextAlign.center,),
                                  alignment: Alignment.center,
                                )
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Text('Pending',
                                    style: content1,
                                    textAlign: TextAlign.center,),
                                  alignment: Alignment.center,
                                )
                            ),
                          ],
                        ),
                      ),
                      search == false ? idcList(overAllDataICD) : _searchResultICD.length == 0 ? Container() : idcList(_searchResultICD),
                      SizedBox(height: 20,)
                    ],),
                ) : Container(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget idcList(List<Outstanding> data){
    //print("${data.first.srNo}");
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder:(c,i) {
        //print("values ${data[i].srNo}");
        return Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: bg,
                      border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                    ),
                    child: Text("${data[i].srNo}", style: content1,
                      textAlign: TextAlign.center,) ,
                    //width: 100,
                    //height: 52,
                    //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.center,
                  )
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                    ),
                    child: Text("${data[i].party}", style: content1,
                      textAlign: TextAlign.center,),
                    alignment: Alignment.center,
                  )
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                    ),
                    child: Text("${data[i].debit}", style: content1,
                      textAlign: TextAlign.center,),
                    //width: 150,
                    //height: 52,
                    //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.center,
                  )
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                    ),
                    child: Text("${data[i].credit}", style: content1,
                      textAlign: TextAlign.center,),
                    //width: 150,
                    //height: 52,
                    //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.center,
                  )
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                    ),
                    child: Text("${data[i].outstanding}", style: content1,
                      textAlign: TextAlign.center,),
                    alignment: Alignment.center,
                  )
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _searchView() {
    //print("searchview");
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.white,),
          SizedBox(width: 8,),
          Expanded(
            child: TextField(
              controller: searchc,
              style: optionStyle,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.left,
              onChanged: (value){
                setState(() {
                  search = true;
                  onSearchTextChanged(value);
                });
              },
              decoration: new InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: optionStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
  onSearchTextChanged(String text) async {
    _searchResultICD.clear();
    print("$text value from search");
    if (text.isEmpty) {
      setState(() {
        search = false;
      });
      return;
    }

    overAllDataICD.forEach((exp) {
      if (exp.party.toUpperCase().contains(text.toUpperCase()))
        _searchResultICD.add(exp);
    });
    print("search result length ${_searchResultICD.length}");
    setState(() {});
  }

}
