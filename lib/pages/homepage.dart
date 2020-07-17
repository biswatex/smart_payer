import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';

import 'dashboard.dart';


class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text("Welcome to SmartPayer", style: GoogleFonts.abel(
                textStyle: TextStyle(
                  color: Colors.red[400],
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textAlign: TextAlign.end,),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                height: 450,
                child: Dashboard(),
              )
            ),
          ],
        ),
      )
    );
  }
}
