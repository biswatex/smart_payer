import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';
import 'package:smart_payer/pages/reportdash.dart';


class Reports extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,left: 60),
                  child: Text("Generate Reports", style: GoogleFonts.abel(
                    textStyle: TextStyle(
                      color: Colors.red[400],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    textAlign: TextAlign.end,),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 6,
                child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      child: ReportDash(),
                    )
                ),
              ),
            ],
          ),
        )
    );
  }
}
