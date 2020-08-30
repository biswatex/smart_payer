import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';
import 'mobilereghargedash.dart';

class MyRecharge extends StatelessWidget with NavigationStates  {
  List<Image> mobile=[
    Image(image: AssetImage('assets/airtel.png')),
    Image(image: AssetImage('assets/idea.png')),
    Image(image: AssetImage('assets/bsnl.png')),
    Image(image: AssetImage('assets/vodafone.png')),
    Image(image: AssetImage('assets/jio.png')),
    Image(image: AssetImage('assets/atnt.png')),
  ];
  List<Image> dth=[
    Image(image: AssetImage('assets/dishtv.png')),
    Image(image: AssetImage('assets/sun.png')),
    Image(image: AssetImage('assets/tatasky.png')),
    Image(image: AssetImage('assets/airteldth.jpg')),
    Image(image: AssetImage('assets/videocon-d2h-logo-png-1.png')),
    Image(image: AssetImage('assets/airtel.png')),
  ];
  Widget clip(context,image){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var clipSize = width*0.2;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: Material(
          color: Colors.white, // button color
          child: InkWell(
            splashColor: Colors.red, // inkwell color
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(width:clipSize, height: clipSize, child:image),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(

        actions:[
          Container(
            padding: EdgeInsets.only(right:10),
          alignment: Alignment.centerRight,
          width: MediaQuery.of(context).size.width*0.7,
            child: AutoSizeText("Recharge User Now",
            maxLines:1,
            style: GoogleFonts.abel(
              textStyle: TextStyle(
                fontSize: 24,
                color: Colors.red[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            textAlign: TextAlign.end,),
        ),],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
        body: Container(
          padding: EdgeInsets.only(left: 20,top:30),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          )
                      ),
                      child: DefaultTabController(
                        length: 2,
                        child: Scaffold(
                          appBar: AppBar(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                            ),
                            title: AutoSizeText("Select the operator", style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                            ),),
                            backgroundColor: Colors.redAccent,
                            bottom: TabBar(
                              tabs: [
                                Tab(icon: Icon(Icons.phone_android), text: "Mobile",),
                                Tab(icon: Icon(Icons.live_tv), text: "DTH",),
                              ],
                            ),
                          ),
                          body: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.red[100],
                            child: TabBarView(
                                children: [
                                  Container(
                                      child: GridView.count(
                                        crossAxisCount: 3,
                                        children: List.generate(mobile.length,(index) {
                                          return Center(
                                            child: clip(context,mobile[index]),
                                          );
                                        }
                                        ),
                                      )
                                  ),
                                  Container(
                                      child: GridView.count(
                                        crossAxisCount: 3,
                                        children: List.generate(dth.length,(index) {
                                          return Center(
                                            child: clip(context,dth[index]),
                                          );
                                        }
                                        ),
                                      )
                                  ),
                                ]
                                ),
                          ),
                        ),)
                    )
                )
              )
            ],
          ),
        ),
    );
  }
}
