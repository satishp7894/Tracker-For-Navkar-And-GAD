import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../bloc/dmr_bloc.dart';
import '../../models/dmr_model.dart';
import '../../models/dmr_model_export.dart';
import '../../utils/alerts.dart';
import '../../utils/app_properties.dart';

class DmrPage extends StatefulWidget {
  @override
  _DmrPageState createState() => _DmrPageState();
}

class _DmrPageState extends State<DmrPage> {
  final dmrBloc = DmrBloc();
  final dmrBloc1 = DmrBloc();

  // final dmrBloc2 = DmrBloc();
  // final dmrBloc3 = DmrBloc();
  // final dmrBloc4 = DmrBloc();

  // AsyncSnapshot<DmrModel> as, asc, as1, as2, as3;
  AsyncSnapshot<DmrModel> as;
  AsyncSnapshot<DmrModelExport> asc;

  @override
  initState() {
    dmrBloc.fetchDMRDetail();
    dmrBloc1.fetchDMRDetailExport();
    // dmrBloc1.fetchDMR1();
    // dmrBloc2.fetchDMR2();
    // dmrBloc3.fetchDMR3();
    // dmrBloc4.fetchDMRCfs();
    super.initState();
  }

  @override
  void dispose() {
    dmrBloc.dispose();
    dmrBloc1.dispose();
    // dmrBloc2.dispose();
    // dmrBloc3.dispose();
    // dmrBloc4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: bg,
      centerTitle: true,
      elevation: 0,
      title: Text(
        "Today\'s At a Glance",
        style: headingBar,
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              Alerts.showLogOut(context, "LogOut", "Are you sure?");
            }),
      ],
    );
  }

  // Widget _body(){
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.vertical,
  //     physics: BouncingScrollPhysics(),
  //     child: StreamBuilder<DmrModel>(
  //       stream: dmrBloc.dmrStream,
  //       builder: (c, s) {
  //           as = s;
  //           if (as.hasError) {
  //             print("as error");
  //             return Container();
  //           }
  //           if (as.data.toString().isEmpty) {
  //             print("as empty");
  //             return Container();
  //           }
  //         return StreamBuilder(
  //           stream: dmrBloc4.dmrCfsStream,
  //             builder: (c,sc){
  //                 asc = sc;
  //                 if (asc.hasError) {
  //                   print("asc error");
  //
  //                   return Container();
  //                 }
  //                 if (asc.data.toString().isEmpty) {
  //                   print("asc empty");
  //
  //                   return Container();
  //                 }
  //               return StreamBuilder(
  //                 stream: dmrBloc1.dmr1Stream,
  //                   builder: (c,s1){
  //                       as1 = s1;
  //                       if (as1.hasError) {
  //                         print("as1 error");
  //
  //                         return Container();
  //                       }
  //                       if (as1.data.toString().isEmpty) {
  //                         print("as1 empty");
  //
  //                         return Container();
  //                       }
  //                     return StreamBuilder(
  //                         stream: dmrBloc2.dmr2Stream,
  //                         builder: (c,s2){
  //                             as2 = s2;
  //                             if (as2.hasError) {
  //                               print("as2 error");
  //
  //                               return Container();
  //                             }
  //                             if (as2.data.toString().isEmpty) {
  //                               print("as2 empty");
  //
  //                               return Container();
  //                             }
  //                           return StreamBuilder(
  //                             stream: dmrBloc3.dmr3Stream,
  //                               builder: (c,s3){
  //                                 as3 = s3;
  //                                 if (as3.connectionState != ConnectionState.active || as2.connectionState != ConnectionState.active ||
  //                                     as1.connectionState != ConnectionState.active || asc.connectionState != ConnectionState.active ||
  //                                     as.connectionState != ConnectionState.active) {
  //                                   print("all connection");
  //
  //                                   return Container(height : 300, alignment: Alignment.center, child: Center(heightFactor: 50, child: CircularProgressIndicator(),));
  //                                 }
  //                                 if (as3.hasError) {
  //                                   print("as3 error");
  //
  //                                   return Container();
  //                                 }
  //                                 if (as3.data.toString().isEmpty) {
  //                                   print("as3 empty");
  //
  //                                   return Container();
  //                                 }
  //
  //                                 print("response message from the api ${as1.data.responseMessege.messege} ${asc.data.portPendency.isEmpty}");
  //
  //                                 //print("object values of s : ${s.data.message} sc: ${sc.data.message} s1: ${s1.data.message} s2: ${s2.data.message} s3: ${s3.data.message}");
  //                                 return Container(
  //                                   alignment: Alignment.topCenter,
  //                                   child:
  //
  //                                   // Container(
  //                                   //   margin: EdgeInsets.only(left: 10, right: 10),
  //                                   //   child: as.data.responseMessege.messege == null ? Column(
  //                                   //     children: [
  //                                   //       as.data.arrivalTues.isEmpty ? Container() : arrival(as),
  //                                   //       as.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(as),
  //                                   //       as.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(as),
  //                                   //       as.data.inventory.isEmpty ? Container() : inventory(as),
  //                                   //       as.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(as),
  //                                   //       as.data.portPendency.isEmpty ? Container() : portPendency(as),
  //                                   //       as.data.importJoInHand.isEmpty ? Container() : importJoInHand(as),
  //                                   //       as.data.inTransit.isEmpty ? Container() : inTransit(as),
  //                                   //       as.data.joInHand.isEmpty ? Container() : joInHand(as),
  //                                   //     ],
  //                                   //   ) : Container(),
  //                                   // ),
  //                                   DescriptionView(
  //                                       children : [
  //                                         Container(
  //                                           margin: EdgeInsets.only(left: 10, right: 10),
  //                                           child: as.data.responseMessege.messege == null ? Column(
  //                                             children: [
  //                                               as.data.arrivalTues.isEmpty ? Container() : arrival(as),
  //                                               as.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(as),
  //                                               as.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(as),
  //                                               as.data.inventory.isEmpty ? Container() : inventory(as),
  //                                               as.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(as),
  //                                               as.data.portPendency.isEmpty ? Container() : portPendency(as),
  //                                               as.data.importJoInHand.isEmpty ? Container() : importJoInHand(as),
  //                                               as.data.inTransit.isEmpty ? Container() : inTransit(as),
  //                                               as.data.joInHand.isEmpty ? Container() : joInHand(as),
  //                                             ],
  //                                           ) : Container(),
  //                                         ),
  //                                         Container(
  //                                           margin: EdgeInsets.only(left: 10, right: 10),
  //                                           child: as.data.responseMessege.messege == null ? Column(
  //                                             children: [
  //                                               as.data.arrivalTues.isEmpty ? Container() : arrival(as),
  //                                               as.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(as),
  //                                               as.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(as),
  //                                               as.data.inventory.isEmpty ? Container() : inventory(as),
  //                                               as.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(as),
  //                                               as.data.portPendency.isEmpty ? Container() : portPendency(as),
  //                                               as.data.importJoInHand.isEmpty ? Container() : importJoInHand(as),
  //                                               as.data.inTransit.isEmpty ? Container() : inTransit(as),
  //                                               as.data.joInHand.isEmpty ? Container() : joInHand(as),
  //                                             ],
  //                                           ) : Container(),
  //                                         ),
  //                                         // Container(
  //                                         //   margin: EdgeInsets.only(left: 10, right: 10),
  //                                         //   child: asc.data.responseMessege.messege == null ? Column(
  //                                         //     children: [
  //                                         //       asc.data.arrivalTues.isEmpty ? Container() : arrival(asc),
  //                                         //       asc.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(asc),
  //                                         //       asc.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(asc),
  //                                         //       asc.data.inventory.isEmpty ? Container() : inventory(asc),
  //                                         //       asc.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(asc),
  //                                         //       asc.data.portPendency.isEmpty ? Container() : portPendency(asc),
  //                                         //       asc.data.importJoInHand.isEmpty ? Container() : importJoInHand(asc),
  //                                         //       asc.data.inTransit.isEmpty ? Container() : inTransit(asc),
  //                                         //       asc.data.joInHand.isEmpty ? Container() : joInHand(asc),
  //                                         //     ],
  //                                         //   ) : Container(),
  //                                         // ),
  //                                         // Container(
  //                                         //   margin: EdgeInsets.only(left: 10, right: 10),
  //                                         //   child: as1.data.responseMessege.messege == null ? Column(
  //                                         //     children: [
  //                                         //       as1.data.arrivalTues.isEmpty ? Container() : arrival(as1),
  //                                         //       as1.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(as1),
  //                                         //       as1.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(as1),
  //                                         //       as1.data.inventory.isEmpty ? Container() : inventory(as1),
  //                                         //       as1.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(as1),
  //                                         //       as1.data.portPendency.isEmpty ? Container() : portPendency(as1),
  //                                         //       as1.data.importJoInHand.isEmpty ? Container() : importJoInHand(as1),
  //                                         //       as1.data.inTransit.isEmpty ? Container() : inTransit(as1),
  //                                         //       as1.data.joInHand.isEmpty ? Container() : joInHand(as1),
  //                                         //     ],
  //                                         //   ) : Container(),
  //                                         // ),
  //                                         // Container(
  //                                         //   margin: EdgeInsets.only(left: 10, right: 10),
  //                                         //   child: as2.data.responseMessege.messege == null ? Column(
  //                                         //     children: [
  //                                         //       as2.data.arrivalTues.isEmpty ? Container() : arrival(as2),
  //                                         //       as2.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(as2),
  //                                         //       as2.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(as2),
  //                                         //       as2.data.inventory.isEmpty ? Container() : inventory(as2),
  //                                         //       as2.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(as2),
  //                                         //       as2.data.portPendency.isEmpty ? Container() : portPendency(as2),
  //                                         //       as2.data.importJoInHand.isEmpty ? Container() : importJoInHand(as2),
  //                                         //       as2.data.inTransit.isEmpty ? Container() : inTransit(as2),
  //                                         //       as2.data.joInHand.isEmpty ? Container() : joInHand(as2),
  //                                         //     ],
  //                                         //   ) : Container(),
  //                                         // ),
  //                                         // Container(
  //                                         //   margin: EdgeInsets.only(left: 10, right: 10),
  //                                         //   child: as3.data.responseMessege.messege == null ? Column(
  //                                         //     children: [
  //                                         //       as3.data.arrivalTues.isEmpty ? Container() : arrival(as3),
  //                                         //       as3.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(as3),
  //                                         //       as3.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(as3),
  //                                         //       as3.data.inventory.isEmpty ? Container() : inventory(as3),
  //                                         //       as3.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(as3),
  //                                         //       as3.data.portPendency.isEmpty ? Container() : portPendency(as3),
  //                                         //       as3.data.importJoInHand.isEmpty ? Container() : importJoInHand(as3),
  //                                         //       as3.data.inTransit.isEmpty ? Container() : inTransit(as3),
  //                                         //       as3.data.joInHand.isEmpty ? Container() : joInHand(as3),
  //                                         //     ],
  //                                         //   ) : Container(),
  //                                         // ),
  //                                       ]
  //                                   ),
  //                                 );
  //                               });
  //                         });
  //                   });
  //             });
  //       }
  //     ),
  //   );
  // }

  Widget _body() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: StreamBuilder<DmrModel>(
          stream: dmrBloc.dmrStream,
          builder: (c, s) {
            as = s;
            if (as.hasError) {
              print("as error");
              return Container();
            }
            if (as.data.toString().isEmpty) {
              print("as empty");
              return Container();
            }
            return StreamBuilder(
                stream: dmrBloc1.dmrStreamExport,
                builder: (c, s3) {
                  asc = s3;
                  if (asc.connectionState != ConnectionState.active ||
                      as.connectionState != ConnectionState.active) {
                    print("all connection");

                    return Container(
                        height: 300,
                        alignment: Alignment.center,
                        child: Center(
                          heightFactor: 50,
                          child: CircularProgressIndicator(),
                        ));
                  }
                  if (asc.hasError) {
                    print("asc error");

                    return Container();
                  }
                  if (asc.data.toString().isEmpty) {
                    print("as3 empty");

                    return Container();
                  }

                  print(
                      "response message from the api ${asc.data.responseMessege.messege}");

                  //print("object values of s : ${s.data.message} sc: ${sc.data.message} s1: ${s1.data.message} s2: ${s2.data.message} s3: ${s3.data.message}");
                  return Container(
                    alignment: Alignment.topCenter,
                    child:

                        // Container(
                        //   margin: EdgeInsets.only(left: 10, right: 10),
                        //   child: as.data.responseMessege.messege == null ? Column(
                        //     children: [
                        //       as.data.arrivalTues.isEmpty ? Container() : arrival(as),
                        //       as.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(as),
                        //       as.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(as),
                        //       as.data.inventory.isEmpty ? Container() : inventory(as),
                        //       as.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(as),
                        //       as.data.portPendency.isEmpty ? Container() : portPendency(as),
                        //       as.data.importJoInHand.isEmpty ? Container() : importJoInHand(as),
                        //       as.data.inTransit.isEmpty ? Container() : inTransit(as),
                        //       as.data.joInHand.isEmpty ? Container() : joInHand(as),
                        //     ],
                        //   ) : Container(),
                        // ),
                        DescriptionView(children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: as.data.responseMessege.messege == null
                            ? Column(
                                children: [
                                  as.data.arrivalTues.isEmpty
                                      ? Container()
                                      : arrival(as),
                                  as.data.loadedDelivery.isEmpty
                                      ? Container()
                                      : loadedDelivery(as),
                                  as.data.deStuffDelivery.isEmpty
                                      ? Container()
                                      : deStuffDelivery(as),
                                  as.data.inventory.isEmpty
                                      ? Container()
                                      : inventory(as),
                                  as.data.jobOrderReceived.isEmpty
                                      ? Container()
                                      : jobOrderReceived(as),
                                  as.data.portPendency.isEmpty
                                      ? Container()
                                      : portPendency(as),
                                  as.data.importJoInHand.isEmpty
                                      ? Container()
                                      : importJoInHand(as),
                                  as.data.inTransit.isEmpty
                                      ? Container()
                                      : inTransit(as),
                                  as.data.joInHand.isEmpty
                                      ? Container()
                                      : joInHand(as),
                                ],
                              )
                            : Container(),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: asc.data.responseMessege.messege == null
                            ?
                            Column(
                              children: [
                                asc.data.ICDExportArrival.isEmpty ? Container() : exportData(asc.data.ICDExportArrival,"Export Empty In"),
                                asc.data.ICDExportstuffed.isEmpty ? Container() : exportData(asc.data.ICDExportstuffed,"Export Stuffed"),
                                asc.data.ICDExportMovemet.isEmpty ? Container() : exportData(asc.data.ICDExportMovemet,"Movement"),
                                asc.data.ICDExportInventory.isEmpty ? Container() : exportData(asc.data.ICDExportInventory,"Inventory"),
                                asc.data.ICDExportEmptyOut.isEmpty ? Container() : exportData(asc.data.ICDExportEmptyOut,"Empty Out"),
                               // asc.data.ICDExportMonthWiseCollectionList.isEmpty ? Container() :
                               //  //     //ICDExportMonthWiseCollectionList
                               //      SizedBox(height: 10,),
                               //      Container(
                               //        alignment: Alignment.center,
                               //        // padding: EdgeInsets.only(left: 20, right: 20),
                               //        color: Colors.transparent,
                               //        // height: 40,
                               //        child: Text("Export Month Wise Movemet",
                               //            textAlign: TextAlign.center, style: headingBar),
                               //      ),
                               //      SizedBox(height: 15,),
                               //      Container(
                               //        height: (asc.data.ICDExportMonthWiseCollectionList.length +1)*50.toDouble(),
                               //        child: HorizontalDataTable(
                               //          leftHandSideColumnWidth: 115,
                               //          rightHandSideColumnWidth: 480,
                               //          isFixedHeader: true,
                               //          headerWidgets: [
                               //            Container(
                               //                height: 50,
                               //                decoration: BoxDecoration(
                               //                  color: Colors.green,
                               //                    border: Border(
                               //                      left: BorderSide(
                               //                        //                   <--- right side
                               //                        color: Colors.white,
                               //                      ),
                               //                      top: BorderSide(
                               //                        //                   <--- right side
                               //                        color: Colors.white,
                               //                      ),
                               //                      bottom: BorderSide(
                               //                        //                   <--- right side
                               //                        color: Colors.white,
                               //                      ),
                               //                    )
                               //                ),
                               //                child: Container(
                               //                  child: Text(
                               //                    'Year',
                               //                    style: content1,
                               //                    textAlign: TextAlign.center,
                               //                  ),
                               //                  alignment: Alignment.center,
                               //                )),
                               //            Container(
                               //              height: 50,
                               //              // decoration: BoxDecoration(
                               //              //   color: Colors.green,
                               //              //   border: Border.all(color: Colors.white),
                               //              // ),
                               //              child: Row(
                               //                mainAxisAlignment:
                               //                MainAxisAlignment.spaceBetween,
                               //                // mainAxisSize: MainAxisSize.min,
                               //                children: [
                               //                  Container(
                               //                    child: Text(
                               //                      'Month',
                               //                      style: content1,
                               //                      textAlign: TextAlign.center,
                               //                    ),
                               //                    alignment: Alignment.center,
                               //                    width: 80,
                               //                    decoration: const BoxDecoration(
                               //                        color: Colors.green,
                               //                        border: Border(
                               //                          // right: BorderSide(
                               //                          //   //                   <--- right side
                               //                          //   color: Colors.white,
                               //                          // ),
                               //                          top: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                          bottom: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                        )
                               //                      // border: Border.all(color: Colors.white),
                               //                    ),
                               //                  ),
                               //                  Container(
                               //                    child: Text(
                               //                      '20',
                               //                      style: content1,
                               //                      textAlign: TextAlign.center,
                               //                    ),
                               //                    alignment: Alignment.center,
                               //                    width: 80,
                               //                    decoration: const BoxDecoration(
                               //                        color: Colors.green,
                               //                        border: Border(
                               //                          // right: BorderSide(
                               //                          //   //                   <--- right side
                               //                          //   color: Colors.white,
                               //                          // ),
                               //                          top: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                          bottom: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                        )
                               //                      // border: Border.all(color: Colors.white),
                               //                    ),
                               //                  ),
                               //                  Container(
                               //                    child: Text(
                               //                      '40',
                               //                      style: content1,
                               //                      textAlign: TextAlign.center,
                               //                    ),
                               //                    alignment: Alignment.center,
                               //                    width: 80,
                               //                    decoration: const BoxDecoration(
                               //                        color: Colors.green,
                               //                        border: Border(
                               //                          // right: BorderSide(
                               //                          //   //                   <--- right side
                               //                          //   color: Colors.white,
                               //                          // ),
                               //                          top: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                          bottom: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                        )
                               //                      // border: Border.all(color: Colors.white),
                               //                    ),
                               //                  ),
                               //                  Container(
                               //                    child: Text(
                               //                      '45',
                               //                      style: content1,
                               //                      textAlign: TextAlign.center,
                               //                    ),
                               //                    alignment: Alignment.center,
                               //                    width: 80,
                               //                    decoration: const BoxDecoration(
                               //                        color: Colors.green,
                               //                        border: Border(
                               //                          // right: BorderSide(
                               //                          //   //                   <--- right side
                               //                          //   color: Colors.white,
                               //                          // ),
                               //                          top: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                          bottom: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                        )
                               //                      // border: Border.all(color: Colors.white),
                               //                    ),
                               //                  ),
                               //                  Container(
                               //                    child: Text(
                               //                      'Total',
                               //                      style: content1,
                               //                      textAlign: TextAlign.center,
                               //                    ),
                               //                    alignment: Alignment.center,
                               //                    width: 80,
                               //                    decoration: const BoxDecoration(
                               //                        color: Colors.green,
                               //                        border: Border(
                               //                          // right: BorderSide(
                               //                          //   //                   <--- right side
                               //                          //   color: Colors.white,
                               //                          // ),
                               //                          top: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                          bottom: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                        )
                               //                      // border: Border.all(color: Colors.white),
                               //                    ),
                               //                  ),
                               //                  Container(
                               //                    child: Text(
                               //                      'TEUS',
                               //                      style: content1,
                               //                      textAlign: TextAlign.center,
                               //                    ),
                               //                    alignment: Alignment.center,
                               //                    width: 80,
                               //                    decoration: const BoxDecoration(
                               //                        color: Colors.green,
                               //                        border: Border(
                               //                          right: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                          top: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                          bottom: BorderSide(
                               //                            //                   <--- right side
                               //                            color: Colors.white,
                               //                          ),
                               //                        )
                               //                      // border: Border.all(color: Colors.white),
                               //                    ),
                               //                  ),
                               //
                               //
                               //                ],
                               //              ),
                               //            ),
                               //          ],
                               //          leftSideItemBuilder: _generateFirstColumnRow1MonthWiseCollectionList,
                               //          rightSideItemBuilder:
                               //          _generateRightHandSideColumnRow1MonthWiseCollectionList,
                               //          itemCount:
                               //          asc.data.ICDExportMonthWiseCollectionList.length,
                               //          rightHandSideColBackgroundColor: Colors.black,
                               //          leftHandSideColBackgroundColor: Colors.black,
                               //        ),
                               //      ),
                               //      SizedBox(height: 15,),
                                asc.data.ICDExportMonthWiseCollectionList.isEmpty ? Container() : exportDataMonthWise(asc.data.ICDExportMonthWiseCollectionList,"Export Month Wise Movement"),
                                asc.data.ICDExportPortWisePendency.isEmpty ? Container() : exportData(asc.data.ICDExportPortWisePendency,"Port Wise Movement Pendency"),
                                asc.data.ICDExportPortShutOut.isEmpty ? Container() : exportData(asc.data.ICDExportPortShutOut,"Port ShutOut"),
                                asc.data.ICDExportReMovement.isEmpty ? Container() : exportData(asc.data.ICDExportReMovement,"Re-Movement"),
                                asc.data.ICDExportReWorking.isEmpty ? Container() : exportData(asc.data.ICDExportReWorking,"Re-Working"),
                                asc.data.ICDExportCartedIn.isEmpty ? Container() : exportDataCarted(asc.data.ICDExportCartedIn,"Carted Vehicles"),
                                asc.data.ICDExportCartedOut.isEmpty ? Container() : exportDataCarted(asc.data.ICDExportCartedOut,"Carted Out"),
                                asc.data.ICDExportFactoryOut.isEmpty ? Container() : exportData(asc.data.ICDExportFactoryOut,"Factory Out"),
                                asc.data.ICDExportDocOut.isEmpty ? Container() : exportData(asc.data.ICDExportDocOut,"Doc Out"),

                              ],
                            )

                            // Column(
                            //   children: [
                            //
                            //     //ICDExportArrival
                            //     SizedBox(height: 5,),
                            //     Container(
                            //       alignment: Alignment.center,
                            //       padding: EdgeInsets.only(left: 20, right: 20),
                            //       color: Colors.transparent,
                            //       height: 50,
                            //       child: Text("Arrival TEUS",
                            //           textAlign: TextAlign.center, style: headingBar),
                            //     ),
                            //     SizedBox(height: 10,),
                            //     Container(
                            //         height: (asc.data.ICDExportArrival.length +1)*50.toDouble(),
                            //         child: HorizontalDataTable(
                            //           leftHandSideColumnWidth: 100,
                            //           rightHandSideColumnWidth: 800,
                            //           isFixedHeader: true,
                            //           headerWidgets: [
                            //             Container(
                            //                 height: 50,
                            //                 decoration: BoxDecoration(
                            //                   color: Colors.green,
                            //                   border:
                            //                       Border.all(color: Colors.white),
                            //                 ),
                            //                 child: Container(
                            //                   child: Text(
                            //                     'Process',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                 )),
                            //             Container(
                            //               height: 50,
                            //               // decoration: BoxDecoration(
                            //               //   color: Colors.green,
                            //               //   border: Border.all(color: Colors.white),
                            //               // ),
                            //               child: Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 // mainAxisSize: MainAxisSize.min,
                            //                 children: [
                            //                   Container(
                            //                     child: Text(
                            //                       '20',
                            //                       style: content1,
                            //                       textAlign: TextAlign.center,
                            //                     ),
                            //                     alignment: Alignment.center,
                            //                     width: 80,
                            //                     decoration: const BoxDecoration(
                            //                         color: Colors.green,
                            //                         border: Border(
                            //                           right: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           top: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           bottom: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                         )
                            //                         // border: Border.all(color: Colors.white),
                            //                         ),
                            //                   ),
                            //                   Container(
                            //                     child: Text(
                            //                       '40',
                            //                       style: content1,
                            //                       textAlign: TextAlign.center,
                            //                     ),
                            //                     alignment: Alignment.center,
                            //                     width: 80,
                            //                     decoration: const BoxDecoration(
                            //                         color: Colors.green,
                            //                         border: Border(
                            //                           right: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           top: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           bottom: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                         )
                            //                         // border: Border.all(color: Colors.white),
                            //                         ),
                            //                   ),
                            //                   Container(
                            //                     child: Text(
                            //                       '45',
                            //                       style: content1,
                            //                       textAlign: TextAlign.center,
                            //                     ),
                            //                     alignment: Alignment.center,
                            //                     width: 80,
                            //                     decoration: const BoxDecoration(
                            //                         color: Colors.green,
                            //                         border: Border(
                            //                           right: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           top: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           bottom: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                         )
                            //                         // border: Border.all(color: Colors.white),
                            //                         ),
                            //                   ),
                            //                   Container(
                            //                     child: Text(
                            //                       'Total',
                            //                       style: content1,
                            //                       textAlign: TextAlign.center,
                            //                     ),
                            //                     alignment: Alignment.center,
                            //                     width: 80,
                            //                     decoration: const BoxDecoration(
                            //                         color: Colors.green,
                            //                         border: Border(
                            //                           right: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           top: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           bottom: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                         )
                            //                         // border: Border.all(color: Colors.white),
                            //                         ),
                            //                   ),
                            //                   Container(
                            //                     child: Text(
                            //                       'TEUS',
                            //                       style: content1,
                            //                       textAlign: TextAlign.center,
                            //                     ),
                            //                     alignment: Alignment.center,
                            //                     width: 80,
                            //                     decoration: const BoxDecoration(
                            //                         color: Colors.green,
                            //                         border: Border(
                            //                           right: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           top: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           bottom: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                         )
                            //                         // border: Border.all(color: Colors.white),
                            //                         ),
                            //                   ),
                            //                   Container(
                            //                     child: Text(
                            //                       'Month',
                            //                       style: content1,
                            //                       textAlign: TextAlign.center,
                            //                     ),
                            //                     alignment: Alignment.center,
                            //                     width: 80,
                            //                     decoration: const BoxDecoration(
                            //                         color: Colors.green,
                            //                         border: Border(
                            //                           right: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           top: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           bottom: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                         )
                            //                         // border: Border.all(color: Colors.white),
                            //                         ),
                            //                   ),
                            //                   Container(
                            //                     child: Text(
                            //                       'Year',
                            //                       style: content1,
                            //                       textAlign: TextAlign.center,
                            //                     ),
                            //                     alignment: Alignment.center,
                            //                     width: 80,
                            //                     decoration: const BoxDecoration(
                            //                         color: Colors.green,
                            //                         border: Border(
                            //                           right: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           top: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           bottom: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                         )
                            //                         // border: Border.all(color: Colors.white),
                            //                         ),
                            //                   ),
                            //                   Container(
                            //                     child: Text(
                            //                       'Month No',
                            //                       style: content1,
                            //                       textAlign: TextAlign.center,
                            //                     ),
                            //                     alignment: Alignment.center,
                            //                     width: 80,
                            //                     decoration: const BoxDecoration(
                            //                         color: Colors.green,
                            //                         border: Border(
                            //                           right: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           top: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           bottom: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                         )
                            //                         // border: Border.all(color: Colors.white),
                            //                         ),
                            //                   ),
                            //                   Container(
                            //                     child: Text(
                            //                       'Date',
                            //                       style: content1,
                            //                       textAlign: TextAlign.center,
                            //                     ),
                            //                     alignment: Alignment.center,
                            //                     width: 80,
                            //                     decoration: const BoxDecoration(
                            //                         color: Colors.green,
                            //                         border: Border(
                            //                           right: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           top: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           bottom: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                         )
                            //                       // border: Border.all(color: Colors.white),
                            //                     ),
                            //                   ),
                            //                   Container(
                            //                     child: Text(
                            //                       'Grand Total',
                            //                       style: content1,
                            //                       textAlign: TextAlign.center,
                            //                     ),
                            //                     alignment: Alignment.center,
                            //                     width: 80,
                            //                     decoration: const BoxDecoration(
                            //                         color: Colors.green,
                            //                         border: Border(
                            //                           right: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           top: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                           bottom: BorderSide(
                            //                             //                   <--- right side
                            //                             color: Colors.white,
                            //                           ),
                            //                         )
                            //                       // border: Border.all(color: Colors.white),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ],
                            //           leftSideItemBuilder: _generateFirstColumnRow1Arrival,
                            //           rightSideItemBuilder:
                            //               _generateRightHandSideColumnRow1Arrival,
                            //           itemCount:
                            //               asc.data.ICDExportArrival.length,
                            //           rightHandSideColBackgroundColor: Colors.black,
                            //           leftHandSideColBackgroundColor: Colors.black,
                            //         ),
                            //       ),
                            //
                            //     //ICDExportstuffed
                            //     SizedBox(height: 5,),
                            //     Container(
                            //       alignment: Alignment.center,
                            //       padding: EdgeInsets.only(left: 20, right: 20),
                            //       color: Colors.transparent,
                            //       height: 50,
                            //       child: Text("Stuffed",
                            //           textAlign: TextAlign.center, style: headingBar),
                            //     ),
                            //     SizedBox(height: 10,),
                            //     Container(
                            //       height: (asc.data.ICDExportstuffed.length +1)*50.toDouble(),
                            //       child: HorizontalDataTable(
                            //         leftHandSideColumnWidth: 100,
                            //         rightHandSideColumnWidth: 800,
                            //         isFixedHeader: true,
                            //         headerWidgets: [
                            //           Container(
                            //               height: 50,
                            //               decoration: BoxDecoration(
                            //                 color: Colors.green,
                            //                 border:
                            //                 Border.all(color: Colors.white),
                            //               ),
                            //               child: Container(
                            //                 child: Text(
                            //                   'Process',
                            //                   style: content1,
                            //                   textAlign: TextAlign.center,
                            //                 ),
                            //                 alignment: Alignment.center,
                            //               )),
                            //           Container(
                            //             height: 50,
                            //             // decoration: BoxDecoration(
                            //             //   color: Colors.green,
                            //             //   border: Border.all(color: Colors.white),
                            //             // ),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //               // mainAxisSize: MainAxisSize.min,
                            //               children: [
                            //                 Container(
                            //                   child: Text(
                            //                     '20',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '40',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '45',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'TEUS',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Year',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month No',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Date',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Grand Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //         leftSideItemBuilder: _generateFirstColumnRow1stuffed,
                            //         rightSideItemBuilder:
                            //         _generateRightHandSideColumnRow1stuffed,
                            //         itemCount:
                            //         asc.data.ICDExportArrival.length,
                            //         rightHandSideColBackgroundColor: Colors.black,
                            //         leftHandSideColBackgroundColor: Colors.black,
                            //       ),
                            //     ),
                            //
                            //     //ICDExportMovemet
                            //     SizedBox(height: 5,),
                            //     Container(
                            //       alignment: Alignment.center,
                            //       padding: EdgeInsets.only(left: 20, right: 20),
                            //       color: Colors.transparent,
                            //       height: 50,
                            //       child: Text("Movemet",
                            //           textAlign: TextAlign.center, style: headingBar),
                            //     ),
                            //     SizedBox(height: 10,),
                            //     Container(
                            //       height: (asc.data.ICDExportMovemet.length +1)*50.toDouble(),
                            //       child: HorizontalDataTable(
                            //         leftHandSideColumnWidth: 100,
                            //         rightHandSideColumnWidth: 800,
                            //         isFixedHeader: true,
                            //         headerWidgets: [
                            //           Container(
                            //               height: 50,
                            //               decoration: BoxDecoration(
                            //                 color: Colors.green,
                            //                 border:
                            //                 Border.all(color: Colors.white),
                            //               ),
                            //               child: Container(
                            //                 child: Text(
                            //                   'Process',
                            //                   style: content1,
                            //                   textAlign: TextAlign.center,
                            //                 ),
                            //                 alignment: Alignment.center,
                            //               )),
                            //           Container(
                            //             height: 50,
                            //             // decoration: BoxDecoration(
                            //             //   color: Colors.green,
                            //             //   border: Border.all(color: Colors.white),
                            //             // ),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //               // mainAxisSize: MainAxisSize.min,
                            //               children: [
                            //                 Container(
                            //                   child: Text(
                            //                     '20',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '40',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '45',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'TEUS',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Year',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month No',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Date',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Grand Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //         leftSideItemBuilder: _generateFirstColumnRow1Movemet,
                            //         rightSideItemBuilder:
                            //         _generateRightHandSideColumnRow1Movemet,
                            //         itemCount:
                            //         asc.data.ICDExportMovemet.length,
                            //         rightHandSideColBackgroundColor: Colors.black,
                            //         leftHandSideColBackgroundColor: Colors.black,
                            //       ),
                            //     ),
                            //
                            //     //ICDExportInventory
                            //     SizedBox(height: 5,),
                            //     Container(
                            //       alignment: Alignment.center,
                            //       padding: EdgeInsets.only(left: 20, right: 20),
                            //       color: Colors.transparent,
                            //       height: 50,
                            //       child: Text("Inventory",
                            //           textAlign: TextAlign.center, style: headingBar),
                            //     ),
                            //     SizedBox(height: 10,),
                            //     Container(
                            //       height: (asc.data.ICDExportInventory.length +1)*50.toDouble(),
                            //       child: HorizontalDataTable(
                            //         leftHandSideColumnWidth: 100,
                            //         rightHandSideColumnWidth: 800,
                            //         isFixedHeader: true,
                            //         headerWidgets: [
                            //           Container(
                            //               height: 50,
                            //               decoration: BoxDecoration(
                            //                 color: Colors.green,
                            //                 border:
                            //                 Border.all(color: Colors.white),
                            //               ),
                            //               child: Container(
                            //                 child: Text(
                            //                   'Process',
                            //                   style: content1,
                            //                   textAlign: TextAlign.center,
                            //                 ),
                            //                 alignment: Alignment.center,
                            //               )),
                            //           Container(
                            //             height: 50,
                            //             // decoration: BoxDecoration(
                            //             //   color: Colors.green,
                            //             //   border: Border.all(color: Colors.white),
                            //             // ),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //               // mainAxisSize: MainAxisSize.min,
                            //               children: [
                            //                 Container(
                            //                   child: Text(
                            //                     '20',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '40',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '45',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'TEUS',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Year',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month No',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Date',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Grand Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //         leftSideItemBuilder: _generateFirstColumnRow1Inventory,
                            //         rightSideItemBuilder:
                            //         _generateRightHandSideColumnRow1Inventory,
                            //         itemCount:
                            //         asc.data.ICDExportInventory.length,
                            //         rightHandSideColBackgroundColor: Colors.black,
                            //         leftHandSideColBackgroundColor: Colors.black,
                            //       ),
                            //     ),
                            //
                            //     //ICDExportEmptyOut
                            //     SizedBox(height: 5,),
                            //     Container(
                            //       alignment: Alignment.center,
                            //       padding: EdgeInsets.only(left: 20, right: 20),
                            //       color: Colors.transparent,
                            //       height: 50,
                            //       child: Text("Empty Out",
                            //           textAlign: TextAlign.center, style: headingBar),
                            //     ),
                            //     SizedBox(height: 10,),
                            //     Container(
                            //       height: (asc.data.ICDExportEmptyOut.length +1)*50.toDouble(),
                            //       child: HorizontalDataTable(
                            //         leftHandSideColumnWidth: 100,
                            //         rightHandSideColumnWidth: 800,
                            //         isFixedHeader: true,
                            //         headerWidgets: [
                            //           Container(
                            //               height: 50,
                            //               decoration: BoxDecoration(
                            //                 color: Colors.green,
                            //                 border:
                            //                 Border.all(color: Colors.white),
                            //               ),
                            //               child: Container(
                            //                 child: Text(
                            //                   'Process',
                            //                   style: content1,
                            //                   textAlign: TextAlign.center,
                            //                 ),
                            //                 alignment: Alignment.center,
                            //               )),
                            //           Container(
                            //             height: 50,
                            //             // decoration: BoxDecoration(
                            //             //   color: Colors.green,
                            //             //   border: Border.all(color: Colors.white),
                            //             // ),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //               // mainAxisSize: MainAxisSize.min,
                            //               children: [
                            //                 Container(
                            //                   child: Text(
                            //                     '20',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '40',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '45',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'TEUS',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Year',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month No',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Date',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Grand Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //         leftSideItemBuilder: _generateFirstColumnRow1EmptyOut,
                            //         rightSideItemBuilder:
                            //         _generateRightHandSideColumnRow1EmptyOut,
                            //         itemCount:
                            //         asc.data.ICDExportEmptyOut.length,
                            //         rightHandSideColBackgroundColor: Colors.black,
                            //         leftHandSideColBackgroundColor: Colors.black,
                            //       ),
                            //     ),
                            //
                            //     //ICDExportMonthWiseCollectionList
                            //     SizedBox(height: 5,),
                            //     Container(
                            //       alignment: Alignment.center,
                            //       padding: EdgeInsets.only(left: 20, right: 20),
                            //       color: Colors.transparent,
                            //       height: 50,
                            //       child: Text("Month Wise Collection List",
                            //           textAlign: TextAlign.center, style: headingBar),
                            //     ),
                            //     SizedBox(height: 10,),
                            //     Container(
                            //       height: (asc.data.ICDExportMonthWiseCollectionList.length +1)*50.toDouble(),
                            //       child: HorizontalDataTable(
                            //         leftHandSideColumnWidth: 100,
                            //         rightHandSideColumnWidth: 800,
                            //         isFixedHeader: true,
                            //         headerWidgets: [
                            //           Container(
                            //               height: 50,
                            //               decoration: BoxDecoration(
                            //                 color: Colors.green,
                            //                 border:
                            //                 Border.all(color: Colors.white),
                            //               ),
                            //               child: Container(
                            //                 child: Text(
                            //                   'Process',
                            //                   style: content1,
                            //                   textAlign: TextAlign.center,
                            //                 ),
                            //                 alignment: Alignment.center,
                            //               )),
                            //           Container(
                            //             height: 50,
                            //             // decoration: BoxDecoration(
                            //             //   color: Colors.green,
                            //             //   border: Border.all(color: Colors.white),
                            //             // ),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //               // mainAxisSize: MainAxisSize.min,
                            //               children: [
                            //                 Container(
                            //                   child: Text(
                            //                     '20',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '40',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '45',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'TEUS',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Year',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month No',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Date',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Grand Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //         leftSideItemBuilder: _generateFirstColumnRow1MonthWiseCollectionList,
                            //         rightSideItemBuilder:
                            //         _generateRightHandSideColumnRow1MonthWiseCollectionList,
                            //         itemCount:
                            //         asc.data.ICDExportMonthWiseCollectionList.length,
                            //         rightHandSideColBackgroundColor: Colors.black,
                            //         leftHandSideColBackgroundColor: Colors.black,
                            //       ),
                            //     ),
                            //
                            //     //ICDExportPortWisePendency
                            //     SizedBox(height: 5,),
                            //     Container(
                            //       alignment: Alignment.center,
                            //       padding: EdgeInsets.only(left: 20, right: 20),
                            //       color: Colors.transparent,
                            //       height: 50,
                            //       child: Text("Port Wise Pendency",
                            //           textAlign: TextAlign.center, style: headingBar),
                            //     ),
                            //     SizedBox(height: 10,),
                            //     Container(
                            //       height: (asc.data.ICDExportPortWisePendency.length +1)*50.toDouble(),
                            //       child: HorizontalDataTable(
                            //         leftHandSideColumnWidth: 100,
                            //         rightHandSideColumnWidth: 800,
                            //         isFixedHeader: true,
                            //         headerWidgets: [
                            //           Container(
                            //               height: 50,
                            //               decoration: BoxDecoration(
                            //                 color: Colors.green,
                            //                 border:
                            //                 Border.all(color: Colors.white),
                            //               ),
                            //               child: Container(
                            //                 child: Text(
                            //                   'Process',
                            //                   style: content1,
                            //                   textAlign: TextAlign.center,
                            //                 ),
                            //                 alignment: Alignment.center,
                            //               )),
                            //           Container(
                            //             height: 50,
                            //             // decoration: BoxDecoration(
                            //             //   color: Colors.green,
                            //             //   border: Border.all(color: Colors.white),
                            //             // ),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //               // mainAxisSize: MainAxisSize.min,
                            //               children: [
                            //                 Container(
                            //                   child: Text(
                            //                     '20',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '40',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '45',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'TEUS',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Year',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month No',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Date',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Grand Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //         leftSideItemBuilder: _generateFirstColumnRow1PortWisePendency,
                            //         rightSideItemBuilder:
                            //         _generateRightHandSideColumnRow1PortWisePendency,
                            //         itemCount:
                            //         asc.data.ICDExportPortWisePendency.length,
                            //         rightHandSideColBackgroundColor: Colors.black,
                            //         leftHandSideColBackgroundColor: Colors.black,
                            //       ),
                            //     ),
                            //
                            //     //ICDExportPortShutOut
                            //     SizedBox(height: 5,),
                            //     Container(
                            //       alignment: Alignment.center,
                            //       padding: EdgeInsets.only(left: 20, right: 20),
                            //       color: Colors.transparent,
                            //       height: 50,
                            //       child: Text("Port Shut Out",
                            //           textAlign: TextAlign.center, style: headingBar),
                            //     ),
                            //     SizedBox(height: 10,),
                            //     Container(
                            //       height: (asc.data.ICDExportPortShutOut.length +1)*50.toDouble(),
                            //       child: HorizontalDataTable(
                            //         leftHandSideColumnWidth: 100,
                            //         rightHandSideColumnWidth: 800,
                            //         isFixedHeader: true,
                            //         headerWidgets: [
                            //           Container(
                            //               height: 50,
                            //               decoration: BoxDecoration(
                            //                 color: Colors.green,
                            //                 border:
                            //                 Border.all(color: Colors.white),
                            //               ),
                            //               child: Container(
                            //                 child: Text(
                            //                   'Process',
                            //                   style: content1,
                            //                   textAlign: TextAlign.center,
                            //                 ),
                            //                 alignment: Alignment.center,
                            //               )),
                            //           Container(
                            //             height: 50,
                            //             // decoration: BoxDecoration(
                            //             //   color: Colors.green,
                            //             //   border: Border.all(color: Colors.white),
                            //             // ),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //               // mainAxisSize: MainAxisSize.min,
                            //               children: [
                            //                 Container(
                            //                   child: Text(
                            //                     '20',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '40',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '45',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'TEUS',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Year',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month No',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Date',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Grand Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //         leftSideItemBuilder: _generateFirstColumnRow1PortShutOut,
                            //         rightSideItemBuilder:
                            //         _generateRightHandSideColumnRow1PortShutOut,
                            //         itemCount:
                            //         asc.data.ICDExportPortShutOut.length,
                            //         rightHandSideColBackgroundColor: Colors.black,
                            //         leftHandSideColBackgroundColor: Colors.black,
                            //       ),
                            //     ),
                            //
                            //     //ICDExportReMovement
                            //     SizedBox(height: 5,),
                            //     Container(
                            //       alignment: Alignment.center,
                            //       padding: EdgeInsets.only(left: 20, right: 20),
                            //       color: Colors.transparent,
                            //       height: 50,
                            //       child: Text("Re Movement",
                            //           textAlign: TextAlign.center, style: headingBar),
                            //     ),
                            //     SizedBox(height: 10,),
                            //     Container(
                            //       height: (asc.data.ICDExportReMovement.length +1)*50.toDouble(),
                            //       child: HorizontalDataTable(
                            //         leftHandSideColumnWidth: 100,
                            //         rightHandSideColumnWidth: 800,
                            //         isFixedHeader: true,
                            //         headerWidgets: [
                            //           Container(
                            //               height: 50,
                            //               decoration: BoxDecoration(
                            //                 color: Colors.green,
                            //                 border:
                            //                 Border.all(color: Colors.white),
                            //               ),
                            //               child: Container(
                            //                 child: Text(
                            //                   'Process',
                            //                   style: content1,
                            //                   textAlign: TextAlign.center,
                            //                 ),
                            //                 alignment: Alignment.center,
                            //               )),
                            //           Container(
                            //             height: 50,
                            //             // decoration: BoxDecoration(
                            //             //   color: Colors.green,
                            //             //   border: Border.all(color: Colors.white),
                            //             // ),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //               // mainAxisSize: MainAxisSize.min,
                            //               children: [
                            //                 Container(
                            //                   child: Text(
                            //                     '20',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '40',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '45',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'TEUS',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Year',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month No',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Date',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Grand Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //         leftSideItemBuilder: _generateFirstColumnRow1ReMovement,
                            //         rightSideItemBuilder:
                            //         _generateRightHandSideColumnRow1ReMovement,
                            //         itemCount:
                            //         asc.data.ICDExportReMovement.length,
                            //         rightHandSideColBackgroundColor: Colors.black,
                            //         leftHandSideColBackgroundColor: Colors.black,
                            //       ),
                            //     ),
                            //
                            //     //ICDExportReWorking
                            //     SizedBox(height: 5,),
                            //     Container(
                            //       alignment: Alignment.center,
                            //       padding: EdgeInsets.only(left: 20, right: 20),
                            //       color: Colors.transparent,
                            //       height: 50,
                            //       child: Text("Re Working",
                            //           textAlign: TextAlign.center, style: headingBar),
                            //     ),
                            //     SizedBox(height: 10,),
                            //     Container(
                            //       height: (asc.data.ICDExportReWorking.length +1)*50.toDouble(),
                            //       child: HorizontalDataTable(
                            //         leftHandSideColumnWidth: 100,
                            //         rightHandSideColumnWidth: 800,
                            //         isFixedHeader: true,
                            //         headerWidgets: [
                            //           Container(
                            //               height: 50,
                            //               decoration: BoxDecoration(
                            //                 color: Colors.green,
                            //                 border:
                            //                 Border.all(color: Colors.white),
                            //               ),
                            //               child: Container(
                            //                 child: Text(
                            //                   'Process',
                            //                   style: content1,
                            //                   textAlign: TextAlign.center,
                            //                 ),
                            //                 alignment: Alignment.center,
                            //               )),
                            //           Container(
                            //             height: 50,
                            //             // decoration: BoxDecoration(
                            //             //   color: Colors.green,
                            //             //   border: Border.all(color: Colors.white),
                            //             // ),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //               // mainAxisSize: MainAxisSize.min,
                            //               children: [
                            //                 Container(
                            //                   child: Text(
                            //                     '20',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '40',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     '45',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'TEUS',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Year',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Month No',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Date',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   child: Text(
                            //                     'Grand Total',
                            //                     style: content1,
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   width: 80,
                            //                   decoration: const BoxDecoration(
                            //                       color: Colors.green,
                            //                       border: Border(
                            //                         right: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         top: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                         bottom: BorderSide(
                            //                           //                   <--- right side
                            //                           color: Colors.white,
                            //                         ),
                            //                       )
                            //                     // border: Border.all(color: Colors.white),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //         leftSideItemBuilder: _generateFirstColumnRow1ReWorking,
                            //         rightSideItemBuilder:
                            //         _generateRightHandSideColumnRow1ReWorking,
                            //         itemCount:
                            //         asc.data.ICDExportReWorking.length,
                            //         rightHandSideColBackgroundColor: Colors.black,
                            //         leftHandSideColBackgroundColor: Colors.black,
                            //       ),
                            //     ),
                            //   ],
                            // )
                            : Container(),
                      ),


                      // Container(
                      //   margin: EdgeInsets.only(left: 10, right: 10),
                      //   child: asc.data.responseMessege.messege == null ? Column(
                      //     children: [
                      //       asc.data.arrivalTues.isEmpty ? Container() : arrival(asc),
                      //       asc.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(asc),
                      //       asc.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(asc),
                      //       asc.data.inventory.isEmpty ? Container() : inventory(asc),
                      //       asc.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(asc),
                      //       asc.data.portPendency.isEmpty ? Container() : portPendency(asc),
                      //       asc.data.importJoInHand.isEmpty ? Container() : importJoInHand(asc),
                      //       asc.data.inTransit.isEmpty ? Container() : inTransit(asc),
                      //       asc.data.joInHand.isEmpty ? Container() : joInHand(asc),
                      //     ],
                      //   ) : Container(),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 10, right: 10),
                      //   child: as1.data.responseMessege.messege == null ? Column(
                      //     children: [
                      //       as1.data.arrivalTues.isEmpty ? Container() : arrival(as1),
                      //       as1.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(as1),
                      //       as1.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(as1),
                      //       as1.data.inventory.isEmpty ? Container() : inventory(as1),
                      //       as1.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(as1),
                      //       as1.data.portPendency.isEmpty ? Container() : portPendency(as1),
                      //       as1.data.importJoInHand.isEmpty ? Container() : importJoInHand(as1),
                      //       as1.data.inTransit.isEmpty ? Container() : inTransit(as1),
                      //       as1.data.joInHand.isEmpty ? Container() : joInHand(as1),
                      //     ],
                      //   ) : Container(),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 10, right: 10),
                      //   child: as2.data.responseMessege.messege == null ? Column(
                      //     children: [
                      //       as2.data.arrivalTues.isEmpty ? Container() : arrival(as2),
                      //       as2.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(as2),
                      //       as2.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(as2),
                      //       as2.data.inventory.isEmpty ? Container() : inventory(as2),
                      //       as2.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(as2),
                      //       as2.data.portPendency.isEmpty ? Container() : portPendency(as2),
                      //       as2.data.importJoInHand.isEmpty ? Container() : importJoInHand(as2),
                      //       as2.data.inTransit.isEmpty ? Container() : inTransit(as2),
                      //       as2.data.joInHand.isEmpty ? Container() : joInHand(as2),
                      //     ],
                      //   ) : Container(),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 10, right: 10),
                      //   child: as3.data.responseMessege.messege == null ? Column(
                      //     children: [
                      //       as3.data.arrivalTues.isEmpty ? Container() : arrival(as3),
                      //       as3.data.loadedDelivery.isEmpty ? Container() : loadedDelivery(as3),
                      //       as3.data.deStuffDelivery.isEmpty ? Container() : deStuffDelivery(as3),
                      //       as3.data.inventory.isEmpty ? Container() : inventory(as3),
                      //       as3.data.jobOrderReceived.isEmpty ? Container() : jobOrderReceived(as3),
                      //       as3.data.portPendency.isEmpty ? Container() : portPendency(as3),
                      //       as3.data.importJoInHand.isEmpty ? Container() : importJoInHand(as3),
                      //       as3.data.inTransit.isEmpty ? Container() : inTransit(as3),
                      //       as3.data.joInHand.isEmpty ? Container() : joInHand(as3),
                      //     ],
                      //   ) : Container(),
                      // ),
                    ]),
                  );
                });
          }),
    );
  }

  //ICDExportArrival
  Widget _generateFirstColumnRow1Arrival(BuildContext context, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
      ),
      child: Text("${asc.data.ICDExportArrival[index].process}", style: content1,
        textAlign: TextAlign.center,),
      //width: 100,
      //height: 52,
      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  Widget _generateRightHandSideColumnRow1Arrival(BuildContext context, int index) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportArrival[index].t20}", style: content1,
                textAlign: TextAlign.center,),
              //width: 100,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportArrival[index].t40}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportArrival[index].t45}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportArrival[index].total}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportArrival[index].tues}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportArrival[index].month}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportArrival[index].year}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportArrival[index].monthNo}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportArrival[index].date}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportArrival[index].grandTotal}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  //ICDExportstuffed
  Widget _generateFirstColumnRow1stuffed(BuildContext context, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
      ),
      child: Text("${asc.data.ICDExportstuffed[index].process}", style: content1,
        textAlign: TextAlign.center,),
      //width: 100,
      //height: 52,
      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  Widget _generateRightHandSideColumnRow1stuffed(BuildContext context, int index) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportstuffed[index].t20}", style: content1,
                textAlign: TextAlign.center,),
              //width: 100,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportstuffed[index].t40}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportstuffed[index].t45}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportstuffed[index].total}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportstuffed[index].tues}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportstuffed[index].month}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportstuffed[index].year}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportstuffed[index].monthNo}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportstuffed[index].date}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportstuffed[index].grandTotal}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  //ICDExportMovemet
  Widget _generateFirstColumnRow1Movemet(BuildContext context, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
      ),
      child: Text("${asc.data.ICDExportMovemet[index].process}", style: content1,
        textAlign: TextAlign.center,),
      //width: 100,
      //height: 52,
      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  Widget _generateRightHandSideColumnRow1Movemet(BuildContext context, int index) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMovemet[index].t20}", style: content1,
                textAlign: TextAlign.center,),
              //width: 100,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMovemet[index].t40}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMovemet[index].t45}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMovemet[index].total}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMovemet[index].tues}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMovemet[index].month}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMovemet[index].year}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMovemet[index].monthNo}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMovemet[index].date}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMovemet[index].grandTotal}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  //ICDExportInventory
  Widget _generateFirstColumnRow1Inventory(BuildContext context, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
      ),
      child: Text("${asc.data.ICDExportInventory[index].process}", style: content1,
        textAlign: TextAlign.center,),
      //width: 100,
      //height: 52,
      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  Widget _generateRightHandSideColumnRow1Inventory(BuildContext context, int index) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportInventory[index].t20}", style: content1,
                textAlign: TextAlign.center,),
              //width: 100,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportInventory[index].t40}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportInventory[index].t45}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportInventory[index].total}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportInventory[index].tues}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportInventory[index].month}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportInventory[index].year}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportInventory[index].monthNo}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportInventory[index].date}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportInventory[index].grandTotal}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  //ICDExportEmptyOut
  Widget _generateFirstColumnRow1EmptyOut(BuildContext context, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(

        color: bg,
        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
      ),
      child: Text("${asc.data.ICDExportEmptyOut[index].process}", style: content1,
        textAlign: TextAlign.center,),
      //width: 100,
      //height: 52,
      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  Widget _generateRightHandSideColumnRow1EmptyOut(BuildContext context, int index) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportEmptyOut[index].t20}", style: content1,
                textAlign: TextAlign.center,),
              //width: 100,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportEmptyOut[index].t40}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportEmptyOut[index].t45}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportEmptyOut[index].total}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportEmptyOut[index].tues}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportEmptyOut[index].month}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportEmptyOut[index].year}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportEmptyOut[index].monthNo}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportEmptyOut[index].date}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportEmptyOut[index].grandTotal}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  //ICDExportMonthWiseCollectionList
  Widget _generateFirstColumnRow1MonthWiseCollectionList(BuildContext context, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
      ),
      child: Text("${asc.data.ICDExportMonthWiseCollectionList[index].year}", style: content1,
        textAlign: TextAlign.center,),
      //width: 100,
      //height: 52,
      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  Widget _generateRightHandSideColumnRow1MonthWiseCollectionList(BuildContext context, int index) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMonthWiseCollectionList[index].date}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMonthWiseCollectionList[index].t20}", style: content1,
                textAlign: TextAlign.center,),
              //width: 100,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMonthWiseCollectionList[index].t40}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMonthWiseCollectionList[index].t45}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMonthWiseCollectionList[index].grandTotal}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportMonthWiseCollectionList[index].tues}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),




        ],
      ),
    );
  }

  //ICDExportPortWisePendency
  Widget _generateFirstColumnRow1PortWisePendency(BuildContext context, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
      ),
      child: Text("${asc.data.ICDExportPortWisePendency[index].process}", style: content1,
        textAlign: TextAlign.center,),
      //width: 100,
      //height: 52,
      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  Widget _generateRightHandSideColumnRow1PortWisePendency(BuildContext context, int index) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortWisePendency[index].t20}", style: content1,
                textAlign: TextAlign.center,),
              //width: 100,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortWisePendency[index].t40}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortWisePendency[index].t45}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortWisePendency[index].total}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortWisePendency[index].tues}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortWisePendency[index].month}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortWisePendency[index].year}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortWisePendency[index].monthNo}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortWisePendency[index].date}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortWisePendency[index].grandTotal}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  //
  Widget _generateFirstColumnRow1PortShutOut(BuildContext context, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
      ),
      child: Text("${asc.data.ICDExportPortShutOut[index].process}", style: content1,
        textAlign: TextAlign.center,),
      //width: 100,
      //height: 52,
      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  Widget _generateRightHandSideColumnRow1PortShutOut(BuildContext context, int index) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortShutOut[index].t20}", style: content1,
                textAlign: TextAlign.center,),
              //width: 100,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortShutOut[index].t40}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortShutOut[index].t45}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortShutOut[index].total}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortShutOut[index].tues}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortShutOut[index].month}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortShutOut[index].year}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortShutOut[index].monthNo}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortShutOut[index].date}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportPortShutOut[index].grandTotal}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  //ICDExportReMovement
  Widget _generateFirstColumnRow1ReMovement(BuildContext context, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
      ),
      child: Text("${asc.data.ICDExportReMovement[index].process}", style: content1,
        textAlign: TextAlign.center,),
      //width: 100,
      //height: 52,
      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  Widget _generateRightHandSideColumnRow1ReMovement(BuildContext context, int index) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReMovement[index].t20}", style: content1,
                textAlign: TextAlign.center,),
              //width: 100,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReMovement[index].t40}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReMovement[index].t45}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReMovement[index].total}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReMovement[index].tues}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReMovement[index].month}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReMovement[index].year}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReMovement[index].monthNo}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReMovement[index].date}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReMovement[index].grandTotal}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  //ICDExportReWorking
  Widget _generateFirstColumnRow1ReWorking(BuildContext context, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        border: Border(left: BorderSide(color: Colors.white),right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
      ),
      child: Text("${asc.data.ICDExportReWorking[index].process}", style: content1,
        textAlign: TextAlign.center,),
      //width: 100,
      //height: 52,
      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  Widget _generateRightHandSideColumnRow1ReWorking(BuildContext context, int index) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReWorking[index].t20}", style: content1,
                textAlign: TextAlign.center,),
              //width: 100,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReWorking[index].t40}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReWorking[index].t45}", style: content1,
                textAlign: TextAlign.center,),
              //width: 150,
              //height: 52,
              //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReWorking[index].total}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReWorking[index].tues}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReWorking[index].month}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReWorking[index].year}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReWorking[index].monthNo}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReWorking[index].date}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white)),
              ),
              child: Text("${asc.data.ICDExportReWorking[index].grandTotal}", style: content1,
                textAlign: TextAlign.center,),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }


  Widget arrival(AsyncSnapshot s) {
    //print("print arrival ${s.error}");
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child: Text("Arrival TEUS",
              textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Process',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                child: Text(
                  '20',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '40',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '45',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'Total',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'TEUS',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                //width: 150,
                //height: 52,
                //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              )),
            ],
          ),
        ),
        for (int i = 0; i < s.data.arrivalTues.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        s.data.arrivalTues[i].process,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.arrivalTues[i].size20}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 100,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.arrivalTues[i].size40}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.arrivalTues[i].size45}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.arrivalTues[i].total}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(color: Colors.white),
                          bottom: BorderSide(color: Colors.white))),
                  child: Text(
                    "${s.data.arrivalTues[i].tues}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget exportData(List<ArrivalTueExport> list,String title) {
    //print("print arrival ${s.error}");
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          // padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child: Text(title,
              textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Process',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                    child: Text(
                      '20',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                    child: Text(
                      '40',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                    child: Text(
                      '45',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                    child: Text(
                      'Total',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                    child: Text(
                      'TEUS',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    //width: 150,
                    //height: 52,
                    //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.center,
                  )),
            ],
          ),
        ),
        for (int i = 0; i < list.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        list[i].process,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        "${list[i].t20}",
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        "${list[i].t40}",
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 150,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        "${list[i].t45}",
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 150,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        "${list[i].total}",
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.white),
                              bottom: BorderSide(color: Colors.white))),
                      child: Text(
                        "${list[i].tues}",
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                    )),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget exportDataMonthWise(List<ArrivalTueExport> list,String title) {
    //print("print arrival ${s.error}");
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child: Text(title,
              textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    child: Text(
                      'Year',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    child: Text(
                      'Month',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      '20',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      '40',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      '45',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Total',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'TEUS',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    //width: 150,
                    //height: 52,
                    //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.center,
                  )),
            ],
          ),
        ),
        for (int i = 0; i < list.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        list[i].year,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        // color: bg,
                        border: Border(
                            // left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        list[i].date,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        "${list[i].t20}",
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        "${list[i].t40}",
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 150,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        "${list[i].t45}",
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 150,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        "${list[i].grandTotal}",
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.white),
                              bottom: BorderSide(color: Colors.white))),
                      child: Text(
                        "${list[i].tues}",
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                    )),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget exportDataCarted(List<ArrivalTueExport> list,String title) {
    //print("print arrival ${s.error}");
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          // padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child: Text(title,
              textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 6,
                  child: Container(
                    child: Text(
                      'Process',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    child: Text(
                      'Total',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),

            ],
          ),
        ),
        for (int i = 0; i < list.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        list[i].process,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                  flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        "${list[i].total}",
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),

              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget loadedDelivery(AsyncSnapshot s) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child: Text("Loaded Delivery",
              textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Process',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                child: Text(
                  '20',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '40',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '45',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'Total',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'TEUS',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                //width: 150,
                //height: 52,
                //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              )),
            ],
          ),
        ),
        for (int i = 0; i < s.data.loadedDelivery.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        s.data.loadedDelivery[i].process,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.loadedDelivery[i].size20}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 100,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.loadedDelivery[i].size40}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.loadedDelivery[i].size45}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.loadedDelivery[i].total}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.loadedDelivery[i].tues}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget deStuffDelivery(AsyncSnapshot s) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child: Text("De Stuff Delivery",
              textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Process',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                child: Text(
                  '20',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '40',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '45',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'Total',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'TEUS',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                //width: 150,
                //height: 52,
                //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              )),
            ],
          ),
        ),
        for (int i = 0; i < s.data.deStuffDelivery.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        s.data.deStuffDelivery[i].process,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.deStuffDelivery[i].size20}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 100,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.deStuffDelivery[i].size40}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.deStuffDelivery[i].size45}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.deStuffDelivery[i].total}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.deStuffDelivery[i].tues}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget inventory(AsyncSnapshot s) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child:
              Text("Inventory", textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Process',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                child: Text(
                  '20',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '40',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '45',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'Total',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'TEUS',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                //width: 150,
                //height: 52,
                //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              )),
            ],
          ),
        ),
        for (int i = 0; i < s.data.inventory.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        s.data.inventory[i].process,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.inventory[i].size20}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 100,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.inventory[i].size40}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.inventory[i].size45}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.inventory[i].total}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(color: Colors.white),
                          bottom: BorderSide(color: Colors.white))),
                  child: Text(
                    "${s.data.inventory[i].tues}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget jobOrderReceived(AsyncSnapshot s) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child: Text("Job Order Received",
              textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Process',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                child: Text(
                  '20',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '40',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '45',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'Total',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'TEUS',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                //width: 150,
                //height: 52,
                //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              )),
            ],
          ),
        ),
        for (int i = 0; i < s.data.jobOrderReceived.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        s.data.jobOrderReceived[i].process,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.jobOrderReceived[i].size20}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 100,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.jobOrderReceived[i].size40}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.jobOrderReceived[i].size45}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.jobOrderReceived[i].total}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.jobOrderReceived[i].tues}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget portPendency(AsyncSnapshot s) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child: Text("Port Pendency",
              textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Port',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                child: Text(
                  '20',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '40',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '45',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'Total',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'TEUS',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                //width: 150,
                //height: 52,
                //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              )),
            ],
          ),
        ),
        for (int i = 0; i < s.data.portPendency.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        s.data.portPendency[i].port,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.portPendency[i].size20}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 100,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.portPendency[i].size40}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.portPendency[i].size45}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.portPendency[i].total}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.portPendency[i].tues}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget importJoInHand(AsyncSnapshot s) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child: Text("Import JO In Hand",
              textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Port',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                child: Text(
                  '20',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '40',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '45',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'Total',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'TEUS',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                //width: 150,
                //height: 52,
                //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              )),
            ],
          ),
        ),
        for (int i = 0; i < s.data.importJoInHand.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        s.data.importJoInHand[i].port,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.importJoInHand[i].size20}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 100,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.importJoInHand[i].size40}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.importJoInHand[i].size45}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.importJoInHand[i].total}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.importJoInHand[i].tues}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget inTransit(AsyncSnapshot s) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child: Text("In Transit",
              textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Port',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                child: Text(
                  '20',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '40',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '45',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'Total',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'TEUS',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                //width: 150,
                //height: 52,
                //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              )),
            ],
          ),
        ),
        for (int i = 0; i < s.data.inTransit.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        s.data.inTransit[i].port,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.inTransit[i].size20}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 100,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.inTransit[i].size40}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.inTransit[i].size45}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.inTransit[i].total}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.inTransit[i].tues}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget joInHand(AsyncSnapshot s) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          height: 50,
          child: Text("JO In Hand",
              textAlign: TextAlign.center, style: headingBar),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          //padding: EdgeInsets.only(left: 2, right: 2),
          //margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Month',
                      style: content1,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  )),
              Expanded(
                  child: Container(
                child: Text(
                  '20',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '40',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  '45',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'Total',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
              Expanded(
                  child: Container(
                child: Text(
                  'TEUS',
                  style: content1,
                  textAlign: TextAlign.center,
                ),
                //width: 150,
                //height: 52,
                //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              )),
            ],
          ),
        ),
        for (int i = 0; i < s.data.joInHand.length; i++)
          Container(
            height: 50,
            //padding: EdgeInsets.only(left: 2, right: 2),
            //margin: EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: bg,
                        border: Border(
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Text(
                        s.data.joInHand[i].month,
                        style: content1,
                        textAlign: TextAlign.center,
                      ),
                      //width: 100,
                      //height: 52,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.center,
                    )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.joInHand[i].size20}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 100,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.joInHand[i].size40}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.joInHand[i].size45}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  //width: 150,
                  //height: 52,
                  //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.joInHand[i].total}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Text(
                    "${s.data.joInHand[i].tues}",
                    style: content1,
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                )),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

}

