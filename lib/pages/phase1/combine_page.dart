import 'package:flutter/material.dart';
import '../../bloc/detail_bloc.dart';
import '../../models/detail_model.dart';
import '../../utils/alerts.dart';
import '../../utils/app_properties.dart';

class CombinePage extends StatefulWidget {
  @override
  _CombinePageState createState() => _CombinePageState();
}

class _CombinePageState extends State<CombinePage> {
  final cfsbloc = DetailBloc();
  final idcbloc = DetailBloc();

  @override
  initState(){
    cfsbloc.fetchCFSDetail();
    idcbloc.fetchICDDetail();
    super.initState();
  }

  @override
  void dispose() {
    cfsbloc.dispose();
    idcbloc.dispose();
    super.dispose();
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
      leadingWidth: 30,
      centerTitle: true,
      elevation: 0,
      title: Text("Combined (CFS & ICD)",
        style: subheading1,),
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
    return StreamBuilder<DetailModel>(
      stream: idcbloc.detailICDStream,
      builder: (c,s1){
        return StreamBuilder<DetailModel>(
            stream: cfsbloc.detailCFSStream,
            builder: (c, s) {
              if (s.connectionState != ConnectionState.active || s1.connectionState != ConnectionState.active) {
                return Container(height : 300, alignment: Alignment.center, child: Center(heightFactor: 50, child: CircularProgressIndicator(),));
              }

              if (s.hasError || s1.hasError) {
                return Container(
                    alignment: Alignment.center,
                    child: Text('error'));
              }

              if (s.data.toString().isEmpty || s.data.toString().isEmpty) {
                return Container(
                    alignment: Alignment.center,
                    child: Text('No Data Found', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),));
              }

              int cfsBalInventory = 0, cfsMty = 0, cfsExp = 0;
              int icdBalInventory = 0, icdMty = 0, icdExp = 0;
              int totBalInventory = 0, totMty = 0, totExp = 0;

              for(int i=0; i<s.data.inventory.length; i++) {
                cfsBalInventory = cfsBalInventory + s.data.inventory[i].balInventory;
                cfsMty = cfsMty + s.data.inventory[i].mtyInventory;
                cfsExp = cfsExp + s.data.inventory[i].expInventory;
              }

              for(int i= 0; i<s1.data.inventory.length; i++) {
                icdBalInventory = icdBalInventory + s1.data.inventory[i].balInventory;
                icdMty = icdMty + s1.data.inventory[i].mtyInventory;
                icdExp = icdExp + s1.data.inventory[i].expInventory;
              }

              totBalInventory = cfsBalInventory + icdBalInventory;
              totMty = cfsMty + icdMty;
              totExp = cfsExp + icdExp;
              print("object inventory $totMty $totExp $totBalInventory");

              int cfsDe = 0, cfsLoad = 0, cfsTeus = 0;
              int icdDe = 0, icdLoad = 0, icdTeus = 0;
              int totDe = 0, totLoad = 0, totTeus = 0;

              for(int i=0; i<s.data.last24HoursDelivery.length; i++) {
                cfsDe = cfsDe + s.data.last24HoursDelivery[i].destuff;
                cfsLoad = cfsLoad + s.data.last24HoursDelivery[i].loadedDelivery;
                cfsTeus = cfsTeus + s.data.last24HoursDelivery[i].teus;
              }

              for(int i= 0; i<s1.data.last24HoursDelivery.length; i++) {
                icdDe = icdDe + s1.data.last24HoursDelivery[i].destuff;
                icdLoad = icdLoad + s1.data.last24HoursDelivery[i].loadedDelivery;
                icdTeus = icdTeus + s.data.last24HoursDelivery[i].teus;
              }

              totDe = cfsDe + icdDe;
              totLoad = cfsLoad + icdLoad;
              totTeus = icdTeus +cfsTeus;
              print("object delivery $totDe $totLoad $totTeus");

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      color: Colors.transparent,
                      height: 50,
                      child: Text(
                        'Import and Export Movement Report',
                          textAlign: TextAlign.center,
                          style: headingBar,
                      ),
                    ),
                    Container(
                      //height: 300,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
                      padding: EdgeInsets.all(10),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                                '${s.data.lastMonth.monthName}',
                                textAlign: TextAlign.center,
                                style: subheading,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 50,
                            //padding: EdgeInsets.only(left: 2, right: 2),
                            //margin: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      child: Text('',
                                        style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Import',
                                        style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      child: Text('Export',
                                        style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Total',
                                        style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      height: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('ICD', style: content1,
                                        textAlign: TextAlign.center,),
                                      //alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonth.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonth.exp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonth.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(

                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('CFS', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.lastMonth.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.lastMonth.exp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.lastMonth.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: bg,
                                          border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                      child: Text('Total', style: content1,
                                     textAlign: TextAlign.center,)
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonth.imp+s.data.lastMonth.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonth.exp+s.data.lastMonth.exp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonth.total+s.data.lastMonth.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                    Container(
                      //height: 300,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5,),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                                '${s.data.thisMonth.monthName}',
                                textAlign: TextAlign.center,
                                style: subheading
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      child: Text('', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Import', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      child: Text('Export', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Total', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('ICD', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.thisMonth.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.thisMonth.exp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.thisMonth.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('CFS', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.thisMonth.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.thisMonth.exp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.thisMonth.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('Total', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.thisMonth.imp +s.data.thisMonth.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.thisMonth.exp+s.data.thisMonth.exp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.thisMonth.total+s.data.thisMonth.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                    Container(
                      //height: 300,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5,),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                                '${s.data.lastMonthTillToday.monthName}',
                                textAlign: TextAlign.center,
                                style: subheading
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      child: Text('', style: content1,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Import', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      child: Text('Export', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Total', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('ICD', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonthTillToday.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonthTillToday.exp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonthTillToday.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('CFS', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.lastMonthTillToday.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.lastMonthTillToday.exp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.lastMonthTillToday.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('Total', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonthTillToday.imp + s.data.lastMonthTillToday.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonthTillToday.exp+s.data.lastMonthTillToday.exp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.lastMonthTillToday.total+s.data.lastMonthTillToday.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                    Container(
                      //height: 300,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5,),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                                '${s.data.last24HoursProgress.monthName}',
                                textAlign: TextAlign.center,
                                style: subheading
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      child: Text('', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Import', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Export', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Total', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('ICD', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.last24HoursProgress.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                //Expanded(child: SizedBox(width:20,)),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.last24HoursProgress.exp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.last24HoursProgress.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('CFS', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.last24HoursProgress.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.last24HoursProgress.exp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.last24HoursProgress.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('Total', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.last24HoursProgress.imp+s.data.last24HoursProgress.imp}', style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.last24HoursProgress.exp+s.data.last24HoursProgress.exp}',
                                        style: content1,
                                        textAlign: TextAlign.center,),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.last24HoursProgress.total+s1.data.last24HoursProgress.total}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                    Container(
                      //height: 300,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Port Pendency',
                        textAlign: TextAlign.left,
                        style: headingBar,
                      ),
                    ),
                    Container(
                      //height: 300,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5,),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      child: Text('', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Rail', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Road', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('ICD', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.portPendency.rail}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.portPendency.road}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('CFS', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.portPendency.rail}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s.data.portPendency.road}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('Total', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.portPendency.rail+s.data.portPendency.rail}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('${s1.data.portPendency.road+s.data.portPendency.road}', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5, right: 5, top: 10,  bottom: 5),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Yard Balance Inventory',
                        textAlign: TextAlign.left,
                        style: headingBar,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5,),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      child: Text('Process', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('IMP LOAD', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('EXP LOAD', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('MTY', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          for(int i=0; i<s1.data.inventory.length; i++)
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: bg,
                                          border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s1.data.inventory[i].process}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s1.data.inventory[i].balInventory}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s1.data.inventory[i].expInventory}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s1.data.inventory[i].mtyInventory}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          for(int i=0; i<s.data.inventory.length; i++)
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: bg,
                                          border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s.data.inventory[i].process}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s.data.inventory[i].balInventory}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s.data.inventory[i].expInventory}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s.data.inventory[i].mtyInventory}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('Total', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('$totBalInventory', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('$totExp', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('$totMty', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 5, right: 5, bottom: 5,),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10,),
                          Text(
                            'Last 24 Hours Delivery',
                            textAlign: TextAlign.center,
                            style: subheading,
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      child: Text('Process', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('Loaded Delivery', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('DeStuff Delivery', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      child: Text('TEUS', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 150,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          for(int i=0; i<s1.data.last24HoursDelivery.length; i++)
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: bg,
                                          border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s1.data.last24HoursDelivery[i].process}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s1.data.last24HoursDelivery[i].loadedDelivery}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s1.data.last24HoursDelivery[i].destuff}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s1.data.last24HoursDelivery[i].teus}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          for(int i=0; i<s.data.last24HoursDelivery.length; i++)
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: bg,
                                          border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s.data.last24HoursDelivery[i].process}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s.data.last24HoursDelivery[i].loadedDelivery}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s.data.last24HoursDelivery[i].destuff}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                        ),
                                        child: Text('${s.data.last24HoursDelivery[i].teus}', style: content1,
                                          textAlign: TextAlign.center,),
                                        //width: 100,
                                        //height: 52,
                                        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        alignment: Alignment.center,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bg,
                                        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('Total', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('$totLoad', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('$totDe', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
                                      ),
                                      child: Text('$totTeus', style: content1,
                                        textAlign: TextAlign.center,),
                                      //width: 100,
                                      //height: 52,
                                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      alignment: Alignment.center,
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
        );
      },
    );
  }
}
