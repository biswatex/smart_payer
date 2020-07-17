import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loading.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  String bal, total_recharge, total_transfered, total_bills, total;

  Material MyItems(IconData icon, String title, String subtitle, Color color)
  {
    return Material(
      color: color,
      elevation: 14,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(24),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(title,style:GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,

                          )
                        ),),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Text(subtitle,style:GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )
                      ),),
                    ),
                  ),
                  Material(
                    color: color,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal:16),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bal = prefs.getString("bal");
    total_recharge = prefs.getString("total_recharge");
    total_transfered = prefs.getString("total_transfer");
    total_bills = prefs.getString("bill_payment");
    total = prefs.getString("total");
    return Scaffold(
      body: StaggeredGridView.count(
          crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        children: <Widget>[
          MyItems(Icons.account_balance,"B2B Balance",bal,Colors.green),
          MyItems(Icons.show_chart,"Total Recharge",total_recharge,Colors.blueAccent),
          MyItems(Icons.cached,"Total Transfered",total_transfered,Colors.greenAccent),
          MyItems(Icons.payment,"Total Bill Payment",total_bills,Colors.amber),
          MyItems(Icons.swap_vert,"Total",total,Colors.red),
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(2, 130),
        ],
      ),
    );
  }
}
