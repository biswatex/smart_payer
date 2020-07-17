import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'billpay.dart';

class BillProvider extends StatefulWidget {
  final String value;
  BillProvider({Key key, this.value}):super(key: key);
  @override
  _BillProviderState createState() => _BillProviderState();
}

List<ElectricBoard> boards = [
  ElectricBoard ("Eastern Power Distribution Co Ltd (APEPDCL)","Andhra Pradesh","electricboards/apepdcl_1.png"),
  ElectricBoard ("Southern Power Distribution Co Ltd (APSPDCL)","Andhra Pradesh","electricboards/apepdcl_2.png"),

  ElectricBoard ("Assam Power (APDCL NON-RAPDR)","Assam","electricboards/apdcl_3.png"),
  ElectricBoard ("Assam Power (APDCL RAPDR)","Assam","electricboards/apdcl_4.png"),

  ElectricBoard ("North Bihar Power Distribution Company Ltd.","Bihar","electricboards/bihar_5.png"),
  ElectricBoard ("South Bihar Power Distribution Company Ltd.","Bihar","electricboards/bihar_6.png"),

  ElectricBoard ("Chhattisgarh State Power Distribution Co. Ltd","Chhattisgarh","electricboards/Chhattisgarh_7.png"),

  ElectricBoard ("DNH Power Distribution Company Limited","Dadra and Nagar Haveli","electricboards/dnhpdcl_8.png"),

  ElectricBoard ("Daman and Diu Electricity","Daman and Diu","electricboards/daman_9.png"),

  ElectricBoard ("Goa Electricity Department","Goa","electricboards/goa_10.png"),

  ElectricBoard ("Dakshin Gujarat Vij Company Limited (DGVCL)","Gujarat","electricboards/dgvcl_11.png"),
  ElectricBoard ("Madhya Gujarat Vij Company Limited (MGVCL)","Gujarat","electricboards/mgvcl_12.png"),
  ElectricBoard ("Paschim Gujarat Vij Company Limited (PGVCL)","Gujarat","electricboards/pgvcl_13.png"),
  ElectricBoard ("Torrent Power - Ahmedabad","Gujarat","electricboards/Ahmedabad_14.png"),
  ElectricBoard ("Torrent Power - Surat","Gujarat","electricboards/surat_15.png"),
  ElectricBoard ("Uttar Gujarat Vij Company Limited (UGVCL)","Gujarat","electricboards/ugvcl_16.png"),

  ElectricBoard ("Dakshin Haryana Bijli Vitran Nigam","Haryana","electricboards/dhbvn_17.png"),
  ElectricBoard ("Uttar Haryana Bijli Vitran Nigam Limited","Haryana","electricboards/uhbvnl_18.png"),

  ElectricBoard ("Himachal Pradesh State Electricity Board","Himachal Pradesh ","electricboards/Himachal_19.png"),

  ElectricBoard ("Jamshedpur Utilities & Services Company Ltd (JUSCO)","Jharkhand","electricboards/jusco_20.png"),
  ElectricBoard ("Jharkhand Bijli Vitran Nigam Limited (JBVNL)","Jharkhand","electricboards/jbvnl_21.png"),

  ElectricBoard ("Bangalore Electricity (BESCOM)","Karnataka","electricboards/bescom_22.png"),
  ElectricBoard ("Chamundeshwari Electricity Supply Corporation Limited","Karnataka","electricboards/cesc_mysore_23.png"),
  ElectricBoard ("Gulbarga Electricity Supply Company Limited (GESCOM)","Karnataka","electricboards/gescom_24.png"),
  ElectricBoard ("Hubli Electricity","Karnataka","electricboards/hubli_25.png"),
  ElectricBoard ("Mangalore Electricity Supply Co. Ltd (MESCOM)","Karnataka","electricboards/stat_electricity.png"),

  ElectricBoard ("Kerala State Electricity Board Ltd. (KSEBL)","Kerala","electricboards/ksebl_26.png"),

  ElectricBoard ("M.P. Madhya Kshetra Vidyut Vitaran - RURAL","Madhya Pradesh","electricboards/MP_mkvv_27.png"),
  ElectricBoard ("M.P. Madhya Kshetra Vidyut Vitaran - URBAN","Madhya Pradesh","electricboards/MP_pkvvcl_28.png"),
  ElectricBoard ("Madhya Pradesh Paschim Kshetra Vidyut Vitaran Company Ltd (Indore)","Madhya Pradesh","electricboards/stat_electricity.png"),
  ElectricBoard ("M.P. Poorv Kshetra Vidyut Vitaran - RURAL","Madhya Pradesh","electricboards/stat_electricity.png"),
  ElectricBoard ("M.P. Poorv Kshetra Vidyut Vitaran - URBAN","Madhya Pradesh","electricboards/stat_electricity.png"),
  ElectricBoard ("Madhya Pradesh Madhya Kshetra Vidyut Vitaran Company Ltd - Bhopal","Madhya Pradesh","electricboards/MP_mkvvcl_29.png"),
  ElectricBoard ("Madhya Pradesh Poorv Kshetra Vidyut Vitaran Company Limited(MPPKVVCL)-Jabalpur","Madhya Pradesh","electricboards/MP_pkvvcl(jabalpur)_30.png"),
  ElectricBoard ("MP Poorva Kshetra Vidyut Vitaran Co. Ltd Jabalpur - NGB billing system","Madhya Pradesh","electricboards/stat_electricity.png"),

  ElectricBoard ("Adani Electricity","Maharashtra","electricboards/adani_31.png"),
  ElectricBoard ("B.E.S.T Mumbai","Maharashtra","electricboards/best_32.png"),
  ElectricBoard ("Maharashtra State Electricity Distribution Company Ltd ( MSEDCL)/ Mahavitran","Maharashtra","electricboards/msedcl_33.png"),
  ElectricBoard ("Tata Power - Mumbai","Maharashtra","electricboards/sndl_34.png"),
  ElectricBoard ("Torrent Power - Bhiwandi","Maharashtra","electricboards/tatapower_35.png"),

  ElectricBoard ("Meghalaya Power Dist Corp Ltd","Meghalaya","electricboards/torrentpower_36.png"),

  ElectricBoard ("Power & Electricity Department - Mizoram","Mizoram","electricboards/mpdcl_37.png"),

  ElectricBoard ("Department of Power, Nagaland","Nagaland","electricboards/nagaland_38.png"),

  ElectricBoard ("BSES Rajdhani Power Limited","New Delhi","electricboards/bses_rpl_39.png"),
  ElectricBoard ("BSES Yamuna Power Limited","New Delhi","electricboards/bses_ypl_40.png"),
  ElectricBoard ("New Delhi Municipal Council (NDMC) - Electricity","New Delhi","electricboards/stat_electricity.png"),
  ElectricBoard ("Tata Power - Delhi","New Delhi","electricboards/tata_power_delhi_41.png"),

  ElectricBoard ("CESU, Odisha","Odisha","electricboards/stat_electricity.png"),
  ElectricBoard ("NESCO","Odisha","electricboards/nesco_42.png"),
  ElectricBoard ("SOUTHCO, Odisha","Odisha","electricboards/southco_43.png"),
  ElectricBoard ("WESCO - Odisha","Odisha","electricboards/wesco_44.png"),

  ElectricBoard ("Government of Puducherry Electricity Department","Puducherry","electricboards/stat_electricity.png"),

  ElectricBoard ("Punjab State Power Corporation Ltd. (PSPCL)","Punjab","electricboards/pspcl_45.png"),

  ElectricBoard ("Ajmer Vidyut Vitran Nigam Limited (AVVNL)","Rajasthan","electricboards/avvnl_46.png"),
  ElectricBoard ("Bharatpur Electricity Services Ltd. (BESL)","Rajasthan","electricboards/besl&bkesl&kedl_47.png"),
  ElectricBoard ("Bikaner Electricity Supply Limited (BkESL)","Rajasthan","electricboards/besl&bkesl&kedl_47.png"),
  ElectricBoard ("Jaipur Vidyut Vitran Nigam (JVVNL)","Rajasthan","electricboards/jvvnl_47.png"),
  ElectricBoard ("Jaipur Vidyut Vitran Nigam (JVVNL)","Rajasthan","electricboards/jdvvnl_48.png"),
  ElectricBoard ("Kota Electricity Distribution Limited (KEDL)","Rajasthan","electricboards/besl&bkesl&kedl_47.png"),
  ElectricBoard ("TP Ajmer Distribution Ltd (TPADL)","Rajasthan","electricboards/tpadl_49.png"),

  ElectricBoard ("Sikkim Power - URBAN","Sikkim","electricboards/stat_electricity.png"),

  ElectricBoard ("Tamil Nadu Electricity Board (TNEB)","Tamil Nadu","electricboards/tneb_50.png"),

  ElectricBoard ("Northern Power Distribution of Telangana Ltd"," Telangana","electricboards/stat_electricity.png"),

  ElectricBoard ("Tripura Electricity","Tripura","electricboards/tripura_51.png"),

  ElectricBoard ("Kanpur Electricity Supply Company Ltd","Uttar Pradesh","electricboards/kescl_53.png"),
  ElectricBoard ("Noida Power Company","Uttar Pradesh","electricboards/npcl_54.png"),
  ElectricBoard ("Torrent Power - Agra","Uttar Pradesh","electricboards/torrentpower_agra_55.png"),
  ElectricBoard ("Uttar Pradesh Power Corp Ltd (UPPCL) - RURAL","Uttar Pradesh","electricboards/uppcl_56.png"),
  ElectricBoard ("Uttar Pradesh Power Corp Ltd (UPPCL) - URBAN","Uttar Pradesh","electricboards/uppcl_56.png"),

  ElectricBoard ("Uttarakhand Power Corporation Limited","Uttarakhand","electricboards/upcl_52.png"),

  ElectricBoard ("Calcutta Electric Supply Corporation (CESC)","West Bengal","electricboards/cesc_wb_57.png"),
  ElectricBoard ("West Bengal State Electricity Distribution Co. Ltd (WBSEDCL)","West Bengal","electricboards/wbsedcl_59.png"),
];

String state ;
class _BillProviderState extends State<BillProvider> {

  @override
  Widget build(BuildContext context) {
    state = widget.value;

    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Select the Provider "+state),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,10,0,0),
        child: getListView(),
      ),
      
    );
  }
  initList(String state)
  {
    List<ElectricBoard> finalList = List<ElectricBoard>() ;
    for(int i = 0; i < boards.length; i++)
    {
      if(boards[i].state == state)
      {
        finalList.add(new ElectricBoard(boards[i].name,boards[i].state, boards[i].icon));
      }
    }
    return finalList;
  }

  Widget getListView() {
    List<ElectricBoard> finalList = initList(state);
    var listview = ListView.builder(
        itemCount: finalList.length,
        itemBuilder:(context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(finalList[index].name, style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),),
                  onTap: (){
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new Billpay(value: finalList[index].name,),
                    );
                    Navigator.of(context).push(route);
                  },
                  subtitle: Text(finalList[index].state),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${finalList[index].icon}'),
                    radius: 30.0,
                  ),
                ),
              ),
            ),
          );
        }
    );
    return listview;
  }
}



class ElectricBoard{
  String name, state, icon;

  ElectricBoard(this.name, this.state, this.icon);
}
