import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';
import 'dashboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height*0.2),
        child: Container(
          height:height*0.2,
              padding: EdgeInsets.only(right: 20,top:30,left:width*0.3),
              child: SizedBox(
                child: AutoSizeText("Welcome to SmartPayer",
                  maxLines: 2,
                  maxFontSize: 56,
                  minFontSize: 36,
                  style: GoogleFonts.abel(
                  textStyle: TextStyle(
                    color: Colors.red[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  textAlign: TextAlign.end,),
              ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              height: height*0.7,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Dashboard(),
            ),
          ],
        ),
      )
    );
  }
}
