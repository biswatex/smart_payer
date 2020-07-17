import 'package:flutter/material.dart';
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';

class ChangePassword extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}
