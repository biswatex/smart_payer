import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';

import 'electricityreports.dart';

class ReportDash extends StatefulWidget {
  @override
  _ReportDashState createState() => _ReportDashState();
}

class _ReportDashState extends State<ReportDash> {
  List report = [
    [Icons.phone_android,"Recharge Report",Colors.lightGreen],
    [Icons.trending_up,"Statement Report",Colors.orange],
    [Icons.cached,"Refund Report",Colors.pink],
    [Icons.payment,"Utility Report",Colors.deepOrange],
    [Icons.toys,"Water Bill Report",Colors.orangeAccent],
    [Icons.battery_charging_full,"Electricity Report",Colors.red]
  ];
  Widget MyItems(IconData icon, String title, Color color){
    return Material(
      color: Colors.blue[900],
      elevation: 14,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: () async {
          if(title == "Electricity Report") {
            var route = new MaterialPageRoute(
              builder: (BuildContext context) =>
              new ElectricityReports(),
            );
//                    Navigator.pushNamed(context, '/billprovider');
            Navigator.of(context).push(route);
          }
          else
            {
              await animated_dialog_box.showScaleAlertBox(
                  title: Center(child: Text("Feature Unavailable")), // IF YOU WANT TO ADD
                  context: context,
                  firstButton: MaterialButton(
                    // FIRST BUTTON IS REQUIRED
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Text('OK'),
                    onPressed: () async {
                      Navigator.of(context).pop();
//                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginHome()));
                    },
                  ),
                  icon: Icon(Icons.report, color: Colors.red,size: 50,), // IF YOU WANT TO ADD ICON
                  yourWidget: Container(
                    child: Text('Presently our app does not support any other types of reports since we dont accept other payments, but we are working to get them to you soon.'),
                  ));
            }
        },
        child: Center(
          child: Container(
            width:MediaQuery.of(context).size.width*0.4,
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        width:MediaQuery.of(context).size.width*0.3,
                        child: AutoSizeText(title,
                          textAlign: TextAlign.center,
                          maxLines:2,
                          style:GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )
                          ),),
                      ),
                    Material(
                      color: color,
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                          padding: EdgeInsets.all(16),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: GridView.count(
            crossAxisCount:2,
            children: List.generate(report.length,(index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: MyItems(report[index][0],report[index][1],report[index][2]),
                ),
              );
            }
            ),
          )
      ),
      /*StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 18.0,
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
        children: <Widget>[
          MyItems(Icons.phone_android,"Recharge Report",Colors.lightGreen),
          MyItems(Icons.trending_up,"Statement Report",Colors.orange),
          MyItems(Icons.cached,"Refund Report",Colors.pink),
          MyItems(Icons.payment,"Utility Report",Colors.deepOrange),
          MyItems(Icons.toys,"Water Bill Report",Colors.orangeAccent),
          MyItems(Icons.battery_charging_full,"Electricity Report",Colors.red),
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 130),
          StaggeredTile.extent(1, 130),
          StaggeredTile.extent(1, 130),
          StaggeredTile.extent(1, 130),
          StaggeredTile.extent(1, 130),
          StaggeredTile.extent(1, 130),
        ],
      ),*/
    );
  }
}
