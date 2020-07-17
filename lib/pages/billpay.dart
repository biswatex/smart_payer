import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_dialog/flutter_progress_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:smart_payer/bloc/navigation/navigation_bloc.dart';
import 'package:smart_payer/pages/utilitybillpage.dart';
import 'package:uuid/uuid.dart';

import 'billprovider.dart';
import 'loading.dart';
import 'login.dart';
import 'loginhome.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class Billpay extends StatefulWidget with NavigationStates {

  final String value;
  Billpay({Key key, this.value}):super(key: key);

  @override
  _BillpayState createState() => _BillpayState();
}



class _BillpayState extends State<Billpay> {
  TextEditingController custIdController = new TextEditingController(), amountcontroller = new TextEditingController();
  var submitenable = null;
  int bal = int.parse(prefs.getString("bal"));
  int total = int.parse(prefs.getString("total"));
  int bill_payment = int.parse(prefs.getString("bill_payment"));
  String bill_type = bill_type_main;

  bool textfieldEnabled = true;
  int lower, upper;
  bool validated = false;

  String message = ' ';
  String cid, url = mainUrl;
  Icon trailingicon = null;
  bool vis = false;
  int amount = 0;


  @override
  Widget build(BuildContext context) {
    getLowerAndUpperBounds(widget.value);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Enter Customer Id"),
      ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 60),
//                Expanded(
//                  flex: 2,
//                  child:
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(widget.value, style: GoogleFonts.actor(
                      textStyle: TextStyle(
                        color: Colors.red[400],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      textAlign: TextAlign.center,),
                  ),
//                ),
                SizedBox(height: 40),
                Container(
                  height: 120,
                  child: Column(
                    children: <Widget>[
//                      Expanded(
//                        flex:3,
//                        child:
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
                          child: TextField(
                            enabled: textfieldEnabled,
                            controller: custIdController,
                            onChanged: (text){
                              if(text.length >= lower && text.length <= upper)
                                {
                                  setState(() {
                                    cid = text;
                                    trailingicon = new Icon(Icons.check_circle,color: Colors.green,);
                                    submitenable = (){
                                      setState(() {
                                        textfieldEnabled = false;
                                        vis = true;
                                        amount = 5000;
                                      });
                                    };
                                  });
                                }
                              else
                                {
                                  setState(() {
                                    trailingicon = null;
                                    submitenable = null;
                                  });
                                }
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.vpn_key),
                              labelText: 'Customer ID',
                              suffixIcon: trailingicon,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
//                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
//                        RaisedButton(
//                          onPressed: (){
//                            setState(() {
//                            });
//                          },
//                          color: Colors.redAccent,
//                          textColor: Colors.white,
//                          child: Text("Validate"),
//                        ),
                          RaisedButton(
                            onPressed: submitenable,
                            color: Colors.redAccent,
                            textColor: Colors.white,
                            child: Text("Submit"),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 30,),
//                Expanded(
//                  flex: 6,
//                  child:
                  Padding(
                    padding: const EdgeInsets.only(right:8.0,bottom: 8.0),
                    child: Column(
                      children: <Widget>[
                        Visibility(
                          visible: vis,
                          child: Text("Please enter your due amount",style: GoogleFonts.actor(
                            textStyle: TextStyle(
                              color: Colors.red[400],
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),),
                        ),
                        SizedBox(height: 10,),
                      Visibility(
                        visible: vis,
                        child: TextField(
                          controller: amountcontroller,
                          keyboardType: TextInputType.number,
                          onChanged: (text){
                              setState(() {
                                try{
                                  amount = int.parse(text);
                                } on FormatException {
                                  WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
                                    showInSnackBar("Please enter only numbers in the amount field");
                                  }));
                                }
                              });
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.account_balance_wallet),
                            labelText: 'Bill Amount',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                        SizedBox(height: 10,),
                        Visibility(
                          visible: vis,
                          child: RaisedButton(
                            onPressed: () async {
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
                                      if(bal > amount) {
                                        bal = bal - amount;
                                        total = total + amount;
                                        bill_payment = bill_payment + amount;
                                        prefs?.setString("bal", bal.toString());
                                        prefs?.setString("bill_payment",
                                            bill_payment.toString());
                                        prefs?.setString(
                                            "total", total.toString());
                                        payBill(amount, widget.value, cid);
                                        await animated_dialog_box
                                            .showScaleAlertBox(
                                            title: Center(child: Text(
                                                "Payment Successful")),
                                            // IF YOU WANT TO ADD
                                            context: context,
                                            firstButton: MaterialButton(
                                              // FIRST BUTTON IS REQUIRED
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                              ),
                                              color: Colors.white,
                                              child: Text('OK'),
                                              onPressed: () async {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                                //                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginHome()));
                                              },
                                            ),
                                            icon: Icon(Icons.check_circle,
                                              color: Colors.green,),
                                            // IF YOU WANT TO ADD ICON
                                            yourWidget: Container(
                                              child: Text(
                                                  'Payment successful, your current remaining balance is $bal. You will now be returned to Utility Bill page.'),
                                            ));
                                      }
                                      else
                                        {
                                          await animated_dialog_box
                                              .showScaleAlertBox(
                                              title: Center(child: Text(
                                                  "Payment Unsuccessful")),
                                              // IF YOU WANT TO ADD
                                              context: context,
                                              firstButton: MaterialButton(
                                                // FIRST BUTTON IS REQUIRED
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(20),
                                                ),
                                                color: Colors.white,
                                                child: Text('OK'),
                                                onPressed: () async {
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                  //                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginHome()));
                                                },
                                              ),
                                              icon: Icon(Icons.cancel,
                                                color: Colors.red,),
                                              // IF YOU WANT TO ADD ICON
                                              yourWidget: Container(
                                                child: Text(
                                                    'Payment is unsuccessful, your current remaining balance is $bal. Cannot pay bill right now due to insufficient balance.'),
                                              ));
                                        }
                                    },
                                  ),
                                  secondButton: MaterialButton(
                                    // OPTIONAL BUTTON
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    color: Colors.white,
                                    child: Text('Later'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  icon: Icon(Icons.info_outline,color: Colors.red,), // IF YOU WANT TO ADD ICON
                                  yourWidget: Container(
                                    child: Text('The amount will be reduced from your present balance $bal, are you sure you want to pay now ?'),
                                  ));
                            },
                            color: Colors.redAccent,
                            textColor: Colors.white,
                            child: Text("Pay Now"),
                          ),
                        ),
                    ],
                    ),
                  ),
//                ),
              ],
            ),
          ),
        )
    );
  }

  Future<void> payBill(int amount, String operator, String cno)
  async {
    String fname,lname,email,trancid;
    Random random = new Random();
    trancid = random.nextInt(10000).toString();
    DateTime now = new DateTime.now();
    trancid = trancid +now.minute.toString()+now.second.toString()+now.millisecond.toString();
    fname = prefs.getString("f_name");
    lname = prefs.getString("l_name");
    email = prefs.getString("username");
    Map map = {
      'first_name': fname,
      'last_name' : lname,
      'email' : email,
      'tranc_id' : trancid,
      'CA_no' : cno,
      'amount' : amount.toString(),
      'bill_type' : bill_type,
      'operator' : operator,
      'bbps_id' : '0',
      'bal' : bal.toString(),
      'total' : total.toString(),
      'total_bill' : bill_payment.toString(),
    };
    var response = await http.post(url+"utility_bills.php", body: map);
    var jsondata = null;

    if(response.statusCode==200)
      {

        jsondata = json.decode(response.body);
        print(jsondata[0]);
        if(jsondata[0]["code"] as String == "Entry_success")
          {
            message = 'Payment successful, your current remaining balance is $bal. You will now be returned to Utility Bill page.';
          }

      }
    else{
      message = 'Payment unsuccessful due to network problem please try again later.';
    }
  }

  getLowerAndUpperBounds(String value)
  {
//    print("$value");
    if(value == "Calcutta Electric Supply Corporation (CESC)" || value == "Assam Power (APDCL RAPDR)" || value == "Goa Electricity Department" || value == "Dakshin Gujarat Vij Company Limited (DGVCL)" )
      {
        lower = 11;
        upper = 11;
      }
    else if(value=="Eastern Power Distribution Co Ltd (APEPDCL)"){
      lower=8;
      upper=20;
    }
    else if(value=="Southern Power Distribution Co Ltd (APSPDCL)"){
      lower=9;
      upper=13;
    }
    else if(value=="Assam Power (APDCL NON-RAPDR)"||value=="Himachal Pradesh State Electricity Board"||value=="Maharashtra State Electricity Distribution Company Ltd ( MSEDCL)/ Mahavitran"||value=="Tata Power - Mumbai"||value=="Meghalaya Power Dist Corp Ltd"||value=="CESU, Odisha"||value=="NESCO"||value=="SOUTHCO, Odisha"||value=="WESCO - Odisha"||value=="Ajmer Vidyut Vitran Nigam Limited (AVVNL)"||value=="Bharatpur Electricity Services Ltd. (BESL)"||value=="Bikaner Electricity Supply Limited (BkESL)"||value=="Jaipur Vidyut Vitran Nigam (JVVNL)"||value=="Jaipur Vidyut Vitran Nigam (JVVNL)"||value=="Kota Electricity Distribution Limited (KEDL)"||value=="TP Ajmer Distribution Ltd (TPADL)"){
      lower=12;
      upper=12;
    }
    else if(value=="Gulbarga Electricity Supply Company Limited (GESCOM)"||
        value=="Chhattisgarh State Power Distribution Co. Ltd"||
        value=="Chamundeshwari Electricity Supply Corporation Limited"||
        value=="Mangalore Electricity Supply Co. Ltd (MESCOM)"||
        value=="Madhya Pradesh Poorv Kshetra Vidyut Vitaran Company Limited(MPPKVVCL)-Jabalpur"||
        value=="B.E.S.T Mumbai"||
        value=="Uttar Pradesh Power Corp Ltd (UPPCL) - URBAN"||
        value=="Madhya Pradesh Paschim Kshetra Vidyut Vitaran Company Ltd (Indore)"){
      lower = 10;
      upper = 10;
    }
    else if(value=="Power & Electricity Department - Mizoram"||
    value=="Uttar Haryana Bijli Vitran Nigam Limited")
      {
        lower = 10;
        upper = 12;
      }
    else if(value=="Tata Power - Delhi"||
    value=="Punjab State Power Corporation Ltd. (PSPCL)"||
    value=="Uttar Pradesh Power Corp Ltd (UPPCL) - RURAL"||
    value=="Department of Power, Nagaland")
      {
        lower = 11;
        upper = 12;
      }
    else if(value=="Uttarakhand Power Corporation Limited"||
    value=="Kerala State Electricity Board Ltd. (KSEBL)")
    {
      lower = 13;
      upper = 13;
    }
    else if(value=="Madhya Gujarat Vij Company Limited (MGVCL)"||
    value=="Paschim Gujarat Vij Company Limited (PGVCL)"||
    value=="Uttar Gujarat Vij Company Limited (UGVCL)")
    {
      lower = 5;
      upper = 11;
    }
    else if(value=="Hubli Electricity")
    {
      lower = 5;
      upper = 10;
    }
    else if(value=="Daman and Diu Electricity")
    {
      lower = 6;
      upper = 6;
    }
    else if(value=="New Delhi Municipal Council (NDMC) - Electricity"||
    value=="Jamshedpur Utilities & Services Company Ltd (JUSCO)")
    {
      lower = 6;
      upper = 10;
    }
    else if(value=="M.P. Poorv Kshetra Vidyut Vitaran - URBAN")
    {
      lower = 7;
      upper = 10;
    }
    else if(value=="M.P. Madhya Kshetra Vidyut Vitaran - RURAL"||
    value=="M.P. Madhya Kshetra Vidyut Vitaran - URBAN")
    {
      lower = 7;
      upper = 15;
    }
    else if(value=="South Bihar Power Distribution Company Ltd.")
    {
      lower = 8;
      upper = 12;
    }
    else if(value=="Adani Electricity"||
    value=="BSES Rajdhani Power Limited"||
    value=="BSES Yamuna Power Limited"||
    value=="West Bengal State Electricity Distribution Co. Ltd (WBSEDCL)")
    {
      lower = 9;
      upper = 9;
    }
    else if(value=="Madhya Pradesh Madhya Kshetra Vidyut Vitaran Company Ltd - Bhopal")
    {
      lower = 9;
      upper = 10;
    }
    else if(value=="North Bihar Power Distribution Company Ltd."||
    value=="Dakshin Haryana Bijli Vitran Nigam")
    {
      lower = 9;
      upper = 12;
    }
    else if(value=="Southern Power Distribution Co Ltd (APSPDCL)")
    {
      lower = 9;
      upper = 13;
    }
    else if(value=="Jharkhand Bijli Vitran Nigam Limited (JBVNL)")
    {
      lower = 3;
      upper = 15;
    }
    else if(value=="MP Poorva Kshetra Vidyut Vitaran Co. Ltd Jabalpur - NGB billing system")
    {
      lower = 7;
      upper = 20;
    }
    else if(value=="Northern Power Distribution of Telangana Ltd"||
        value=="Kanpur Electricity Supply Company Ltd"){
      lower=8;
      upper=15;
    }
    else if(value=="Tamil Nadu Electricity Board (TNEB)")
    {
      lower = 9;
      upper = 12;
    }
    else if(value=="Bangalore Electricity (BESCOM)"||
    value=="Noida Power Company")
    {
      lower = 0;
      upper = 10;
    }
    else if(value=="Meghalaya Power Dist Corp Ltd"||
    value=="Sikkim Power - URBAN"||
    value=="Tripura Electricity")
    {
      lower = 0;
      upper = 12;
    }
    else if(value=="Torrent Power - Ahmedabad"||
    value=="Torrent Power - Surat"||
    value=="Torrent Power - Bhiwandi"||
    value=="Torrent Power - Agra")
    {
      lower = 0;
      upper = 15;
    }
    else if(value=="M.P. Poorv Kshetra Vidyut Vitaran - URBAN")
    {
      lower = 7;
      upper = 20;
    }
    else if(value=="Government of Puducherry Electricity Department")
    {
      lower = 9;
      upper = 12;
    }
    else
      {
        lower =0;
        upper =12;
      }
  }
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(duration:Duration(seconds: 5),content: new Text(value)));
  }
}

