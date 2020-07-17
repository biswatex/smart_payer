import 'package:animated_walkthrough/animated_walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> {
//
//  Map data = {};
//
//  @override
//  Widget build(BuildContext context) {
//
//    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
//
//    print(data);
//
//    //set backgoround
//
//    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
//    Color bgColor = data['isDaytime'] ? Colors.blueAccent : Colors.indigo;
//
//    return Scaffold(
//      backgroundColor: bgColor,
//      body: SafeArea(
//          child: Container(
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('assets/$bgImage'),
//                fit: BoxFit.cover,
//              ),
//            ),
//            child: Padding(
//              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
//              child: Column(
//                children: <Widget>[
//                  FlatButton.icon(
//                    onPressed:() async {
//                      dynamic result = await Navigator.pushNamed(context, '/location');
//                      setState(() {
//                        data = {
//                          'time' : result['time'],
//                          'location':result['location'],
//                          'flag':result['flag'],
//                          'isDaytime':result['isDaytime'],
//                        };
//                      });
//                    } ,
//                    icon: Icon(
//                      Icons.edit_location,
//                      color: Colors.grey[300],
//                    ),
//                    label: Text(
//                        'Edit Location',
//                            style: TextStyle(
//                              color: Colors.grey[300],
//                            ),
//                    ),
//                  ),
//                  SizedBox(height: 20.0),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        data['location'],
//                        style: TextStyle(
//                          fontSize: 28.0,
//                          letterSpacing: 2.0,
//                          color: Colors.white,
//                        ),
//                      )
//                    ],
//                  ),
//                  SizedBox(height: 20.0,),
//                  Text(
//                    data['time'],
//                    style: TextStyle(
//                      fontSize: 66.0,
//                      color: Colors.white,
//                    ),
//                  )
//                ],
//              ),
//            ),
//          )
//      ),
//    );
//  }
//}

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}


class _State extends State<Home> {
  static BuildContext _context;
  @override
  static List<PageViewModel> listPagesViewModel = [
  PageViewModel(
    titleWidget: Text("Pay Smart Now",
    style: TextStyle(
      fontFamily: 'tahoma',
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),),
    bodyWidget: Text("Pay smartly and recharge now as you can do it online using this smart payer",
    style: TextStyle(
      fontFamily: 'tahoma',
      fontSize: 18.0,

    ),
      textAlign: TextAlign.center,
    ),
    image: Center(child: Image.asset("assets/pay.png", height: 175.0)),
    decoration: const PageDecoration(
    pageColor: Colors.white,
    imageBackgroudColor: Colors.redAccent,
      imageFlex: 2,
    ),
  ),
    PageViewModel(
      titleWidget: Text("Pay Better",
        style: TextStyle(
          fontFamily: 'tahoma',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),),
      bodyWidget: Text("Whenever you have a customer you can pay right at us and we shall get back and along with you",
        style: TextStyle(
          fontFamily: 'tahoma',
          fontSize: 18.0,

        ),
        textAlign: TextAlign.center,
      ),
      image: Center(child: Image.asset("assets/pay smart.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.white,
        imageBackgroudColor: Colors.redAccent,
        imageFlex: 2,
      ),
    ),

    PageViewModel(
      titleWidget: Text("Pay Secured",
        style: TextStyle(
          fontFamily: 'tahoma',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),),
      bodyWidget: Text("With us you have no security issues rest assured your payments will be secure and comfortable",
        style: TextStyle(
          fontFamily: 'tahoma',
          fontSize: 18.0,

        ),
        textAlign: TextAlign.center,
      ),
      image: Center(child: Image.asset("assets/secured.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.white,
        imageBackgroudColor: Colors.redAccent,
        imageFlex: 1,
      ),
    ),
    PageViewModel(
      titleWidget: Text("Pay Secured",
        style: TextStyle(
          fontFamily: 'tahoma',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),),
      bodyWidget: Text("With us you have no security issues rest assured your payments will be secure and comfortable",
        style: TextStyle(
          fontFamily: 'tahoma',
          fontSize: 18.0,

        ),
        textAlign: TextAlign.center,
      ),
      image: Center(child: Image.asset("assets/secured.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.white,
        imageBackgroudColor: Colors.redAccent,
        imageFlex: 1,
      ),
      footer: RaisedButton(
        color: Colors.redAccent,
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs?.setBool("isLoggedIn", true);
          Navigator.pushReplacementNamed(_context, '/login');
          // On button presed
        },
        child: const Text("Get Started",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    ),
  ];
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () {
          // When done button is press
        },
        next: Text('Next'),
        showSkipButton: true,
        skip: const Text("Skip"),
        done: const Text("", style: TextStyle(fontWeight: FontWeight.w600)),
      )
    );
  }

}
