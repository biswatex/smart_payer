import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/position/gf_position.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:getflutter/size/gf_size.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';
import 'package:smart_payer/pages/reportdash.dart';

import 'dashboard.dart';
import 'loading.dart';

class AccountPage extends StatelessWidget with NavigationStates {

  String address = prefs.getString("address");
  String pan = prefs.getString("pan");
  String adhaar =  prefs.getString("aadhar");
  String name = prefs.getString("f_name")+" "+prefs.getString("l_name");


  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.8;
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.red[900],
            ),
            clipper: getClipper(),
          ),
          ClipPath(
            child: Container(
              color: Colors.orangeAccent,
            ),
            clipper: getClipper2(),
          ),
          Positioned(
            left: 25,
            width: 350,
            top: MediaQuery.of(context).size.height/6+25,
            child: Column(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(image: AssetImage('assets/men_profile.png',),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(75)),
                    boxShadow: [BoxShadow(blurRadius: 11.0, color: Colors.black),]
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  name,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Outlet Owner",
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height:20,),
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height:10,),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:15.0),
                            child: Text("Address:",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left:15.0),
                              child: Text("$address",
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:15,),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:15.0),
                            child: Text("Pan Number:",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),),
                          ),
                        ],
                      ),
                      SizedBox(height:5,),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left:15.0),
                              child: Text("$pan",
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:15,),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:15.0),
                            child: Text("Aadhar Number:",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),),
                          ),
                        ],
                      ),
                      SizedBox(height:5,),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left:15.0),
                              child: Text("$adhaar",
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: c_width,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left:50.0, top: 30.0),
                              child: GFButton(
                                boxShadow: BoxShadow(blurRadius: 5.0, color: Colors.black),
                                onPressed: (){},
                                text: "Edit Details",
                                shape: GFButtonShape.pills,
                                size: GFSize.LARGE,
                                color: Colors.red,
                                hoverColor: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20.0, top: 30.0),
                              child: GFButton(
                                onPressed: (){},
                                boxShadow: BoxShadow(blurRadius: 5.0, color: Colors.black),
                                text: "Change Password",
                                shape: GFButtonShape.pills,
                                size: GFSize.LARGE,
                                color: Colors.red,
                                position: GFPosition.end,
                                hoverColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),

        ],
      )
    );
  }
}
class getClipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0.0, size.height/3.0+50);
    path.lineTo(size.width+425, 0.0);
    path.close();
    return path;


  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
class getClipper2 extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.moveTo(size.height/3.0, 10000);
    path.lineTo(0.0, size.height/3.0+200);
    path.lineTo(size.width+425, 100.0);

    path.close();
    return path;


  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}