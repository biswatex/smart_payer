import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';

import 'mobilereghargedash.dart';

class MyRecharge extends StatelessWidget with NavigationStates  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 70),
                child: Text("Recharge User Now", style: GoogleFonts.abel(
                  textStyle: TextStyle(
                    color: Colors.red[400],
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  textAlign: TextAlign.end,),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      child: DefaultTabController(
                        length: 2,
                        child: Scaffold(
                          backgroundColor: Colors.red[100],
                          appBar: AppBar(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                            ),
                            title: Text("Select the operator", style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                            ),),
                            backgroundColor: Colors.redAccent,
                            bottom: TabBar(
                              tabs: [
                                Tab(icon: Icon(Icons.phone_android), text: "Mobile",),
                                Tab(icon: Icon(Icons.live_tv), text: "DTH",),
                              ],
                            ),
                          ),
                          body: TabBarView(
                            children: [
//                              MobileRechargeDash(),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          ClipOval(
                                            child: Material(
                                              color: Colors.white, // button color
                                              child: InkWell(
                                                splashColor: Colors.red, // inkwell color
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/airtel.png'))),
                                                ),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(15.0),
                                                    child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/bsnl.png'))),
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          ClipOval(
                                            child: Material(
                                              color: Colors.white, // button color
                                              child: InkWell(
                                                splashColor: Colors.red, // inkwell color
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/vodafone.png'))),
                                                ),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(15.0),
                                                    child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/idea.png'))),
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          ClipOval(
                                            child: Material(
                                              color: Colors.white, // button color
                                              child: InkWell(
                                                splashColor: Colors.red, // inkwell color
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/jio.png'))),
                                                ),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(15.0),
                                                    child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/atnt.png'))),
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          ClipOval(
                                            child: Material(
                                              color: Colors.white, // button color
                                              child: InkWell(
                                                splashColor: Colors.red, // inkwell color
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/tatasky.png'))),
                                                ),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(15.0),
                                                    child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/dishtv.png'))),
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          ClipOval(
                                            child: Material(
                                              color: Colors.white, // button color
                                              child: InkWell(
                                                splashColor: Colors.red, // inkwell color
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/sun.png'))),
                                                ),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(15.0),
                                                    child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/airteldth.jpg'))),
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          ClipOval(
                                            child: Material(
                                              color: Colors.white, // button color
                                              child: InkWell(
                                                splashColor: Colors.red, // inkwell color
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/videocon-d2h-logo-png-1.png'))),
                                                ),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(15.0),
                                                    child: SizedBox(width: 66, height: 66, child: Image(image: AssetImage('assets/other.jpg'))),
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ),
              ),
            ],
          ),
        )
    );
  }
}
