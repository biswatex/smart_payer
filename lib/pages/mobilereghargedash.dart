import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileRechargeDash extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<MobileRechargeDash> {

  Material MyItems(IconData icon, String title, Color color)
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
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: StaggeredGridView.count(
        scrollDirection: Axis.vertical,
          crossAxisCount: 3,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
        children: <Widget>[
          MyItems(Icons.account_balance,"B2B Balance",Colors.green),
          MyItems(Icons.show_chart,"Total Recharge",Colors.blueAccent),
          MyItems(Icons.cached,"Total Transfered",Colors.greenAccent),
          MyItems(Icons.payment,"Total Bill Payment",Colors.amber),
          MyItems(Icons.swap_vert,"Total",Colors.red),
        ],
        staggeredTiles: [
          StaggeredTile.extent(3, 100),
          StaggeredTile.extent(1, 100),
          StaggeredTile.extent(1, 100),
          StaggeredTile.extent(1, 100),
        ],
      ),
    );
  }
}
