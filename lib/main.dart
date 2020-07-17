import 'package:flutter/material.dart';
import 'package:smart_payer/pages/billprovider.dart';
import 'package:smart_payer/pages/home.dart';
import 'package:smart_payer/pages/loading.dart';
import 'package:smart_payer/pages/login.dart';
import 'package:smart_payer/pages/loginhome.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.redAccent,
    primaryColorDark: Colors.red,
    primaryColorLight: Colors.redAccent[100],
    focusColor: Colors.red,
    hoverColor: Colors.red,
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home' : (context) => Home(),
    '/login' : (context) => Login(),
    '/loginhome' : (context) => LoginHome(),
    '/billprovider' : (context) => BillProvider(),
  },
));
