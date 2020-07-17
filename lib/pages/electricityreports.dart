import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'loading.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';

import 'login.dart';

class ElectricityReports extends StatefulWidget {

  @override
  _ElectricityReportsState createState() => _ElectricityReportsState();
}

List<ReportObject> reportlist = [];

//List<ReportObject> reportobj = [
//  ReportObject ("Adam","Smith","test@test.com","8f4e1e60-9e82-11ea-cea4-eb8c29717d94","22222","electricity","5000","BSES Yamuna Power Limited","121212","p"),
//  ReportObject ("Adam","Smith","test@test.com","eb640840-9e82-11ea-e69e-b5b2d5052dab","2222","electricity","5000","BSES Yamuna Power Limited","121212","p"),
//
//  ReportObject ("Adam","Smith","test@test.com","f976f000-9e82-11ea-d9d9-b1990fa7d956","22222","electricity","5000","BSES Yamuna Power Limited","0","u"),
//  ReportObject ("Adam","Smith","test@test.com","ff3175b0-9e82-11ea-83c9-f7b32cf62b71","222222","electricity","5000","BSES Yamuna Power Limited","0","c"),
//
//];
String state , url;
Color statecolor;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
Icon stateicon ;
class _ElectricityReportsState extends State<ElectricityReports> {

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
      showInSnackBar("Long Press the Transaction to copy the Transaction ID");
    }));

    url = mainUrl;
    initList().then((l) => {
      if(this.mounted)
        {setState(()=>{
          reportlist = l
        })
        }}
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Electricity Transactions"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,10,0,0),
        child: reportlist == null ? Container() : getListView(),
      ),
    );
  }

   Future<List<ReportObject>> initList() async {

    try {
      List<ReportObject> l = List<ReportObject>();
      Map map = {
        'usname': prefs.getString("username"),
        'bill_type': "electricity",
      };
      final response = await http.post(
//          "http://10.0.2.2:8888/smartpayer/api/"
              url
                  +"report.php", body: map);
      var jsondata = null,
          jsonarray = null;
      if (response.statusCode == 200) {
        jsondata = json.decode(response.body);
        if (jsondata["code"] == "fetch_success") {
          jsonarray = jsondata["result"];
          int i = 0;
          try {
            while (jsonarray[i] != null) {
              l.add(ReportObject(
                jsonarray[i]["datetime"],
                  jsonarray[i]["first_name"],
                  jsonarray[i]["last_name"],
                  jsonarray[i]["email"],
                  jsonarray[i]["tranc_id"],
                  jsonarray[i]["CA_no"],
                  jsonarray[i]["bill_type"],
                  jsonarray[i]["amount"],
                  jsonarray[i]["operator"],
                  jsonarray[i]["bbpd_id"],
                  jsonarray[i]["state"]));
              i++;
            }
          } catch (Exception) {
            print("catch " + i.toString());
          }
          return l;

//            print(reportlist.elementAt(3).fname);
        }
        else {
          await animated_dialog_box.showScaleAlertBox(
              title: Center(child: Text("Bad network connection")),
              // IF YOU WANT TO ADD
              context: context,
              firstButton: MaterialButton(
                // FIRST BUTTON IS REQUIRED
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Text('Ok'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              icon: Icon(Icons.info_outline, color: Colors.red,),
              // IF YOU WANT TO ADD ICON
              yourWidget: Container(
                child: Text(
                    'There is a problem with the network please try again later.'),
              ));
        }
      }
      else {
        WidgetsBinding.instance.addPostFrameCallback((_) =>
            setState(() {
              showInSnackBar(
                  "There is a network error please try again later.");
            }));
      }
    }catch(Exception)
     {
       await animated_dialog_box.showScaleAlertBox(
           title: Center(child: Text("Bad network connection")),
           // IF YOU WANT TO ADD
           context: context,
           firstButton: MaterialButton(
             // FIRST BUTTON IS REQUIRED
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20),
             ),
             color: Colors.white,
             child: Text('Ok'),
             onPressed: () async {
               Navigator.of(context).pop();
               Navigator.of(context).pop();
             },
           ),
           icon: Icon(Icons.info_outline, color: Colors.red,),
           // IF YOU WANT TO ADD ICON
           yourWidget: Container(
             child: Text(
                 'There is a problem with the network please try again later.'),
           ));
     }
  }

  Widget getListView() {


    var listview = ListView.builder(
        itemCount: reportlist.length,
        itemBuilder:(context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(3.0,8,8,8),
              child: MyListTile(reportObject: reportlist[index],),
            ),
          );
        }
    );
    return listview;
  }
}

