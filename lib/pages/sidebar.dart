import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';
import 'package:smart_payer/services/menu_item.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';

import 'loading.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {

  AnimationController _animationController;

  StreamController<bool> isSidebarStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  String email, name;
//  final bool isSideBarOpen = true;
  final _animationDuration = const Duration(milliseconds: 300);

  @override
  Future<void> initState()  {
    // TODO: implement initState
    super.initState();
    email = prefs.getString("username");
    name = prefs.getString("f_name")+" "+prefs.getString("l_name");
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarStreamController.stream;
    isSidebarOpenedSink= isSidebarStreamController.sink;
  }

  @override
  void dispose() {
    isSidebarStreamController.close();
    _animationController.dispose();
    isSidebarOpenedSink.close();
    // TODO: implement dispose
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted)
      {
        isSidebarOpenedSink.add(false);
        _animationController.reverse();
      }
    else{
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;


    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSidebarOpenedAsync)
      {
        return AnimatedPositioned(
          duration: _animationDuration,
          top:0,
          bottom: 0,
          left: isSidebarOpenedAsync.data ? 0 : -screenwidth ,
          right: isSidebarOpenedAsync.data ? 0 : screenwidth-50,
          child: Row(

            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height > 710 ? MediaQuery.of(context).size.height : 710,
                    color: Colors.redAccent,
                    child: Column(
                      children: <Widget>[
                        SizedBox (height: 65,),
                        ListTile(
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.AccountClickEvent);
                          },
                          title:Text(name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                fontFamily: 'tahoma'
                            ),
                          ),
                          subtitle: Text(email,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'tahoma',
                              color: Colors.white,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.red[200],
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                              size: 40.0,
                            ),
                            radius: 40.0,
                          ),
                        ),
                        Divider(
                          height: 64.0,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 16,
                          endIndent: 16,
                        ),
                        MenuItem(
                          icon: Icons.home,
                          title: 'Homepage',
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.account_circle,
                          title: 'Utility Bill',
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.UtilityBillClickEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.payment,
                          title: 'Recharge',
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.RechargeClickEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.insert_chart,
                          title: 'Reports',
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ReportClickEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.sync,
                          title: 'Money Transfer',
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MoneyTransferClickEvent);
                          },
                        ),
                        Divider(
                          height: 64.0,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 16,
                          endIndent: 16,
                        ),
                        MenuItem(
                          icon: Icons.security,
                          title: 'Change Password',
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ChangePasswordClickEvent);
                          },
                        ),
                        MenuItem(
                          icon: FeatherIcons.logOut,
                          title: 'Logout',
                          onTap: () async {
                            onIconPressed();

                              await animated_dialog_box.showScaleAlertBox(
                                  title: Center(child: Text("Are you sure ?")), // IF YOU WANT TO ADD
                                  context: context,
                                  firstButton: MaterialButton(
                                    // FIRST BUTTON IS REQUIRED
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: Colors.white,
                                    child: Text('Yes'),
                                    onPressed: () async {
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs?.setBool("isLoggedIn", false);
//                                      Navigator.of(context).pop(false);
                                      Navigator.of(context).pop();
                                      Navigator.pushReplacementNamed(context, '/login');
                                    },
                                  ),
                                  secondButton: MaterialButton(
                                    // OPTIONAL BUTTON
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    color: Colors.white,
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  icon: Icon(Icons.info_outline,color: Colors.red,), // IF YOU WANT TO ADD ICON
                                  yourWidget: Container(
                                    child: Text('Are you sure you want to log out ?'),
                                  ));

                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 40,
                      height: 110,
                      color: Colors.redAccent,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Paint paint= Paint();
    paint.color = Colors.white;
    Path path = Path();

    final width = size.width;
    final height = size.height;

    path.moveTo(0,0);
    path.quadraticBezierTo(0, 6, 7, 13);
    path.quadraticBezierTo(width-1 , height/2 - 20, width, height/2);
    path.quadraticBezierTo(width+1 , height/2 + 20, 10, height-13);
    path.quadraticBezierTo(0 , height-4, 0 , height);
    path.close();


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
