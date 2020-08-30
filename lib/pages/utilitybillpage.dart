import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_dialog/flutter_progress_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';

import 'billprovider.dart';

List <String> serviceslist = [
  'Electricity',
  'Postpaid',
  'Water',
  'Gas',
  'Landline'
] ;

String bill_type_main;
List <String> stateslist = [
      'New Delhi',
      'West Bengal',
      'Maharashtra',
      'Madhya Pradesh',
      'Arunachal Pradesh',
      'Andhra Pradesh',
      'Assam',
      'Bihar',
      'Chattisgarh',
      'Dadra and Nagar Haveli',
      'Daman and Diu',
      'Goa',
      'Gujarat',
      'Haryana',
      'Himachal Pradesh',
      'Jharkhand',
      'Karnataka',
      'Kerala',
      'Meghalaya',
      'Mizoram',
      'Nagaland',
      'Odisha',
      'Puducherry',
      'Punjab',
      'Rajasthan',
      'Sikkim',
      'Tamil Nadu',
      'Telangana',
      'Tripura',
      'Uttar Pradesh',
      'Uttarakhand',
] ;

class UtilityBill extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: AutoSizeText("My Utility Bills", style: GoogleFonts.abel(
                      textStyle: TextStyle(
                        color: Colors.red[400],
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.end,),
                ),
              ),
              SizedBox(height: 40),
              Container(
                height: 200,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        flex:1,
                        child: DropDown(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right:8.0,bottom: 8.0),
                  child: Container(
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
class DropDown extends StatefulWidget {
  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State {

  String dropdownValueService = 'Electricity';
  String dropdownValueState = 'New Delhi';

  @override
  Widget build(BuildContext context) {
    return Material(
      child:
        Container(
          child: Column(
              children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                child: DropdownButton<String>(
                  value: dropdownValueService,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                  underline: Container(
                    height: 2,
                    color: Colors.redAccent,
                  ),
                  onChanged: (String data) {
                    setState(() {
                      dropdownValueService = data;
                    });
                  },
                  items: serviceslist.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValueState,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                  underline: Container(
                    height: 2,
                    color: Colors.redAccent,
                  ),
                  onChanged: (String data) {
                    setState(() {
                      dropdownValueState = data;
                    });
                  },
                  items: stateslist.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.redAccent,
              onPressed: () async {

//                setState(() {
//                  Navigator.pushReplacementNamed(context, '/loginhome');
//                });
                if (dropdownValueService == "Electricity")
                  {
                    bill_type_main = 'electricity';
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new BillProvider(value: dropdownValueState,),
                    );
//                    Navigator.pushNamed(context, '/billprovider');
                    Navigator.of(context).push(route);
                    await new Future.delayed(const Duration(seconds : 1));
                  }
                else
                  {
                    Dialog errorDialog = Dialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
                    child: Container(
                    height: 250.0,
                    width: 300.0,

                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Text('Right now we are only supporting electricity bill payments, but shall get back to you with an update as soon as we start supports for other payments, Thank You.\n- SmartPayer Support Team', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 50.0)),
                    FlatButton(onPressed: (){
                    Navigator.of(context).pop();
                    },
                    child: Text('Got It!', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
                    ],
                    ),
                    ),
                    );
                    showDialog(context: context, builder: (BuildContext context) => errorDialog);
                  }
              },
              child: new Text("Search", style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
              ),),
            ),
//            Expanded(
//              flex: 1,
//              child: Container(
//                color: Colors.red,
//              ),
//            )
//          Text('Selected Item = ' + '$dropdownValueService',
//              style: TextStyle
//                (fontSize: 22,
//                  color: Colors.black)),
          ]),
        ),
    );
  }
}
