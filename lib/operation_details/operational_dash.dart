import 'dart:convert';
// import 'package:date_format/date_format.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:trymd_partner/accountsetup/accept_widget.dart';
// import 'package:trymd_partner/accountsetup/accountsetup1.dart';
import 'package:trymd_partner/dashboard/dashboard.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/repository/vendorupdate.dart';
// import 'package:trymd_partner/service/service_selection_widget.dart';
import 'package:trymd_partner/sizer.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../global_widget/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
// import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class OperationalDashboard extends StatefulWidget {
  final vendorType;
  OperationalDashboard({this.vendorType});

  @override
  _OperationalDashboardState createState() => _OperationalDashboardState();
}

class _OperationalDashboardState extends State<OperationalDashboard> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final LocalStorage storage = new LocalStorage('localstorage_app');

  String dropDownValue10;
  TextEditingController textController6 = TextEditingController();
  TextEditingController textController7 = TextEditingController();
  String dropDownValue1;
  String dropDownValue2;
  bool switchListTileValue;
  String dropDownValue3;
  String dropDownValue4;
  String dropDownValue5;
  String dropDownValue6;
  String dropDownValue7;
  String dropDownValue8;
  String dropDownValue9;
  String selectedDay = "monday";
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool toogleSwitch = false;
  bool allCheck = false;
  List allDayAcccordian = [];

  TextEditingController textOne1 = TextEditingController();
  TextEditingController textOne2 = TextEditingController();
  TextEditingController textTwo1 = TextEditingController();
  TextEditingController textTwo2 = TextEditingController();
  TextEditingController textThree1 = TextEditingController();
  TextEditingController textThree2 = TextEditingController();
  TextEditingController textFour1 = TextEditingController();
  TextEditingController textFour2 = TextEditingController();

  TextEditingController textFive1 = TextEditingController();
  TextEditingController textFive2 = TextEditingController();
  TextEditingController textSix1 = TextEditingController();
  TextEditingController textSix2 = TextEditingController();
  TextEditingController textSeven1 = TextEditingController();
  TextEditingController textSeven2 = TextEditingController();
  TextEditingController textEight1 = TextEditingController();
  TextEditingController textEight2 = TextEditingController();

  TextEditingController textNine1 = TextEditingController();
  TextEditingController textNine2 = TextEditingController();
  TextEditingController textTen1 = TextEditingController();
  TextEditingController textTen2 = TextEditingController();
  TextEditingController textEleven1 = TextEditingController();
  TextEditingController textEleven2 = TextEditingController();
  TextEditingController textTwelve1 = TextEditingController();
  TextEditingController textTwelve2 = TextEditingController();

  String textSetOne1 = "";
  String textSetOne2 = "";
  String textSetTwo1 = "";
  String textSetTwo2 = "";
  String textSetThree1 = "";
  String textSetThree2 = "";
  String textSetFour1 = "";
  String textSetFour2 = "";
  String textSetFive1 = "";
  String textSetFive2 = "";
  String textSetSix1 = "";
  String textSetSix2 = "";
  String textSetSeven1 = "";
  String textSetSeven2 = "";
  String textSetEight1 = "";
  String textSetEight2 = "";
  String textSetNine1 = "";
  String textSetNine2 = "";
  String textSetTen1 = "";
  String textSetTen2 = "";
  String textSetEleven1 = "";
  String textSetEleven2 = "";
  String textSetTwelve1 = "";
  String textSetTwelve2 = "";
  List data = [];
  List countList = [];

  final _textForm1 = GlobalKey<FormState>();
  final _textForm2 = GlobalKey<FormState>();
  final _textForm3 = GlobalKey<FormState>();
  final _textForm4 = GlobalKey<FormState>();

  final _textForm5 = GlobalKey<FormState>();
  final _textForm6 = GlobalKey<FormState>();
  final _textForm7 = GlobalKey<FormState>();
  final _textForm8 = GlobalKey<FormState>();

  final _textForm9 = GlobalKey<FormState>();
  final _textForm10 = GlobalKey<FormState>();
  final _textForm11 = GlobalKey<FormState>();
  final _textForm12 = GlobalKey<FormState>();

  bool warning = false;
  List<Map<String, dynamic>> localOperationalData = [];

  @override
  void initState() {
    super.initState();
    if (storage.getItem("localOperationalData").length != 0) {
      localOperationalData = storage.getItem("localOperationalData");
    }
    // storage.setItem("localOperationalData", [],);
  }

  Future<bool> _onBackButtonPressed() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => DashboardScreen(
            // vendorType: widget.vendorType,
            ),
        transitionDuration: Duration(
          seconds: 0,
        ),
      ),
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return WillPopScope(
        onWillPop: _onBackButtonPressed,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ),
                );
              },
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xFF0D0D0D),
                size: SizeConfig.blockSizeVertical * 5,
              ),
            ),
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 10,
                0,
                0,
                0,
              ),
              child: Text(
                'Operational Details',
                style: TextStyle(
                  fontFamily: 'geometric sans-serif',
                  color: Color(0xFF0B2F45),
                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          0,
                          0,
                          0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //monday ***************************
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (selectedDay == "monday") {
                                    selectedDay = "";
                                  } else if (selectedDay != "monday") {
                                    selectedDay = "monday";
                                  }

                                  // if (selectedDay.contains("monday") == true) {
                                  //   selectedDay.remove("monday");
                                  // } else if (selectedDay.contains("monday") ==
                                  //     false) {
                                  //   selectedDay.add("monday");
                                  // }
                                });
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 1,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Container(
                                  width: SizeConfig.blockSizeHorizontal * 11,
                                  height: SizeConfig.blockSizeVertical * 6,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: selectedDay.contains("monday")
                                          ? [
                                              Color(0xFF3F8BFD),
                                              Color(0xFF07D0F2)
                                            ]
                                          : [Colors.white, Colors.white],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(0, -1),
                                      end: AlignmentDirectional(0, 1),
                                    ),
                                    border: Border.all(
                                      color: Color(0xFFE5E5E5),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      SizeConfig.blockSizeVertical * 1.7,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Mon',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: selectedDay.contains("monday")
                                            ? Colors.white
                                            : Color(0xFF0B2F45),
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //tuesday ***************************
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selectedDay == "tuesday") {
                                      selectedDay = "";
                                    } else if (selectedDay != "tuesday") {
                                      selectedDay = "tuesday";
                                    }

                                    // if (selectedDay.contains("tuesday") ==
                                    //     true) {
                                    //   selectedDay.remove("tuesday");
                                    // } else if (selectedDay
                                    //         .contains("tuesday") ==
                                    //     false) {
                                    //   selectedDay.add("tuesday");
                                    // }
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 1,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Container(
                                    width: SizeConfig.blockSizeHorizontal * 11,
                                    height: SizeConfig.blockSizeVertical * 6,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: selectedDay.contains("tuesday")
                                            ? [
                                                Color(0xFF3F8BFD),
                                                Color(0xFF07D0F2)
                                              ]
                                            : [Colors.white, Colors.white],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      border: Border.all(
                                        color: Color(0xFFE5E5E5),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        SizeConfig.blockSizeVertical * 1.7,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Tue',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          fontFamily: 'geometric sans-serif',
                                          color: selectedDay.contains("tuesday")
                                              ? Colors.white
                                              : Color(0xFF0B2F45),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),

                            //wednessday ***************************
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selectedDay == "wednessday") {
                                      selectedDay = "";
                                    } else if (selectedDay != "wednessday") {
                                      selectedDay = "wednessday";
                                    }
                                    // if (selectedDay.contains("wednessday") ==
                                    //     true) {
                                    //   selectedDay.remove("wednessday");
                                    // } else if (selectedDay
                                    //         .contains("wednessday") ==
                                    //     false) {
                                    //   selectedDay.add("wednessday");
                                    // }
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 1,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Container(
                                    width: SizeConfig.blockSizeHorizontal * 11,
                                    height: SizeConfig.blockSizeVertical * 6,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors:
                                            selectedDay.contains("wednessday")
                                                ? [
                                                    Color(0xFF3F8BFD),
                                                    Color(0xFF07D0F2)
                                                  ]
                                                : [Colors.white, Colors.white],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      border: Border.all(
                                        color: Color(0xFFE5E5E5),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        SizeConfig.blockSizeVertical * 1.7,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Wed',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          color:
                                              selectedDay.contains("wednessday")
                                                  ? Colors.white
                                                  : Color(0xFF0B2F45),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),

                            //thursday ***************************
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selectedDay == "thursday") {
                                      selectedDay = "";
                                    } else if (selectedDay != "thursday") {
                                      selectedDay = "thursday";
                                    }
                                    // if (selectedDay.contains("thursday") ==
                                    //     true) {
                                    //   selectedDay.remove("thursday");
                                    // } else if (selectedDay
                                    //         .contains("thursday") ==
                                    //     false) {
                                    //   selectedDay.add("thursday");
                                    // }
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 1,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Container(
                                    width: SizeConfig.blockSizeHorizontal * 11,
                                    height: SizeConfig.blockSizeVertical * 6,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: selectedDay.contains("thursday")
                                            ? [
                                                Color(0xFF3F8BFD),
                                                Color(0xFF07D0F2)
                                              ]
                                            : [Colors.white, Colors.white],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      border: Border.all(
                                        color: Color(0xFFE5E5E5),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        SizeConfig.blockSizeVertical * 1.7,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Thu',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          fontFamily: 'geometric sans-serif',
                                          color:
                                              selectedDay.contains("thursday")
                                                  ? Colors.white
                                                  : Color(0xFF0B2F45),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),

                            //friday ***************************
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selectedDay == "friday") {
                                      selectedDay = "";
                                    } else if (selectedDay != "friday") {
                                      selectedDay = "friday";
                                    }

                                    // if (selectedDay.contains("friday") ==
                                    //     true) {
                                    //   selectedDay.remove("friday");
                                    // } else if (selectedDay.contains("friday") ==
                                    //     false) {
                                    //   selectedDay.add("friday");
                                    // }
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 1,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Container(
                                    width: SizeConfig.blockSizeHorizontal * 11,
                                    height: SizeConfig.blockSizeVertical * 6,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: selectedDay.contains("friday")
                                            ? [
                                                Color(0xFF3F8BFD),
                                                Color(0xFF07D0F2)
                                              ]
                                            : [Colors.white, Colors.white],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      border: Border.all(
                                        color: Color(0xFFE5E5E5),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        SizeConfig.blockSizeVertical * 1.7,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Fri',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          fontFamily: 'geometric sans-serif',
                                          color: selectedDay.contains("friday")
                                              ? Colors.white
                                              : Color(0xFF0B2F45),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),

                            //saturday ***************************
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selectedDay == "saturday") {
                                      selectedDay = "";
                                    } else if (selectedDay != "saturday") {
                                      selectedDay = "saturday";
                                    }

                                    // if (selectedDay.contains("saturday") ==
                                    //     true) {
                                    //   selectedDay.remove("saturday");
                                    // } else if (selectedDay
                                    //         .contains("saturday") ==
                                    //     false) {
                                    //   selectedDay.add("saturday");
                                    // }
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 1,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Container(
                                    width: SizeConfig.blockSizeHorizontal * 11,
                                    height: SizeConfig.blockSizeVertical * 6,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: selectedDay.contains("saturday")
                                            ? [
                                                Color(0xFF3F8BFD),
                                                Color(0xFF07D0F2)
                                              ]
                                            : [Colors.white, Colors.white],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      border: Border.all(
                                        color: Color(0xFFE5E5E5),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        SizeConfig.blockSizeVertical * 1.7,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Sat',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          fontFamily: 'geometric sans-serif',
                                          color:
                                              selectedDay.contains("saturday")
                                                  ? Colors.white
                                                  : Color(0xFF0B2F45),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),

                            //sunday ***************************
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selectedDay == "sunday") {
                                      selectedDay = "";
                                    } else if (selectedDay != "sunday") {
                                      selectedDay = "sunday";
                                    }
                                    // if (selectedDay.contains("sunday") ==
                                    //     true) {
                                    //   selectedDay.remove("sunday");
                                    // } else if (selectedDay.contains("sunday") ==
                                    //     false) {
                                    //   selectedDay.add("sunday");
                                    // }
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 2,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Container(
                                    width: SizeConfig.blockSizeHorizontal * 11,
                                    height: SizeConfig.blockSizeVertical * 6,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: selectedDay.contains("sunday")
                                            ? [
                                                Color(0xFF3F8BFD),
                                                Color(0xFF07D0F2)
                                              ]
                                            : [Colors.white, Colors.white],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      border:
                                          Border.all(color: Color(0xFFE5E5E5)),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        SizeConfig.blockSizeVertical * 1.7,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Sun',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          color: selectedDay.contains("sunday")
                                              ? Colors.white
                                              : Color(0xFF0B2F45),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          SizeConfig.blockSizeVertical * 4,
                          0,
                          0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0,
                                0,
                                0,
                                0,
                              ),
                              child: Text(
                                'Set Time',
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                  fontSize: SizeConfig.blockSizeVertical * 2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            FlutterSwitch(
                              height: 20.0,
                              width: 40.0,
                              padding: 4.0,
                              toggleSize: 15.0,
                              borderRadius: 10.0,
                              activeColor: Colors.blue,
                              value: toogleSwitch,
                              onToggle: (value) {
                                setState(() {
                                  toogleSwitch = !toogleSwitch;
                                  if (toogleSwitch == true) {
                                    countList.insert(0, "0");
                                  } else if (toogleSwitch == false) {
                                    countList = [];
                                  }
                                });
                              },
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    countList.insert(0, "0");
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    '+ ADD HOURS',
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      color: Color(0xFF0B2F45),
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      if (countList.length >= 1)
                        addHoursSetOne(
                          context,
                          0,
                        ),
                      if (countList.length >= 2) addHoursSetTwo(context, 1),
                      if (countList.length >= 3) addHoursSetThree(context, 2),
                      if (countList.length >= 4) addHoursSetFour(context, 3),
                      if (countList.length >= 5) addHoursSetFive(context, 4),
                      if (countList.length >= 6) addHoursSetSix(context, 5),
                      if (countList.length >= 7) addHoursSetSeven(context, 6),
                      if (countList.length >= 8) addHoursSetEight(context, 7),
                      if (countList.length >= 9) addHoursSetNine(context, 8),
                      if (countList.length >= 10) addHoursSetTen(context, 9),
                      if (countList.length >= 11)
                        addHoursSetEleven(
                          context,
                          10,
                        ),
                      if (countList.length >= 12)
                        addHoursSetTwelve(context, 11),

                      // if (toogleSwitch == true)
                      //   // ..._dynamicSetTimeWidget(),
                      //   ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: setTimeDynamic.length,
                      //     itemBuilder: (context, index) {
                      //       return setTimeDynamic[index];
                      //     },
                      //   ),
                      // if (warning == true)
                      //   Padding(
                      //       padding: EdgeInsetsDirectional.fromSTEB(
                      //           SizeConfig.blockSizeVertical * 4,
                      //           SizeConfig.blockSizeVertical * 3,
                      //           0,
                      //           0,),
                      //       child: Column(children: [
                      //         Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             children: [
                      //               Icon(
                      //                 Icons.info_outline,
                      //                 color: Color.fromRGBO(255, 102, 102, 1),
                      //                 size: SizeConfig.blockSizeVertical * 3,
                      //               ),
                      //               SizedBox(
                      //                 width: 10,
                      //               ),
                      //               Text(
                      //                 "Warning",
                      //                 textAlign: TextAlign.left,
                      //                 style: TextStyle(
                      //                   fontFamily: 'geometric sans-serif',
                      //                   color: Color.fromRGBO(255, 102, 102, 1),
                      //                   fontSize:
                      //                       SizeConfig.blockSizeVertical * 2.2,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //             ]),
                      //         SizedBox(
                      //           height: 10,
                      //         ),
                      //         Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 "Please fill the time properly",
                      //                 textAlign: TextAlign.left,
                      //                 style: TextStyle(
                      //                   fontFamily: 'geometric sans-serif',
                      //                   color: Color.fromRGBO(255, 102, 102, 1),
                      //                   fontSize:
                      //                       SizeConfig.blockSizeVertical * 2,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //             ])
                      //       ],),),

                      if (toogleSwitch == true)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  width: SizeConfig.blockSizeHorizontal * 95,
                                  height: SizeConfig.blockSizeVertical * 8,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xFF2BA4F9),
                                        Color(0xFF07D0F2)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 130, vertical: 18),
                                  primary: Colors.white,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  if (countList.length == 1) {
                                    if (_textForm1.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  } else if (countList.length == 2) {
                                    if (_textForm1.currentState.validate()) {}
                                    if (_textForm2.currentState.validate()) {}
                                    if (_textForm1.currentState.validate() &&
                                        _textForm2.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  } else if (countList.length == 3) {
                                    if (_textForm1.currentState.validate()) {}
                                    if (_textForm2.currentState.validate()) {}
                                    if (_textForm3.currentState.validate()) {}
                                    if (_textForm1.currentState.validate() &&
                                        _textForm2.currentState.validate() &&
                                        _textForm3.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  } else if (countList.length == 4) {
                                    if (_textForm1.currentState.validate()) {}
                                    if (_textForm2.currentState.validate()) {}
                                    if (_textForm3.currentState.validate()) {}
                                    if (_textForm4.currentState.validate()) {}
                                    if (_textForm1.currentState.validate() &&
                                        _textForm2.currentState.validate() &&
                                        _textForm3.currentState.validate() &&
                                        _textForm4.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  } else if (countList.length == 5) {
                                    if (_textForm1.currentState.validate()) {}
                                    if (_textForm2.currentState.validate()) {}
                                    if (_textForm3.currentState.validate()) {}
                                    if (_textForm4.currentState.validate()) {}
                                    if (_textForm5.currentState.validate()) {}
                                    if (_textForm1.currentState.validate() &&
                                        _textForm2.currentState.validate() &&
                                        _textForm3.currentState.validate() &&
                                        _textForm4.currentState.validate() &&
                                        _textForm5.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  } else if (countList.length == 6) {
                                    if (_textForm1.currentState.validate()) {}
                                    if (_textForm2.currentState.validate()) {}
                                    if (_textForm3.currentState.validate()) {}
                                    if (_textForm4.currentState.validate()) {}
                                    if (_textForm5.currentState.validate()) {}
                                    if (_textForm6.currentState.validate()) {}
                                    if (_textForm1.currentState.validate() &&
                                        _textForm2.currentState.validate() &&
                                        _textForm3.currentState.validate() &&
                                        _textForm4.currentState.validate() &&
                                        _textForm5.currentState.validate() &&
                                        _textForm6.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  } else if (countList.length == 7) {
                                    if (_textForm1.currentState.validate()) {}
                                    if (_textForm2.currentState.validate()) {}
                                    if (_textForm3.currentState.validate()) {}
                                    if (_textForm4.currentState.validate()) {}
                                    if (_textForm5.currentState.validate()) {}
                                    if (_textForm6.currentState.validate()) {}
                                    if (_textForm7.currentState.validate()) {}
                                    if (_textForm1.currentState.validate() &&
                                        _textForm2.currentState.validate() &&
                                        _textForm3.currentState.validate() &&
                                        _textForm4.currentState.validate() &&
                                        _textForm5.currentState.validate() &&
                                        _textForm6.currentState.validate() &&
                                        _textForm7.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  } else if (countList.length == 8) {
                                    if (_textForm1.currentState.validate()) {}
                                    if (_textForm2.currentState.validate()) {}
                                    if (_textForm3.currentState.validate()) {}
                                    if (_textForm4.currentState.validate()) {}
                                    if (_textForm5.currentState.validate()) {}
                                    if (_textForm6.currentState.validate()) {}
                                    if (_textForm7.currentState.validate()) {}
                                    if (_textForm8.currentState.validate()) {}
                                    if (_textForm1.currentState.validate() &&
                                        _textForm2.currentState.validate() &&
                                        _textForm3.currentState.validate() &&
                                        _textForm4.currentState.validate() &&
                                        _textForm5.currentState.validate() &&
                                        _textForm6.currentState.validate() &&
                                        _textForm7.currentState.validate() &&
                                        _textForm8.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  } else if (countList.length == 9) {
                                    if (_textForm1.currentState.validate()) {}
                                    if (_textForm2.currentState.validate()) {}
                                    if (_textForm3.currentState.validate()) {}
                                    if (_textForm4.currentState.validate()) {}
                                    if (_textForm5.currentState.validate()) {}
                                    if (_textForm6.currentState.validate()) {}
                                    if (_textForm7.currentState.validate()) {}
                                    if (_textForm8.currentState.validate()) {}
                                    if (_textForm9.currentState.validate()) {}
                                    if (_textForm1.currentState.validate() &&
                                        _textForm2.currentState.validate() &&
                                        _textForm3.currentState.validate() &&
                                        _textForm4.currentState.validate() &&
                                        _textForm5.currentState.validate() &&
                                        _textForm6.currentState.validate() &&
                                        _textForm7.currentState.validate() &&
                                        _textForm8.currentState.validate() &&
                                        _textForm9.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  } else if (countList.length == 10) {
                                    if (_textForm1.currentState.validate()) {}
                                    if (_textForm2.currentState.validate()) {}
                                    if (_textForm3.currentState.validate()) {}
                                    if (_textForm4.currentState.validate()) {}
                                    if (_textForm5.currentState.validate()) {}
                                    if (_textForm6.currentState.validate()) {}
                                    if (_textForm7.currentState.validate()) {}
                                    if (_textForm8.currentState.validate()) {}
                                    if (_textForm9.currentState.validate()) {}
                                    if (_textForm10.currentState.validate()) {}
                                    if (_textForm1.currentState.validate() &&
                                        _textForm2.currentState.validate() &&
                                        _textForm3.currentState.validate() &&
                                        _textForm4.currentState.validate() &&
                                        _textForm5.currentState.validate() &&
                                        _textForm6.currentState.validate() &&
                                        _textForm7.currentState.validate() &&
                                        _textForm8.currentState.validate() &&
                                        _textForm9.currentState.validate() &&
                                        _textForm10.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  } else if (countList.length == 11) {
                                    if (_textForm1.currentState.validate()) {}
                                    if (_textForm2.currentState.validate()) {}
                                    if (_textForm3.currentState.validate()) {}
                                    if (_textForm4.currentState.validate()) {}
                                    if (_textForm5.currentState.validate()) {}
                                    if (_textForm6.currentState.validate()) {}
                                    if (_textForm7.currentState.validate()) {}
                                    if (_textForm8.currentState.validate()) {}
                                    if (_textForm9.currentState.validate()) {}
                                    if (_textForm10.currentState.validate()) {}
                                    if (_textForm11.currentState.validate()) {}
                                    if (_textForm1.currentState.validate() &&
                                        _textForm2.currentState.validate() &&
                                        _textForm3.currentState.validate() &&
                                        _textForm4.currentState.validate() &&
                                        _textForm5.currentState.validate() &&
                                        _textForm6.currentState.validate() &&
                                        _textForm7.currentState.validate() &&
                                        _textForm8.currentState.validate() &&
                                        _textForm9.currentState.validate() &&
                                        _textForm10.currentState.validate() &&
                                        _textForm11.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  } else if (countList.length == 12) {
                                    if (_textForm1.currentState.validate()) {}
                                    if (_textForm2.currentState.validate()) {}
                                    if (_textForm3.currentState.validate()) {}
                                    if (_textForm4.currentState.validate()) {}
                                    if (_textForm5.currentState.validate()) {}
                                    if (_textForm6.currentState.validate()) {}
                                    if (_textForm7.currentState.validate()) {}
                                    if (_textForm8.currentState.validate()) {}
                                    if (_textForm9.currentState.validate()) {}
                                    if (_textForm10.currentState.validate()) {}
                                    if (_textForm11.currentState.validate()) {}
                                    if (_textForm12.currentState.validate()) {}
                                    if (_textForm1.currentState.validate() &&
                                        _textForm2.currentState.validate() &&
                                        _textForm3.currentState.validate() &&
                                        _textForm4.currentState.validate() &&
                                        _textForm5.currentState.validate() &&
                                        _textForm6.currentState.validate() &&
                                        _textForm7.currentState.validate() &&
                                        _textForm8.currentState.validate() &&
                                        _textForm9.currentState.validate() &&
                                        _textForm10.currentState.validate() &&
                                        _textForm11.currentState.validate() &&
                                        _textForm12.currentState.validate()) {
                                      updateOperationDetails();
                                    }
                                  }

                                  // updateOperationDetails();
                                },
                                child: Text(
                                  'ADD',
                                  textAlign: TextAlign.center,
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'geometric sans-serif',
                                        color: Color(0xFFFFFFFF),
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        fontWeight: FontWeight.w700,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),

                      if (toogleSwitch == true)
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Checkbox(
                                    value: allCheck,
                                    activeColor: Colors.blue,
                                    side: BorderSide(
                                      color: Colors.black54,
                                      width: 1,
                                    ),
                                    onChanged: (bool value) {
                                      setState(() {
                                        allCheck = value;
                                      });
                                    },
                                  )), //Checkbox

                              Text(
                                "Set For All day",
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeVertical * 2,
                                    height: 1.55,
                                    color: allCheck == true
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: allCheck == true
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )
                              // RichText(
                              //   text: TextSpan(
                              //     text: 'Note : ',
                              //     style: TextStyle(
                              //         fontSize:
                              //             SizeConfig.blockSizeVertical * 2,
                              //         height: 1.55,
                              //         color: Colors.grey,
                              //         fontWeight: FontWeight.bold),
                              //     children: <TextSpan>[
                              //       TextSpan(text: " "),
                              //       TextSpan(
                              //           text:
                              //               "You can not remove hours once added.",
                              //           style: TextStyle(
                              //             height: 1.5,
                              //             fontSize:
                              //                 SizeConfig.blockSizeVertical *
                              //                     1.8,
                              //             letterSpacing: 0.1,
                              //             color: Colors.grey,
                              //           )),
                              //     ],
                              //   ),
                              // )
                            ]),

                      if (localOperationalData.length != 0)
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Service Hours",
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        letterSpacing: 0.2,
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // Padding(
                                    //   padding:
                                    //       EdgeInsetsDirectional.fromSTEB(
                                    //           SizeConfig
                                    //                   .blockSizeHorizontal *
                                    //               0,
                                    //           SizeConfig.blockSizeVertical *
                                    //               0,
                                    //           0,
                                    //           0,),
                                    //   child: TextButton(
                                    //       onPressed: () {
                                    //         if (widget.vendorType ==
                                    //             "vendor") {
                                    //           Navigator.pushReplacement(
                                    //             context,
                                    //             PageRouteBuilder(
                                    //               pageBuilder: (context,
                                    //                       animation1,
                                    //                       animation2) =>
                                    //                   AcceptWidget(
                                    //                       vendorType: widget
                                    //                           .vendorType),
                                    //               transitionDuration:
                                    //                   Duration(seconds: 0,),
                                    //             ),
                                    //           );
                                    //         } else {
                                    //           Navigator.pushReplacement(
                                    //             context,
                                    //             PageRouteBuilder(
                                    //               pageBuilder: (context,
                                    //                       animation1,
                                    //                       animation2) =>
                                    //                   AccountSetupWidget(
                                    //                       vendorType: widget
                                    //                           .vendorType),
                                    //               transitionDuration:
                                    //                   Duration(seconds: 0,),
                                    //             ),
                                    //           );
                                    //         }
                                    //       },
                                    //       child: Row(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.end,
                                    //         children: [
                                    //           Text(
                                    //             'NEXT',
                                    //             style: TrymdPartnerTheme.of(
                                    //                     context)
                                    //                 .bodyText1
                                    //                 .override(
                                    //                   fontFamily:
                                    //                       'geometric sans-serif',
                                    //                   color:
                                    //                       Color(0xFF000000,),
                                    //                   fontSize: SizeConfig
                                    //                           .blockSizeVertical *
                                    //                       2.5,
                                    //                   fontWeight:
                                    //                       FontWeight.w700,
                                    //                   useGoogleFonts: false,
                                    //                 ),
                                    //           ),
                                    //           SizedBox(width: 10,),
                                    //           FaIcon(
                                    //             FontAwesomeIcons
                                    //                 .longArrowAltRight,
                                    //             color: Color(0xFF000000,),
                                    //             size: SizeConfig
                                    //                     .blockSizeVertical *
                                    //                 2.5,
                                    //           ),
                                    //         ],
                                    //       )),
                                    // ),
                                  ]),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: ScrollPhysics(),
                                itemCount: localOperationalData.length,
                                itemBuilder: (context, index1) {
                                  return Column(
                                    children: [
                                      ExpansionTile(
                                          backgroundColor: Colors.grey[100],
                                          collapsedBackgroundColor:
                                              Colors.grey[200],
                                          iconColor: Colors.black,
                                          collapsedIconColor: Colors.black,
                                          title: Text(
                                            localOperationalData[index1]
                                                    ['dayName']
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontFamily:
                                                  'geometric sans-serif',
                                              letterSpacing: 0.2,
                                              color: Colors.black,
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                child: GridView.builder(
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      localOperationalData[
                                                                  index1]
                                                              ['timeSplitup']
                                                          .length,
                                                  physics: ScrollPhysics(),
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    childAspectRatio:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                3) /
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                20),
                                                    crossAxisSpacing: 8.0,
                                                    mainAxisSpacing: 10.0,
                                                  ),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return timeDetails(
                                                      localOperationalData[
                                                                  index1]
                                                              ['timeSplitup']
                                                          [index],
                                                    );
                                                  },
                                                ),
                                              ),

                                              // ListView.builder(
                                              //     shrinkWrap: true,
                                              //     scrollDirection: Axis.vertical,
                                              //     physics: ScrollPhysics(),
                                              //     itemCount:
                                              //         localOperationalData[index1]
                                              //                 ['timeSplitup']
                                              //             .length,
                                              //     itemBuilder: (context, index2) {
                                              //       return

                                              //        Row(
                                              //         children: [
                                              //           Text(
                                              //             localOperationalData[index1]
                                              //                     ['timeSplitup']
                                              //                 [index2][0],
                                              //             style: TextStyle(
                                              //               fontFamily:
                                              //                   'geometric sans-serif',
                                              //               letterSpacing: 0.2,
                                              //               color: Colors.black,
                                              //               fontSize: SizeConfig
                                              //                       .blockSizeVertical *
                                              //                   2,
                                              //               fontWeight:
                                              //                   FontWeight.normal,
                                              //             ),
                                              //           ),
                                              //           Text(
                                              //             localOperationalData[index1]
                                              //                     ['timeSplitup']
                                              //                 [index2][1],
                                              //             style: TextStyle(
                                              //               fontFamily:
                                              //                   'geometric sans-serif',
                                              //               letterSpacing: 0.2,
                                              //               color: Colors.black,
                                              //               fontSize: SizeConfig
                                              //                       .blockSizeVertical *
                                              //                   2,
                                              //               fontWeight:
                                              //                   FontWeight.normal,
                                              //             ),
                                              //           )
                                              //         ],
                                              //       );
                                              //     })
                                            ),
                                            SizedBox(height: 10)
                                          ]),
                                      SizedBox(height: 10)
                                    ],
                                  );
                                },
                              )),
                            ],
                          ),
                        ),
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget timeDetails(data) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: Color(0xFFF1F4F7),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          2,
          0,
          0,
          0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data[0],
              style: TrymdPartnerTheme.of(context).bodyText1.override(
                    fontFamily: 'Nunito Sans',
                    color: Color(0xFF0B2F45),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            Text(
              " - ",
              style: TrymdPartnerTheme.of(context).bodyText1.override(
                    fontFamily: 'Nunito Sans',
                    color: Color(0xFF0B2F45),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            Text(
              data[1],
              style: TrymdPartnerTheme.of(context).bodyText1.override(
                    fontFamily: 'Nunito Sans',
                    color: Color(0xFF0B2F45),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ],
        ),
      ),
    );
  }

