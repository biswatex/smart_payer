import 'package:flutter/material.dart';
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';

class MoneyTransfer extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Wallet',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}