class DescriptionView extends StatefulWidget {
  final List<Widget> children;

  DescriptionView({this.children});

  @override
  _DescriptionViewState createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  // List<String> _detailTypes = ['ICD', 'CFS', 'NCL-1', 'NCL-2', 'NCL-3'];
  List<String> _detailTypes = ['Import', 'Export'];
  PageController _pageController;
  List<double> _heights;
  int _currentPage = 0;

  double get _currentHeight => _heights[_currentPage];

  @override
  void initState() {
    super.initState();
    _heights = widget.children.map((e) => 0.0).toList();
    _pageController = PageController()
      ..addListener(() {
        final _newPage = _pageController.page.round();
        if (_currentPage != _newPage) {
          setState(() => _currentPage = _newPage);
        }
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            color: footer1,
            alignment: Alignment.topCenter,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _detailTypes.length,
                itemBuilder: (c, i) {
                  return GestureDetector(
                    child: _currentPage == i
                        ? Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 30,
                              child: Center(
                                child: Text('${_detailTypes[i]}',
                                    style: optionStyle),
                              ),
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 30,
                            // margin: EdgeInsets.only(left: 8),
                            //color: footer1,
                            child: Center(
                              child: Text('${_detailTypes[i]}',
                                  style: optionStyle1),
                            ),
                          ),
                    onTap: () {
                      setState(() {
                        _currentPage = i;
                        _pageController.animateToPage(i,
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 400));
                      });
                    },
                  );
                }),
          ),
          TweenAnimationBuilder<double>(
            curve: Curves.easeInOutCubic,
            tween: Tween<double>(begin: _heights[0], end: _currentHeight),
            duration: const Duration(milliseconds: 100),
            builder: (c, v, child) {
              return SizedBox(height: v, child: child);
            },
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              children: _sizeReportingChildren
                  .asMap()
                  .map((index, child) => MapEntry(index, child))
                  .values
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get _sizeReportingChildren => widget.children
      .asMap()
      .map((index, child) => MapEntry(
          index,
          OverflowBox(
            minHeight: 0,
            maxHeight: double.infinity,
            alignment: Alignment.topCenter,
            child: SizeReportingWidget(
              onSizeChanged: (size) =>
                  setState(() => _heights[index] = size?.height ?? 0),
              child: Align(
                child: child,
              ),
            ),
          )))
      .values
      .toList();
}

class SizeReportingWidget extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeChanged;

  SizeReportingWidget({this.child, this.onSizeChanged});

  @override
  _SizeReportingWidgetState createState() => _SizeReportingWidgetState();
}

class _SizeReportingWidgetState extends State<SizeReportingWidget> {
  Size _oldSize;

  _notifySize() {
    final size = context?.size;
    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeChanged(size);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (this.mounted) {
        _notifySize();
      }
    });
    return widget.child;
  }
}