// widget one
  Widget addHoursSetOne(context, index) {
    return Form(
      key: _textForm1,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 4,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 0,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 0,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              controller: textOne1,
                              // textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 < 00 || value3 > 23) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 59) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },

                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              onChanged: (val) {
                                // setState(() {

                                // });
                                textSetOne1 = val;
                                // if (val.length == 5) {
                                //   dataList[index].add(val);
                                //   print(val);
                                // }
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetOne1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //           print(textSetOne1);
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 4,
                  SizeConfig.blockSizeVertical * 1,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetOne2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              controller: textOne2,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              onChanged: (val) {
                                // setState(() {

                                // });
                                textSetOne2 = val;
                                // if (val.length == 5) {
                                //   dataList[index].add(val);
                                //   print(val);
                                // }
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                if (countList.length > 1) {
                  textSetOne1 = textSetTwo1;
                  textSetOne2 = textSetTwo2;
                  textOne1.text = textTwo1.text;
                  textOne2.text = textTwo2.text;
                  countList.removeAt(0);
                  setState(() {});
                }
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

//widget two
  Widget addHoursSetTwo(context, index) {
    return Form(
      key: _textForm2,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 4,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetTwo1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1,
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1),
            //   child: Text(
            //     'To',
            //     style: TextStyle(
            //         fontFamily: 'geometric sans-serif',
            //         color: Color(0xFF0B2F45),
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetTwo2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 0,
                0,
                0,
                0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: Colors.black45,
                        //   width: 1,
                        // ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        controller: textTwo1,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val.length != 5) {
                            return "Fill correctly";
                          } else if (val.length == 5) {
                            String value1 = val[0] + val[1];
                            String value2 = val[3] + val[4];
                            int value3 = int.parse(value1);
                            int value4 = int.parse(value2);
                            if (value3 <= 00 || value3 > 24) {
                              return "enter valid value";
                            }
                            if (value4 < 00 || value4 > 60) {
                              return "enter valid value";
                            }
                          } else {
                            return null;
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(4),
                          new CardExpiryInputFormatter()
                        ],
                        onChanged: (val) {
                          textSetTwo1 = val;
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black45,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorStyle: TextStyle(
                              fontSize: 12,
                              fontFamily: 'geometric sans-serif',
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black45,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 8),
                            hintText: '00:00',
                            hintStyle: TextStyle(color: Colors.black)),
                      ))
                ],
              ),
            ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical * 0,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              controller: textTwo2,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              onChanged: (val) {
                                textSetTwo2 = val;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                textSetTwo1 = textSetThree1;
                textSetTwo2 = textSetThree1;
                textTwo1.text = textThree1.text;
                textTwo2.text = textThree2.text;
                countList.removeAt(1);
                setState(() {});
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

// widget three
  Widget addHoursSetThree(context, index) {
    return Form(
      key: _textForm3,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 1,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetThree1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1,
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1),
            //   child: Text(
            //     'To',
            //     style: TextStyle(
            //         fontFamily: 'geometric sans-serif',
            //         color: Color(0xFF0B2F45),
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetThree2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 3,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 0,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              controller: textThree1,
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              onChanged: (val) {
                                textSetThree1 = val;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical * 0,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              controller: textThree2,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              onChanged: (val) {
                                textSetThree2 = val;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                textSetThree1 = textSetFour1;
                textSetThree2 = textSetFour2;
                textThree1.text = textFour1.text;
                textThree2.text = textFour2.text;
                countList.removeAt(2);
                setState(() {});
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

// widget four
  Widget addHoursSetFour(context, index) {
    return Form(
      key: _textForm4,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 4,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetFour1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1,
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1),
            //   child: Text(
            //     'To',
            //     style: TextStyle(
            //         fontFamily: 'geometric sans-serif',
            //         color: Color(0xFF0B2F45),
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetFour2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 0,
                0,
                0,
                0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: Colors.black45,
                        //   width: 1,
                        // ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: textFour1,
                        validator: (val) {
                          if (val.length != 5) {
                            return "Fill correctly";
                          } else if (val.length == 5) {
                            String value1 = val[0] + val[1];
                            String value2 = val[3] + val[4];
                            int value3 = int.parse(value1);
                            int value4 = int.parse(value2);
                            if (value3 <= 00 || value3 > 24) {
                              return "enter valid value";
                            }
                            if (value4 < 00 || value4 > 60) {
                              return "enter valid value";
                            }
                          } else {
                            return null;
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(4),
                          new CardExpiryInputFormatter()
                        ],
                        onChanged: (val) {
                          textSetFour1 = val;
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black45,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black45,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorStyle: TextStyle(
                              fontSize: 12,
                              fontFamily: 'geometric sans-serif',
                            ),
                            contentPadding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 8),
                            hintText: '00:00',
                            hintStyle: TextStyle(color: Colors.black)),
                      ))
                ],
              ),
            ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical * 0,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              controller: textFour2,
                              onChanged: (val) {
                                textSetFour2 = val;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                textSetFour1 = textSetFive1;
                textSetFour2 = textSetFive2;
                textFour1.text = textFive1.text;
                textFour2.text = textFive2.text;
                countList.removeAt(3);
                setState(() {});
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

  // widget five
  Widget addHoursSetFive(context, index) {
    return Form(
      key: _textForm5,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 4,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetFive1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1,
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1),
            //   child: Text(
            //     'To',
            //     style: TextStyle(
            //         fontFamily: 'geometric sans-serif',
            //         color: Color(0xFF0B2F45),
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetFive2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 3,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 0,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: textFive1,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              onChanged: (val) {
                                textSetFive1 = val;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical * 0,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              controller: textFive2,
                              onChanged: (val) {
                                textSetFive2 = val;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                textSetFive1 = textSetSix1;
                textSetFive2 = textSetSix2;
                textFive1.text = textSix1.text;
                textFive2.text = textSix2.text;
                countList.removeAt(4);
                setState(() {});
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

// widget six
  Widget addHoursSetSix(context, index) {
    return Form(
      key: _textForm6,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 4,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetSix1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1,
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1),
            //   child: Text(
            //     'To',
            //     style: TextStyle(
            //         fontFamily: 'geometric sans-serif',
            //         color: Color(0xFF0B2F45),
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetSix2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 0,
                0,
                0,
                0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: Colors.black45,
                        //   width: 1,
                        // ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: textSix1,
                        validator: (val) {
                          if (val.length != 5) {
                            return "Fill correctly";
                          } else if (val.length == 5) {
                            String value1 = val[0] + val[1];
                            String value2 = val[3] + val[4];
                            int value3 = int.parse(value1);
                            int value4 = int.parse(value2);
                            if (value3 <= 00 || value3 > 24) {
                              return "enter valid value";
                            }
                            if (value4 < 00 || value4 > 60) {
                              return "enter valid value";
                            }
                          } else {
                            return null;
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(4),
                          new CardExpiryInputFormatter()
                        ],
                        onChanged: (val) {
                          textSetSix1 = val;
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black45,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black45,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorStyle: TextStyle(
                              fontSize: 12,
                              fontFamily: 'geometric sans-serif',
                            ),
                            contentPadding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 8),
                            hintText: '00:00',
                            hintStyle: TextStyle(color: Colors.black)),
                      ))
                ],
              ),
            ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical * 0,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              controller: textSix2,
                              onChanged: (val) {
                                textSetSix2 = val;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                textSetSix1 = textSetSeven1;
                textSetSix2 = textSetSeven2;
                textSix1.text = textSeven1.text;
                textSix2.text = textSeven2.text;
                countList.removeAt(5);
                setState(() {});
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

// widget Seven
  Widget addHoursSetSeven(context, index) {
    return Form(
      key: _textForm7,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 4,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetSeven1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1,
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1),
            //   child: Text(
            //     'To',
            //     style: TextStyle(
            //         fontFamily: 'geometric sans-serif',
            //         color: Color(0xFF0B2F45),
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetSeven2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 3,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 0,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: textSeven1,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              onChanged: (val) {
                                textSetSeven1 = val;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical * 0,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              controller: textSeven2,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              onChanged: (val) {
                                textSetSeven2 = val;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                textSetSeven1 = textSetEight1;
                textSetSeven2 = textSetEight1;
                textSeven1.text = textEight1.text;
                textSeven2.text = textEight2.text;
                countList.removeAt(6);
                setState(() {});
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

// widget eight
  Widget addHoursSetEight(context, index) {
    return Form(
      key: _textForm8,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 4,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetEight1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1,
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1),
            //   child: Text(
            //     'To',
            //     style: TextStyle(
            //         fontFamily: 'geometric sans-serif',
            //         color: Color(0xFF0B2F45),
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetEight2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 3,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 0,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: textEight1,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              onChanged: (val) {
                                textSetEight1 = val;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 7,
                  SizeConfig.blockSizeVertical * 1,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              controller: textEight2,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              onChanged: (val) {
                                textSetEight2 = val;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                textSetEight1 = textSetNine1;
                textSetEight2 = textSetNine2;
                textEight1.text = textNine1.text;
                textEight2.text = textNine2.text;
                countList.removeAt(7);
                setState(() {});
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

// widget nine
  Widget addHoursSetNine(context, index) {
    return Form(
      key: _textForm9,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 4,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetNine1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1,
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1),
            //   child: Text(
            //     'To',
            //     style: TextStyle(
            //         fontFamily: 'geometric sans-serif',
            //         color: Color(0xFF0B2F45),
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetNine2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 3,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 0,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: textNine1,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              onChanged: (val) {
                                textSetNine1 = val;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical * 0,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              controller: textNine2,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              onChanged: (val) {
                                textSetNine2 = val;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                textSetNine1 = textSetTen1;
                textSetNine2 = textSetTen2;
                textNine1.text = textTen1.text;
                textNine2.text = textTen2.text;
                countList.removeAt(8);
                setState(() {});
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

// widget ten
  Widget addHoursSetTen(context, index) {
    return Form(
      key: _textForm10,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 4,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetTen1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1,
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1),
            //   child: Text(
            //     'To',
            //     style: TextStyle(
            //         fontFamily: 'geometric sans-serif',
            //         color: Color(0xFF0B2F45),
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetTen2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 3,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 0,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: textTen1,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              onChanged: (val) {
                                textSetTen1 = val;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical * 0,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              controller: textTen2,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              onChanged: (val) {
                                textSetTen2 = val;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                textSetTen1 = textSetEleven1;
                textSetTen2 = textSetEleven2;
                textTen1.text = textEleven1.text;
                textTen2.text = textEleven2.text;
                countList.removeAt(9);
                setState(() {});
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

// widget eleven
  Widget addHoursSetEleven(context, index) {
    return Form(
      key: _textForm11,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 4,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetEleven1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1,
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1),
            //   child: Text(
            //     'To',
            //     style: TextStyle(
            //         fontFamily: 'geometric sans-serif',
            //         color: Color(0xFF0B2F45),
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetEleven2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 3,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 0,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: textEleven1,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              onChanged: (val) {
                                textSetEleven1 = val;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical * 0,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              controller: textEleven2,
                              onChanged: (val) {
                                textSetEleven2 = val;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                textSetEleven1 = textSetTwelve1;
                textSetEleven2 = textSetTwelve2;
                textEleven1.text = textTwelve1.text;
                textEleven2.text = textTwelve2.text;
                countList.removeAt(10);
                setState(() {});
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

// widget Twelve
  Widget addHoursSetTwelve(context, index) {
    return Form(
      key: _textForm12,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.blockSizeHorizontal * 4,
            0,
            SizeConfig.blockSizeHorizontal * 4,
            SizeConfig.blockSizeVertical * 2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetTwelve1 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1,
            //       SizeConfig.blockSizeHorizontal * 0,
            //       SizeConfig.blockSizeVertical * 1),
            //   child: Text(
            //     'To',
            //     style: TextStyle(
            //         fontFamily: 'geometric sans-serif',
            //         color: Color(0xFF0B2F45),
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     child: TimePickerSpinner(
            //       is24HourMode: false,
            //       alignment: Alignment.center,
            //       normalTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.011,
            //           color: Colors.black),
            //       highlightedTextStyle: TextStyle(
            //           fontSize: MediaQuery.of(context).size.height * 0.021,
            //           color: Colors.blue),
            //       spacing: MediaQuery.of(context).size.height * 0.003,
            //       itemHeight: MediaQuery.of(context).size.height * 0.03,
            //       itemWidth: MediaQuery.of(context).size.height * 0.038,
            //       isForce2Digits: true,
            //       onTimeChange: (time) {
            //         setState(() {
            //           textSetTwelve2 =
            //               formatDate(time, [hh, ':', nn, " ", am]).toString();
            //         });
            //       },
            //     )),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 3,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 0,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: textTwelve1,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              onChanged: (val) {
                                textSetTwelve1 = val;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical * 0,
                  SizeConfig.blockSizeHorizontal * 0,
                  SizeConfig.blockSizeVertical * 1),
              child: Text(
                'To',
                style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Color(0xFF0B2F45),
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                0,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      0,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black45,
                              //   width: 1,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              controller: textTwelve2,
                              validator: (val) {
                                if (val.length != 5) {
                                  return "Fill correctly";
                                } else if (val.length == 5) {
                                  String value1 = val[0] + val[1];
                                  String value2 = val[3] + val[4];
                                  int value3 = int.parse(value1);
                                  int value4 = int.parse(value2);
                                  if (value3 <= 00 || value3 > 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 > 60) {
                                    return "enter valid value";
                                  }
                                } else {
                                  return null;
                                }
                                return null;
                              },
                              onChanged: (val) {
                                textSetTwelve2 = val;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(4),
                                new CardExpiryInputFormatter()
                              ],
                              style: TextStyle(color: Colors.black),
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 8),
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                textSetTwelve1 = "";
                textSetTwelve2 = "";
                countList.removeAt(11);
                setState(() {});
              },
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              iconSize: SizeConfig.blockSizeVertical * 4,
            )
          ],
        ),
      ),
    );
  }

// Functions ********************************************************************************

  updateOperationDetails() async {
    // List data = [];
    // for (int i = 0; i < dataList.length; i++) {
    //   if (dataList[i].length != 0) {
    //     dataList[i] = Set.of(dataList[i]).toList();
    //     data.insert(0, dataList[i],);
    //   }
    // }

    data = [
      [textSetOne1, textSetOne2],
      [textSetTwo1, textSetTwo2],
      [textSetThree1, textSetThree2],
      [textSetFour1, textSetFour2],
      [textSetFive1, textSetFive2],
      [textSetSix1, textSetSix2],
      [textSetSeven1, textSetSeven2],
      [textSetEight1, textSetEight2],
      [textSetNine1, textSetNine2],
      [textSetTen1, textSetTen2],
      [textSetEleven1, textSetEleven2],
      [textSetTwelve1, textSetTwelve2],
    ];
    List datum = [];
    for (int i = 0; i < data.length; i++) {
      if (data[i].length != 0) {
        if ((data[i][0] != "" || data[i][1] != "") &&
            (data[i][0].length == 5 || data[i][1].length == 5)) {
          datum.add(
            data[i],
          );
        }
        // dataList[i] = Set.of(dataList[i]).toList();
        // data.insert(0, dataList[i],);
      }
    }
    print(datum);
    List datumOne = [];
    if (datum.length == 0) {
      setState(() {
        // warning = true;
        warning = true;
      });
    } else {
      setState(() {
        warning = false;
      });
    }

    for (int i = 0; i < datum.length; i++) {
      if (datum[i][0].length == 5 && datum[i][1].length == 5) {
        datumOne.add(
          datum[i],
        );
      }
    }

    if (datumOne.length == 0) {
      setState(() {
        // warning = true;
        warning = false;
      });
    } else {
      if (allCheck == true) {
        setState(() {
          warning = false;
        });
        List da = [
          "monday",
          "tuesday",
          "wednessday",
          "thursday",
          "friday",
          "saturday",
          "sunday"
        ];
        if (localOperationalData.length == 0) {
          for (int i = 0; i < da.length; i++) {
            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": da[i],
              "time": datumOne
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);

            localOperationalData
                .add({"dayName": da[i], "timeSplitup": datumOne});
            storage.setItem("localOperationalData", localOperationalData);
            // if (response['status'] == 1) {
            //   Fluttertoast.showToast(
            //       msg: "Details updated successfully",
            //       toastLength: Toast.LENGTH_SHORT,
            //       gravity: ToastGravity.SNACKBAR,
            //       timeInSecForIosWeb: 1,
            //       backgroundColor: Colors.black54,
            //       textColor: Colors.white,
            //       fontSize: 16.0);
            // } else {
            //   Fluttertoast.showToast(
            //       msg: "Something went wrong",
            //       toastLength: Toast.LENGTH_SHORT,
            //       gravity: ToastGravity.SNACKBAR,
            //       timeInSecForIosWeb: 1,
            //       backgroundColor: Colors.black54,
            //       textColor: Colors.white,
            //       fontSize: 16.0);
            // }
          }
        } else {
          List testOne = [];
          localOperationalData.forEach((element) {
            testOne.add(
              element['dayName'],
            );
          });

          testOne.forEach((element) {
            for (int i = 0; i < da.length; i++) {
              if (da[i] == element) {
                da.remove(element);
              }
            }
          });

          for (int i = 0; i < da.length; i++) {
            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": da[i],
              "time": datumOne
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);

            localOperationalData
                .add({"dayName": da[i], "timeSplitup": datumOne});
            storage.setItem("localOperationalData", localOperationalData);
          }
          setState(() {});
          // for(int i=0;i<localOperationalData.length;i++){
          //   for(int j=0;j<da.length;j++){
          //     if(localOperationalData[i]['dayName']!=da[j]){
          //        var json = jsonEncode({
          //   "professional_id": storage.getItem("vendor_id"),
          //   "settime": "true",
          //   "day": da[j],
          //   "time": datumOne
          // });
          // print(json);
          // var response =
          //     await VendorClassificationGet().updateOperationDetails(json);

          // localOperationalData.add({"dayName": da[j], "timeSplitup": datumOne});
          // storage.setItem("localOperationalData", localOperationalData);
          //     }
          //   }
          // }

        }
        setState(() {});
        _globalWidget.toastMessage('Details updated successfully');
      } else if (allCheck == false) {
        var json = jsonEncode({
          "professional_id": storage.getItem("vendor_id"),
          "settime": "true",
          "day": selectedDay,
          "time": datumOne
        });
        print(json);
        var response =
            await VendorClassificationGet().updateOperationDetails(json);
        if (response['status'] == 1) {
          if (localOperationalData.length != 0) {
            List testOne = [];
            localOperationalData.forEach((element) {
              testOne.add(
                element['dayName'],
              );
            });
            if (testOne.contains(selectedDay)) {
              for (int i = 0; i < localOperationalData.length; i++) {
                if (localOperationalData[i]['dayName'] == selectedDay) {
                  localOperationalData[i] = {
                    "dayName": selectedDay,
                    "timeSplitup": datumOne
                  };
                }
              }
              storage.setItem("localOperationalData", localOperationalData);
            } else {
              localOperationalData
                  .add({"dayName": selectedDay, "timeSplitup": datumOne});
              storage.setItem("localOperationalData", localOperationalData);
            }
          } else {
            localOperationalData
                .add({"dayName": selectedDay, "timeSplitup": datumOne});
            storage.setItem("localOperationalData", localOperationalData);
          }

          setState(() {});
          _globalWidget.toastMessage('Details updated successfully');
        } else {
          _globalWidget.toastMessage('Something went wrong');
        }
      }
    }

    // if (data.length != 0) {
    //   var json = jsonEncode({
    //     "professional_id": storage.getItem("vendor_id"),
    //     "settime": "true",
    //     "day": showAvailableContent,
    //     "time": data
    //   });
    //   print(json);
    //   var response =
    //       await VendorClassificationGet().updateOperationDetails(json);
    //   if (response['status'] == 1) {
    //     Fluttertoast.showToast(
    //         msg: "Details updated successfully",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.SNACKBAR,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.black54,
    //         textColor: Colors.white,
    //         fontSize: 16.0);
    //   }
    // } else {
    //   Fluttertoast.showToast(
    //       msg: "Please Enter Your working hours",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.SNACKBAR,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.black54,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // }
  }

  calen() async {
    DateTime newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
    );
    print(newDateTime);
  }
}

class CardExpiryInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(
        text[i],
      );
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write(':'); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: new TextSelection.collapsed(offset: string.length),
    );
  }
}
