import 'dart:convert';
// import 'package:date_format/date_format.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:trymd_partner/accountsetup/accept_widget.dart';
import 'package:trymd_partner/accountsetup/accountsetup1.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/repository/vendorupdate.dart';
import 'package:trymd_partner/service/service_selection_widget.dart';
import 'package:trymd_partner/sizer.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../global_widget/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
// import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class OperationalDetailsWidget extends StatefulWidget {
  final vendorType;
  OperationalDetailsWidget({this.vendorType});

  @override
  _OperationalDetailsWidgetState createState() =>
      _OperationalDetailsWidgetState();
}

class _OperationalDetailsWidgetState extends State<OperationalDetailsWidget> {
  final LocalStorage storage = new LocalStorage('localstorage_app');
  // initialize global widget
  final _globalWidget = GlobalWidget();
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
  List<dynamic> localOperationalData = [];
  bool checkMonday = false;
  bool checkTuesday = false;
  bool checkWednesday = false;
  bool checkThursday = false;
  bool checkFriday = false;
  bool checkSaturday = false;
  bool checkSunday = false;

  @override
  void initState() {
    super.initState();
    if (storage.getItem("localOperationalData") != null) {
      localOperationalData = storage.getItem("localOperationalData");
      // toogleSwitch = true;
    }

    if (storage.getItem("countList") != null) {
      // countList = storage.getItem("countList");
    }
    // storage.setItem("localOperationalData", [],);
    if (storage.getItem("checkMonday") != null) {
      checkMonday = storage.getItem("checkMonday");
    }
    print(checkMonday);
    if (storage.getItem("checkTuesday") != null) {
      checkTuesday = storage.getItem("checkTuesday");
    }
    if (storage.getItem("checkWednesday") != null) {
      checkWednesday = storage.getItem("checkWednesday");
    }
    if (storage.getItem("checkThursday") != null) {
      checkThursday = storage.getItem("checkThursday");
    }
    if (storage.getItem("checkFriday") != null) {
      checkFriday = storage.getItem("checkFriday");
    }
    if (storage.getItem("checkSaturday") != null) {
      checkSaturday = storage.getItem("checkSaturday");
    }
    if (storage.getItem("checkSunday") != null) {
      checkSunday = storage.getItem("checkSunday");
    }
    if (storage.getItem("allCheck") != null) {
      allCheck = storage.getItem("allCheck");
    }
  }

