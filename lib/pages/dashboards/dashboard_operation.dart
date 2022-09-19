import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/alerts.dart';
import '../../utils/app_properties.dart';
import '../../utils/my_flutter_app_icons.dart';

import '../phase1/combine_page.dart';
import '../phase1/dmr_page.dart';

class DashboardOperation extends StatefulWidget {
  @override
  _DashboardOperationState createState() => _DashboardOperationState();
}

class _DashboardOperationState extends State<DashboardOperation>{

  String versionName, versionCode;

  @override
  void initState() {
    getVersion();
    getDashboardDetails();
    super.initState();
  }

  getVersion() async{

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      versionName = packageInfo.version;
      versionCode = packageInfo.buildNumber;
    });
    print("versions $versionCode $versionName");

  }

  getDashboardDetails() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("UserID");
    print("id value of the user $id");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Alerts.showExit(context, "Exit", "Are you sure?");
        return;
      },
      child: Scaffold(
          backgroundColor: Colors.black54,
          appBar: _appBar(),
          body: StaggeredGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
           // padding: EdgeInsets.all(8),
            children: <Widget>[
              StaggeredGridTile.fit(crossAxisCellCount: 2, child:
              _buildTile(
                Container(
                    height:100,

                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //Text('Container Freight Stations', style: TextStyle(color: Colors.blueAccent)),
                                Text('Combined\nMovement Report',
                                  //textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,)),
                                )
                              ],
                            ),
                            Material(
                                color: Colors.blue,
                                shape: CircleBorder(),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Icon(MyFlutterApp.container, color: Colors.white, size: 45.0),
                                    )
                                )
                            )
                          ]
                      ),
                    )),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => CombinePage())),
              )),
              StaggeredGridTile.fit(crossAxisCellCount: 1,
                  child:_buildTile(
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Material(
                                color: Colors.lime,
                                shape: CircleBorder(),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Icon(MyFlutterApp.shipping_container, color: Colors.white, size: 45.0),
                                    )
                                )
                            ),
                            Text('Today\'s\nAt a Glance',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,)),
                            ),
                          ]
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DmrPage())),
                  )),
            ],
            /*staggeredTiles: [
              StaggeredTile.extent(2, 100.0),
              StaggeredTile.extent(2, 100.0),
              // StaggeredTile.extent(1, 137.0),
              // StaggeredTile.extent(1, 140.0),
              // StaggeredTile.extent(1, 140.0),
              // StaggeredTile.extent(2, 100.0),
            ],*/
          ),
          bottomSheet: SafeArea(
            child: Container(
                padding: EdgeInsets.only(bottom: 3, top: 3),
                alignment: Alignment.bottomCenter,
                color: Colors.black54,
                height: 20,
                width: double.infinity,
                child: Text("tracker for Navkar     version: $versionName",
                    style:
                    GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,))
                )
            ),
          )
      ),
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }

  Widget _appBar(){
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: bg,
      centerTitle: true,
      elevation: 0,
      title: Text("Dashboard", style: headingBar),
      actions: [
        IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: (){
              Alerts.showLogOut(context, "LogOut", "Are you sure?");
            }),
      ],
    );
  }
}