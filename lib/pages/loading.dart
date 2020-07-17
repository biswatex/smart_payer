import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();

}
SharedPreferences prefs;

class _LoadingState extends State<Loading> {

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    open();
  }
  Future<void> open() async {
    prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    Timer(Duration(seconds: 2),() => status == true ? Navigator.pushReplacementNamed(context, '/loginhome'):Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SpinKitFadingCube(
                    color: Colors.white,
                    size: 120.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:30.0, horizontal: 50.0),
                  ),
                  Text (
                    'SmartPayer App',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'cnl',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