  Future<bool> _onBackButtonPressed() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            ServiceSelectionWidget(
          vendorType: widget.vendorType,
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
                await Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        ServiceSelectionWidget(vendorType: widget.vendorType),
                    transitionDuration: Duration(
                      seconds: 0,
                    ),
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
                  color: Colors.black,
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
                                            : Colors.black,
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
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

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
                                      colors: selectedDay.contains("wednessday")
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
                                                : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

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
                                        color: selectedDay.contains("thursday")
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

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
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

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
                                        color: selectedDay.contains("saturday")
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

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
                                      'Sun',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: selectedDay.contains("sunday")
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                                  color: Colors.black,
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
                                    storage.setItem("countList", countList);
                                  } else if (toogleSwitch == false) {
                                    countList = [];
                                    storage.setItem("countList", countList);
                                  }
                                });
                              },
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  countList.insert(0, "0");
                                  storage.setItem("countList", countList);
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
                                    color: Colors.black,
                                    fontSize: SizeConfig.blockSizeVertical * 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
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
                      //       ]),),

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
                        Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.01),
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
                                        if (allCheck == true) {
                                          checkMonday = false;
                                          checkThursday = false;
                                          checkWednesday = false;
                                          checkTuesday = false;
                                          checkFriday = false;
                                          checkSaturday = false;
                                          checkSunday = false;
                                          storage.setItem(
                                              "checkMonday", checkMonday);
                                          storage.setItem(
                                              "checkThursday", checkThursday);
                                          storage.setItem(
                                              "checkWednesday", checkWednesday);
                                          storage.setItem(
                                              "checkTuesday", checkTuesday);
                                          storage.setItem(
                                              "checkFriday", checkFriday);
                                          storage.setItem(
                                              "checkSaturday", checkSaturday);
                                          storage.setItem(
                                              "checkSunday", checkSunday);
                                          storage.setItem("allCheck", allCheck);
                                        }
                                      });
                                    },
                                  ),
                                ), //Checkbox

                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Text(
                                      "ALL",
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          height: 1.55,
                                          color: allCheck == true
                                              ? Colors.black
                                              : Colors.grey,
                                          fontWeight: allCheck == true
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    )),

                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.01),
                                  child: Checkbox(
                                    value: checkSunday,
                                    activeColor: Colors.blue,
                                    side: BorderSide(
                                      color: Colors.black54,
                                      width: 1,
                                    ),
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkSunday = value;
                                        if (checkSunday == true) {
                                          allCheck = false;
                                          storage.setItem(
                                              "checkMonday", checkMonday);
                                          storage.setItem(
                                              "checkThursday", checkThursday);
                                          storage.setItem(
                                              "checkWednesday", checkWednesday);
                                          storage.setItem(
                                              "checkTuesday", checkTuesday);
                                          storage.setItem(
                                              "checkFriday", checkFriday);
                                          storage.setItem(
                                              "checkSaturday", checkSaturday);
                                          storage.setItem(
                                              "checkSunday", checkSunday);
                                          storage.setItem("allCheck", allCheck);
                                        }
                                      });
                                    },
                                  ),
                                ), //Checkbox

                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.085,
                                    child: Text(
                                      "SU",
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          height: 1.55,
                                          color: checkSunday == true
                                              ? Colors.black
                                              : Colors.grey,
                                          fontWeight: checkSunday == true
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    )),

                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.01),
                                  child: Checkbox(
                                    value: checkMonday,
                                    activeColor: Colors.blue,
                                    side: BorderSide(
                                      color: Colors.black54,
                                      width: 1,
                                    ),
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkMonday = value;
                                        if (checkMonday == true) {
                                          allCheck = false;
                                          storage.setItem(
                                              "checkMonday", checkMonday);
                                          storage.setItem(
                                              "checkThursday", checkThursday);
                                          storage.setItem(
                                              "checkWednesday", checkWednesday);
                                          storage.setItem(
                                              "checkTuesday", checkTuesday);
                                          storage.setItem(
                                              "checkFriday", checkFriday);
                                          storage.setItem(
                                              "checkSaturday", checkSaturday);
                                          storage.setItem(
                                              "checkSunday", checkSunday);
                                          storage.setItem("allCheck", allCheck);
                                        }
                                      });
                                    },
                                  ),
                                ), //Checkbox

                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Text(
                                      "MO",
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          height: 1.55,
                                          color: checkMonday == true
                                              ? Colors.black
                                              : Colors.grey,
                                          fontWeight: checkMonday == true
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    )),

                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.01),
                                  child: Checkbox(
                                    value: checkTuesday,
                                    activeColor: Colors.blue,
                                    side: BorderSide(
                                      color: Colors.black54,
                                      width: 1,
                                    ),
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkTuesday = value;
                                        if (checkTuesday == true) {
                                          allCheck = false;
                                          storage.setItem(
                                              "checkMonday", checkMonday);
                                          storage.setItem(
                                              "checkThursday", checkThursday);
                                          storage.setItem(
                                              "checkWednesday", checkWednesday);
                                          storage.setItem(
                                              "checkTuesday", checkTuesday);
                                          storage.setItem(
                                              "checkFriday", checkFriday);
                                          storage.setItem(
                                              "checkSaturday", checkSaturday);
                                          storage.setItem(
                                              "checkSunday", checkSunday);
                                          storage.setItem("allCheck", allCheck);
                                        }
                                      });
                                    },
                                  ),
                                ), //Checkbox

                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.085,
                                    child: Text(
                                      "TU",
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          height: 1.55,
                                          color: checkTuesday == true
                                              ? Colors.black
                                              : Colors.grey,
                                          fontWeight: checkTuesday == true
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    ))
                              ]),
                          Row(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Checkbox(
                                        value: checkWednesday,
                                        activeColor: Colors.blue,
                                        side: BorderSide(
                                          color: Colors.black54,
                                          width: 1,
                                        ),
                                        onChanged: (bool value) {
                                          setState(() {
                                            checkWednesday = value;
                                            if (checkWednesday == true) {
                                              allCheck = false;
                                              storage.setItem(
                                                  "checkMonday", checkMonday);
                                              storage.setItem("checkThursday",
                                                  checkThursday);
                                              storage.setItem("checkWednesday",
                                                  checkWednesday);
                                              storage.setItem(
                                                  "checkTuesday", checkTuesday);
                                              storage.setItem(
                                                  "checkFriday", checkFriday);
                                              storage.setItem("checkSaturday",
                                                  checkSaturday);
                                              storage.setItem(
                                                  "checkSunday", checkSunday);
                                              storage.setItem(
                                                  "allCheck", allCheck);
                                            }
                                          });
                                        },
                                      ),
                                    ), //Checkbox

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text(
                                          "WE",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              height: 1.55,
                                              color: checkWednesday == true
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontWeight: checkWednesday == true
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        )),

                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Checkbox(
                                        value: checkThursday,
                                        activeColor: Colors.blue,
                                        side: BorderSide(
                                          color: Colors.black54,
                                          width: 1,
                                        ),
                                        onChanged: (bool value) {
                                          setState(() {
                                            checkThursday = value;
                                            if (checkThursday == true) {
                                              allCheck = false;
                                              storage.setItem(
                                                  "checkMonday", checkMonday);
                                              storage.setItem("checkThursday",
                                                  checkThursday);
                                              storage.setItem("checkWednesday",
                                                  checkWednesday);
                                              storage.setItem(
                                                  "checkTuesday", checkTuesday);
                                              storage.setItem(
                                                  "checkFriday", checkFriday);
                                              storage.setItem("checkSaturday",
                                                  checkSaturday);
                                              storage.setItem(
                                                  "checkSunday", checkSunday);
                                              storage.setItem(
                                                  "allCheck", allCheck);
                                            }
                                          });
                                        },
                                      ),
                                    ), //Checkbox

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.085,
                                        child: Text(
                                          "TH",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              height: 1.55,
                                              color: checkThursday == true
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontWeight: checkThursday == true
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        )),

                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Checkbox(
                                        value: checkFriday,
                                        activeColor: Colors.blue,
                                        side: BorderSide(
                                          color: Colors.black54,
                                          width: 1,
                                        ),
                                        onChanged: (bool value) {
                                          setState(() {
                                            checkFriday = value;
                                            if (checkFriday == true) {
                                              allCheck = false;
                                              storage.setItem(
                                                  "checkMonday", checkMonday);
                                              storage.setItem("checkThursday",
                                                  checkThursday);
                                              storage.setItem("checkWednesday",
                                                  checkWednesday);
                                              storage.setItem(
                                                  "checkTuesday", checkTuesday);
                                              storage.setItem(
                                                  "checkFriday", checkFriday);
                                              storage.setItem("checkSaturday",
                                                  checkSaturday);
                                              storage.setItem(
                                                  "checkSunday", checkSunday);
                                              storage.setItem(
                                                  "allCheck", allCheck);
                                            }
                                          });
                                        },
                                      ),
                                    ), //Checkbox

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text(
                                          "FR",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              height: 1.55,
                                              color: checkFriday == true
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontWeight: checkFriday == true
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        )),

                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Checkbox(
                                        value: checkSaturday,
                                        activeColor: Colors.blue,
                                        side: BorderSide(
                                          color: Colors.black54,
                                          width: 1,
                                        ),
                                        onChanged: (bool value) {
                                          setState(() {
                                            checkSaturday = value;
                                            if (checkSaturday == true) {
                                              allCheck = false;
                                              storage.setItem(
                                                  "checkMonday", checkMonday);
                                              storage.setItem("checkThursday",
                                                  checkThursday);
                                              storage.setItem("checkWednesday",
                                                  checkWednesday);
                                              storage.setItem(
                                                  "checkTuesday", checkTuesday);
                                              storage.setItem(
                                                  "checkFriday", checkFriday);
                                              storage.setItem("checkSaturday",
                                                  checkSaturday);
                                              storage.setItem(
                                                  "checkSunday", checkSunday);
                                              storage.setItem(
                                                  "allCheck", allCheck);
                                            }
                                          });
                                        },
                                      ),
                                    ), //Checkbox

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.085,
                                        child: Text(
                                          "SA",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              height: 1.55,
                                              color: checkSaturday == true
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontWeight: checkSaturday == true
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ))
                                  ]),
                            ],
                          ),
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 0,
                                        SizeConfig.blockSizeVertical * 0,
                                        0,
                                        0,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          if (widget.vendorType == "vendor") {
                                            Navigator.pushReplacement(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context,
                                                        animation1,
                                                        animation2) =>
                                                    AcceptWidget(
                                                        vendorType:
                                                            widget.vendorType),
                                                transitionDuration: Duration(
                                                  seconds: 0,
                                                ),
                                              ),
                                            );
                                          } else {
                                            Navigator.pushReplacement(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context,
                                                        animation1,
                                                        animation2) =>
                                                    AccountSetupWidget(
                                                        vendorType:
                                                            widget.vendorType),
                                                transitionDuration: Duration(
                                                  seconds: 0,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'NEXT',
                                              style:
                                                  TrymdPartnerTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'geometric sans-serif',
                                                        color: Color(
                                                          0xFF000000,
                                                        ),
                                                        fontSize: SizeConfig
                                                                .blockSizeVertical *
                                                            2.5,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons
                                                  .longArrowAltRight,
                                              color: Color(
                                                0xFF000000,
                                              ),
                                              size:
                                                  SizeConfig.blockSizeVertical *
                                                      2.5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
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

                                              ),
                                              SizedBox(height: 10)
                                            ]),
                                        SizedBox(height: 10)
                                      ],
                                    );
                                  },
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
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            Text(
              " - ",
              style: TrymdPartnerTheme.of(context).bodyText1.override(
                    fontFamily: 'Nunito Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            Text(
              data[1],
              style: TrymdPartnerTheme.of(context).bodyText1.override(
                    fontFamily: 'Nunito Sans',
                    color: Colors.black,
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
                                hintStyle: TextStyle(color: Colors.black),
                              ),
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                  storage.setItem("countList", countList);
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                            if ((value3 <= 00 || value3 >= 24))
                            // || value3 > int.parse(textOne2.text))
                            {
                              return "enter valid value";
                            }
                            if (value4 < 00 || value4 >= 60) {
                              return "enter valid value";
                            }
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
                          hintStyle: TextStyle(color: Colors.black),
                        ),
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
                    color: Colors.black,
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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                storage.setItem("countList", countList);
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                                  if (value3 <= 00 || value3 >= 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 >= 60) {
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
                                hintStyle: TextStyle(color: Colors.black),
                              ),
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
                    color: Colors.black,
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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                storage.setItem("countList", countList);
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                            if (value3 <= 00 || value3 >= 24) {
                              return "enter valid value";
                            }
                            if (value4 < 00 || value4 >= 60) {
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
                          hintStyle: TextStyle(color: Colors.black),
                        ),
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
                    color: Colors.black,
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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                storage.setItem("countList", countList);
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                                  if (value3 <= 00 || value3 >= 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 >= 60) {
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
                                hintStyle: TextStyle(color: Colors.black),
                              ),
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
                    color: Colors.black,
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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                storage.setItem("countList", countList);
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                            if (value3 <= 00 || value3 >= 24) {
                              return "enter valid value";
                            }
                            if (value4 < 00 || value4 >= 60) {
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
                          hintStyle: TextStyle(color: Colors.black),
                        ),
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
                    color: Colors.black,
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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                storage.setItem("countList", countList);
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                                  if (value3 <= 00 || value3 >= 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 >= 60) {
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
                                hintStyle: TextStyle(color: Colors.black),
                              ),
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
                    color: Colors.black,
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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                storage.setItem("countList", countList);
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                                  if (value3 <= 00 || value3 >= 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 >= 60) {
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
                                hintStyle: TextStyle(color: Colors.black),
                              ),
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
                    color: Colors.black,
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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                storage.setItem("countList", countList);
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                                  if (value3 <= 00 || value3 >= 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 >= 60) {
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
                                hintStyle: TextStyle(color: Colors.black),
                              ),
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
                    color: Colors.black,
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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                storage.setItem("countList", countList);
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                                  if (value3 <= 00 || value3 >= 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 >= 60) {
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
                                hintStyle: TextStyle(color: Colors.black),
                              ),
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
                    color: Colors.black,
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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                storage.setItem("countList", countList);
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                                  if (value3 <= 00 || value3 >= 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 >= 60) {
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
                                hintStyle: TextStyle(color: Colors.black),
                              ),
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
                    color: Colors.black,
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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                storage.setItem("countList", countList);
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
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.height * 0.025),
            //   ),
            // ),

            // Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.35,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Color(0XFFE5E5E5), width: 1.0,),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0,),),
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
            //     ),),

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
                                  if (value3 <= 00 || value3 >= 24) {
                                    return "enter valid value";
                                  }
                                  if (value4 < 00 || value4 >= 60) {
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
                                hintStyle: TextStyle(color: Colors.black),
                              ),
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
                    color: Colors.black,
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
                                if (value3 <= 00 || value3 >= 24) {
                                  return "enter valid value";
                                }
                                if (value4 < 00 || value4 >= 60) {
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
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
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
                storage.setItem("countList", countList);
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
    print("true");
    // List data = [];
    // for (int i = 0; i < dataList.length; i++) {
    //   if (dataList[i].length != 0) {
    //     dataList[i] = Set.of(dataList[i]).toList();
    //     data.insert(0, dataList[i],);
    //   }
    // }
    showDialog(
        context: context,
        barrierColor: Colors.white38,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

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

    List d = [];

    for (int i = 0; i < datum.length; i++) {
      if (datum[i][0].length == 5 && datum[i][1].length == 5) {
        d.add(
          datum[i],
        );
      }
    }

    for (int i = 0; i < d.length; i++) {
      d[i].forEach((ele) {
        datumOne.add(ele);
      });
    }

    if (datumOne.length == 0) {
      setState(() {
        // warning = true;
        warning = false;
      });
    } else {
      var localJson = storage.getItem("postData");
      var mapString = {};
      if (localJson == null) {
        if (allCheck == true) {
          setState(() {
            warning = false;
          });

          List da = [
            "monday",
            "tuesday",
            "wednesday",
            "thursday",
            "friday",
            "saturday",
          ];
          if (localOperationalData.length == 0) {
            for (int i = 0; i < da.length; i++) {
              mapString[da[i]] = datumOne;
              localOperationalData.add({"dayName": da[i], "timeSplitup": d});
              storage.setItem("localOperationalData", localOperationalData);
            }

            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": mapString,
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);
            storage.setItem("postData", json);
          } else {
            List testOne = [];
            List dOnee = [];
            for (int i = 0; i < da.length; i++) {
              mapString[da[i]] = datumOne;
            }
            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": mapString,
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);
            storage.setItem("postData", json);

            for (int i = 0; i < localOperationalData.length; i++) {
              testOne.add(
                localOperationalData[i]['dayName'],
              );
              // var json = jsonEncode({
              //   "professional_id": storage.getItem("vendor_id"),
              //   "settime": "true",
              //   "day": localOperationalData[i]['dayName'],
              // });
              // print(json);
              // var response =
              //     await VendorClassificationGet().updateOperationDetails(json);
              dOnee.add({
                "dayName": localOperationalData[i]['dayName'],
                "timeSplitup": d
              });
            }

            print(dOnee);
            List dTwo = [];

            testOne.forEach((element) {
              for (int i = 0; i < da.length; i++) {
                if (da[i] == element) {
                  da.remove(element);
                }
              }
            });

            for (int i = 0; i < da.length; i++) {
              mapString[da[i]] = datumOne;
              dTwo.add({"dayName": da[i], "timeSplitup": d});
              // localOperationalData
              //     .add({"dayName": da[i], "timeSplitup": d});
              // storage.setItem("localOperationalData", localOperationalData);
            }

            List dThree = [];

            dOnee.forEach((element) {
              dThree.add(element);
            });
            dTwo.forEach((element) {
              dThree.add(element);
            });

            localOperationalData = dThree;
            print(localOperationalData);
            storage.setItem("localOperationalData", localOperationalData);
            setState(() {});
          }
          setState(() {});
          Navigator.pop(context);
          _globalWidget.toastMessage('Details updated successfully');
        } else if (allCheck == false) {
          if (checkSunday == true) {
            mapString['sunday'] = datumOne;
            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": mapString,
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);
            storage.setItem("postData", json);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("sunday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "sunday") {
                      localOperationalData[i] = {
                        "dayName": "sunday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "sunday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "sunday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (checkMonday == true) {
            mapString['monday'] = datumOne;
            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": mapString,
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);
            storage.setItem("postData", json);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("monday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "monday") {
                      localOperationalData[i] = {
                        "dayName": "monday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "monday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "monday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (checkTuesday == true) {
            mapString['tuesday'] = datumOne;
            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": mapString,
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);
            storage.setItem("postData", json);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("tuesday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "tuesday") {
                      localOperationalData[i] = {
                        "dayName": "tuesday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "tuesday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "tuesday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (checkWednesday == true) {
            mapString['wednesday'] = datumOne;
            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": mapString,
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);
            storage.setItem("postData", json);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("wednesday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "wednesday") {
                      localOperationalData[i] = {
                        "dayName": "wednesday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "wednesday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "wednesday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (checkThursday == true) {
            mapString['thursday'] = datumOne;
            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": mapString,
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);
            storage.setItem("postData", json);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("thursday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "thursday") {
                      localOperationalData[i] = {
                        "dayName": "thursday",
                        "timeSplitup": dropDownValue10
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "thursday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "thursday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (checkFriday == true) {
            mapString['friday'] = datumOne;
            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": mapString
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);
            storage.setItem("postData", json);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("friday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "friday") {
                      localOperationalData[i] = {
                        "dayName": "friday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "friday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "friday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }
          if (checkSaturday == true) {
            mapString['saturday'] = datumOne;
            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": mapString,
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);
            storage.setItem("postData", json);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("saturday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "saturday") {
                      localOperationalData[i] = {
                        "dayName": "saturday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "saturday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "saturday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (allCheck == false &&
              checkMonday == false &&
              checkThursday == false &&
              checkWednesday == false &&
              checkTuesday == false &&
              checkFriday == false &&
              checkSunday == false) {
            mapString[selectedDay] = datumOne;
            var json = jsonEncode({
              "professional_id": storage.getItem("vendor_id"),
              "settime": "true",
              "day": mapString,
            });
            print(json);
            var response =
                await VendorClassificationGet().updateOperationDetails(json);
            storage.setItem("postData", json);
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

          Navigator.pop(context);
        }
      } else if (localJson != null) {
        print("Data: " + localJson.toString());
        Map<String, dynamic> localJson1 = jsonDecode(localJson);

       

        if (allCheck == true) {
          setState(() {
            warning = false;
          });

          List da = [
            "monday",
            "tuesday",
            "wednesday",
            "thursday",
            "friday",
            "saturday",
          ];

          List testOne = [];
          List dOnee = [];
          for (int i = 0; i < da.length; i++) {
            mapString[da[i]] = datumOne;
          }
          var json = jsonEncode({
            "professional_id": storage.getItem("vendor_id"),
            "settime": "true",
            "day": mapString,
          });
          print(json);
          var response =
              await VendorClassificationGet().updateOperationDetails(json);
          storage.setItem("postData", json);

          for (int i = 0; i < localOperationalData.length; i++) {
            testOne.add(
              localOperationalData[i]['dayName'],
            );

            dOnee.add({
              "dayName": localOperationalData[i]['dayName'],
              "timeSplitup": d
            });
          }

          print(dOnee);
          List dTwo = [];

          testOne.forEach((element) {
            for (int i = 0; i < da.length; i++) {
              if (da[i] == element) {
                da.remove(element);
              }
            }
          });

          for (int i = 0; i < da.length; i++) {
            mapString[da[i]] = datumOne;
            dTwo.add({"dayName": da[i], "timeSplitup": d});
          }

          List dThree = [];

          dOnee.forEach((element) {
            dThree.add(element);
          });
          dTwo.forEach((element) {
            dThree.add(element);
          });

          localOperationalData = dThree;
          print(localOperationalData);
          storage.setItem("localOperationalData", localOperationalData);
          setState(() {});
Navigator.pop(context);

        } else if (allCheck == false) {
          if (checkSunday == true) {
            print(localJson1.runtimeType);
            localJson1['day']['sunday'] = datumOne;
            final js = jsonEncode(localJson1);
            var response = await VendorClassificationGet()
                .updateOperationDetails(js);
            storage.setItem("postData", js);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("sunday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "sunday") {
                      localOperationalData[i] = {
                        "dayName": "sunday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "sunday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "sunday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (checkMonday == true) {
            print(localJson1['day']['monday']);
            localJson1['day']['monday'] = datumOne;
            final js = jsonEncode(localJson1);
            var response = await VendorClassificationGet()
                .updateOperationDetails(js);
            storage.setItem("postData", js);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("monday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "monday") {
                      localOperationalData[i] = {
                        "dayName": "monday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "monday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "monday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (checkTuesday == true) {
            localJson1['day']['tuesday'] = datumOne;
            final js = jsonEncode(localJson1);
            var response =
                await VendorClassificationGet().updateOperationDetails(js);
            storage.setItem("postData", js);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("tuesday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "tuesday") {
                      localOperationalData[i] = {
                        "dayName": "tuesday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "tuesday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "tuesday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (checkWednesday == true) {
            localJson1['day']['wednesday'] = datumOne;
            final js = jsonEncode(localJson1);
            var response =
                await VendorClassificationGet().updateOperationDetails(js);
            storage.setItem("postData", js);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("wednesday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "wednesday") {
                      localOperationalData[i] = {
                        "dayName": "wednesday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "wednesday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "wednesday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (checkThursday == true) {
            localJson1['day']['thursday'] = datumOne;
            final js = jsonEncode(localJson1);
            var response =
                await VendorClassificationGet().updateOperationDetails(js);
            storage.setItem("postData", js);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("thursday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "thursday") {
                      localOperationalData[i] = {
                        "dayName": "thursday",
                        "timeSplitup": dropDownValue10
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "thursday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "thursday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (checkFriday == true) {
            localJson1['day']['friday'] = datumOne;
            final js = jsonEncode(localJson1);
            var response =
                await VendorClassificationGet().updateOperationDetails(js);
            storage.setItem("postData", js);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("friday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "friday") {
                      localOperationalData[i] = {
                        "dayName": "friday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "friday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "friday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (checkSaturday == true) {
            localJson1['day']['saturday'] = datumOne;
            final js = jsonEncode(localJson1);
            var response =
                await VendorClassificationGet().updateOperationDetails(js);
            storage.setItem("postData", js);
            if (response['status'] == 1) {
              if (localOperationalData.length != 0) {
                List testOne = [];
                localOperationalData.forEach((element) {
                  testOne.add(
                    element['dayName'],
                  );
                });
                if (testOne.contains("saturday")) {
                  for (int i = 0; i < localOperationalData.length; i++) {
                    if (localOperationalData[i]['dayName'] == "saturday") {
                      localOperationalData[i] = {
                        "dayName": "saturday",
                        "timeSplitup": d
                      };
                    }
                  }
                  storage.setItem("localOperationalData", localOperationalData);
                } else {
                  localOperationalData
                      .add({"dayName": "saturday", "timeSplitup": d});
                  storage.setItem("localOperationalData", localOperationalData);
                }
              } else {
                localOperationalData
                    .add({"dayName": "saturday", "timeSplitup": d});
                storage.setItem("localOperationalData", localOperationalData);
              }

              setState(() {});
              _globalWidget.toastMessage('Details updated successfully');
            } else {
              _globalWidget.toastMessage('Something went wrong');
            }
          }

          if (allCheck == false &&
              checkMonday == false &&
              checkThursday == false &&
              checkWednesday == false &&
              checkTuesday == false &&
              checkFriday == false &&
              checkSunday == false) {
            localJson1['day'][selectedDay] = datumOne;
            final js = jsonEncode(localJson1);
            var response =
                await VendorClassificationGet().updateOperationDetails(js);
            storage.setItem("postData", js);
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
          Navigator.pop(context);
        }
      }
    }

    //close
  }
}

calen(BuildContext context) async {
  DateTime newDateTime = await showRoundedDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(DateTime.now().year - 1),
    lastDate: DateTime(DateTime.now().year + 1),
    borderRadius: 16,
  );
  print(newDateTime);
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