class MyListTile extends StatelessWidget {
  ReportObject reportObject;
   MyListTile({
    Key key,
    this.reportObject,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    if(reportObject.state == "p"){
      stateicon = Icon(
        Icons.check,
        color: Colors.white,
        size: 50.0,
      );
      statecolor = Colors.green;
      state = "Paid";
    }
    else if(reportObject.state == "c")
      {
        stateicon = Icon(
          FeatherIcons.x,
          color: Colors.white,
          size: 50.0,
        );
        statecolor = Colors.red;
        state = "Cancelled";
      }
    else
      {
        stateicon = Icon(
          Icons.cached,
          color: Colors.white,
          size: 50.0,
        );
        statecolor = Colors.grey;
        state = "Pending";
      }
//    print(DateFormat('dd-MMM-yyyy').format(DateTime.parse(reportlist[0].datetime)));
    return InkWell(
      onLongPress: (){
        Clipboard.setData(ClipboardData(text: reportObject.tranc_id));
        final snackBar = SnackBar(
          duration: Duration(seconds: 3),
            content: Text('Transaction ID Copied'),
//        action: SnackBarAction(
//        label: 'Undo',
//        onPressed: () {
//        // Some code to undo the change.
//        },
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        height: 500.0,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 15.0,
                // has the effect of softening the shadow
//                    spreadRadius: 2.0,
                // has the effect of extending the shadow
                offset: Offset(
                  1.0, // horizontal, move right 10
                  5.0, // vertical, move down 10
                ),
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
//          color: const Color.fromRGBO(19, 12, 117, 1.0),
          color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Customer Number',
                  style: TextStyle(color: Colors.blue, fontSize: 20.0),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  reportObject.ca_no,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.display2.copyWith(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Service Provider',
                  style: TextStyle(color: Colors.blue, fontSize: 20.0),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  reportObject.operator,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Colors.blue[800], fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Transaction ID',
                  style: TextStyle(color: Colors.blue, fontSize: 20.0),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  reportObject.tranc_id,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Colors.blue[800], fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Payment Status',
                  style: TextStyle(color: Colors.blue, fontSize: 20.0),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  state,
                  style: TextStyle(color: statecolor, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'BBPS ID',
                  style: TextStyle(color: Colors.blue, fontSize: 20.0),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  reportObject.bbpsid,
                  style: TextStyle(color: statecolor, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Payment Amount',
                          style: TextStyle(color: Colors.blue, fontSize: 20.0),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "₹ "+reportObject.amount,
                          style: Theme.of(context).textTheme.display2.copyWith(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      heroTag: null,
                      backgroundColor: statecolor,
                      onPressed: () {},
                      child: stateicon,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'On: ',
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat('dd-MMM-yyyy').format(DateTime.parse(reportObject.datetime)),
                      style: TextStyle(color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Time: ',
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat('h:mm a').format(DateTime.parse(reportObject.datetime)),
                      style: TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showInSnackBar(String value) {
  _scaffoldKey.currentState.showSnackBar(new SnackBar(duration:Duration(seconds: 5),content: new Text(value)));
}

class ReportObject{
  String fname,datetime,lname,email,tranc_id,ca_no,bill_type,amount,operator, bbpsid,  state;

  ReportObject(this.datetime,this.fname, this.lname, this.email,this.tranc_id,this.ca_no,this.bill_type,this.amount,this.operator,this.bbpsid,this.state);

  ReportObject.fromJson(Map<String, dynamic> json)
      : fname = json["first_name"],
  lname = json["last_name"],
  email = json["email"],
  tranc_id = json["tranc_id"],
  ca_no = json["CA_no"],
  bill_type = json["bill_type"],
  amount = json["amount"],
  operator = json["operator"],
  bbpsid = json["bbpd_id"],
  state = json["state"];
}


