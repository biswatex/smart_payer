import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/drawer/gf_drawer.dart';
import 'package:getflutter/components/drawer/gf_drawer_header.dart';
import 'package:smart_payer/pages/sidebar_layout.dart';

class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideBarLayout(),

    );
  }
}


//Paste inside scaffold to work
//appBar: AppBar(
//centerTitle: true,
//title: Text('Smart Payer',
//style: TextStyle(
//fontFamily: 'tahoma',
//fontSize: 25.0,
//),
//),
//),
//drawer: GFDrawer(
//child: ListView(
//padding: EdgeInsets.zero,
//children: <Widget>[
//GFDrawerHeader(
//decoration:BoxDecoration(
//gradient: LinearGradient(colors:[Colors.red,Colors.black],begin:Alignment.topCenter, end: Alignment.bottomCenter),
//),
//
//child: Column(
//mainAxisAlignment: MainAxisAlignment.start,
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Text('John Doe',
//style: TextStyle(
//fontSize: 30.0,
//fontFamily: 'tahoma',
//color: Colors.white,
//fontWeight: FontWeight.bold,
//),),
//Text('johndoe@userid.com',
//style: TextStyle(
//fontSize: 20.0,
//fontFamily: 'tahoma',
//color: Colors.white,
//),),
//],
//),
//),
//ListTile(
//leading: Icon(FeatherIcons.briefcase),
//title: Text('Item 1',
//style: TextStyle(
//fontSize: 18.0,
//fontWeight: FontWeight.bold,
//fontFamily: 'tahoma'
//),
//),
//onTap: null,
//),
//ListTile(
//leading: Icon(FeatherIcons.flag),
//title: Text('Item 2',
//style: TextStyle(
//fontSize: 18.0,
//fontWeight: FontWeight.bold,
//fontFamily: 'tahoma'
//)
//),
//onTap: null,
//),
//Divider(),
//
//],
//),
//),