import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';
import 'package:smart_payer/pages/sidebar.dart';

import 'homepage.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider <NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
            children: <Widget>[
              BlocBuilder<NavigationBloc,NavigationStates>(
                builder: (context, navigationState){
                  return navigationState as Widget;
                },
              ),
            SideBar(),
        ],
      ),
    ));
  }
}
