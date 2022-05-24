import 'dart:convert';
// import 'dart:ui';

// import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:trymd_partner/dashboard/dashboard.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
// import 'package:trymd_partner/operation_details/operational_details_widget.dart';
import 'package:trymd_partner/repository/auth.dart';
import 'package:trymd_partner/sizer.dart';

import '../global_widget/trymd_partner_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:email_validator/email_validator.dart';

class FDARegistrationScreen extends StatefulWidget {
  const FDARegistrationScreen({Key key}) : super(key: key);

  @override
  _FDARegistrationScreenState createState() => _FDARegistrationScreenState();
}

class _FDARegistrationScreenState extends State<FDARegistrationScreen> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  String dropDownValue1;
  TextEditingController fdaName = TextEditingController();
  TextEditingController fdaNumber = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  String dropDownValue2;
  String dropDownValue3;
  String showAvailableContent = "";
  String showAvailableContentTwo = "";
  String showAvailableContentThree = "";
  String showAvailableContentFour = "";
  String proYear = "";
  String _mySelection = "";
  List<dynamic> language = ['English', 'Tamil', 'Malayalam', 'Hindi'];
  String _mySelection1 = "";
  List<dynamic> education = ['UG', 'PG', 'Any Degree', '12th'];
  String _mySelection2 = "";
  List<dynamic> applanguage = ['English', 'Tamil', 'Malayalam', 'Hindi'];
  final LocalStorage storage = new LocalStorage('localstorage_app');
  final LocalStorage storage1 = new LocalStorage('');

  TextEditingController workExp = TextEditingController();
  TextEditingController textController5 = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onBackButtonPressed() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => DashboardScreen(),
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
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          DashboardScreen(),
                      transitionDuration: Duration(
                        seconds: 0,
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Color(0xFF0D0D0D),
                  size: 30,
                )),
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                34,
                0,
                0,
                0,
              ),
              child: Text(
                'FDA REGISTRATION',
                style: TrymdPartnerTheme.of(context).bodyText1.override(
                      fontFamily: 'geometric sans-serif',
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeVertical * 2.5,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: TrymdPartnerTheme.of(context).primaryBackground,
          body: Form(
            key: _form,
            child: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: TrymdPartnerTheme.of(context).tertiaryColor,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            10,
                            10,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 1,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'CONCEIRGE INFO',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 3,
                            SizeConfig.blockSizeHorizontal * 4,
                            0,
                          ),
                          child: TextFormField(
                            controller: fdaName,
                            obscureText: false,
                            validator: (val) {
                              if (val == null || val.length <= 3) {
                                return "Please provide valid name";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                  color: Color(
                                    0xFF000000,
                                  ),
                                  fontFamily: 'geometric sans-serif'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF1F4F7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF1F4F7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Color(
                                      0xFF000000,
                                    ),
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.6,
                                    useGoogleFonts: false),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 4,
                            0,
                          ),
                          child: TextFormField(
                            controller: fdaNumber,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(
                                10,
                              ),
                            ],
                            validator: (val) {
                              String pattern = r'(^[6789][0-9]{9}$)';
                              RegExp regExp = RegExp(pattern);

                              if (!regExp.hasMatch(val)) {
                                return "Please Enter a Valid mobile number";
                              } else if (val.isEmpty) {
                                return "Please provide a number";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              labelStyle: TextStyle(
                                  color: Color(
                                    0xFF000000,
                                  ),
                                  fontFamily: 'geometric sans-serif'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF1F4F7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF1F4F7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Color(
                                      0xFF000000,
                                    ),
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.6,
                                    useGoogleFonts: false),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 4,
                            0,
                          ),
                          child: TextFormField(
                            controller: textController3,
                            obscureText: false,
                            validator: (val) {
                              bool isValid = EmailValidator.validate(val);
                              print(isValid);
                              if (val == null || val.length == 0) {
                                return "Please provide mail id";
                              } else if (isValid == false) {
                                return "Please provide valid mail id";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Email id',
                              labelStyle: TextStyle(
                                  color: Color(
                                    0xFF000000,
                                  ),
                                  fontFamily: 'geometric sans-serif'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF1F4F7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF1F4F7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Color(
                                      0xFF000000,
                                    ),
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.6,
                                    useGoogleFonts: false),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 0,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 1,
                            0,
                          ),
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 93,
                            height: SizeConfig.blockSizeVertical * 7,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFF1F4F7),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 0.5,
                                SizeConfig.blockSizeVertical * 0,
                                SizeConfig.blockSizeHorizontal * 0,
                                SizeConfig.blockSizeVertical * 0,
                              ),
                              child: DropdownButtonFormField(
                                  dropdownColor: Colors.white,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconEnabledColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "Language Spoken",
                                    hintStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontFamily: 'geometric sans-serif',
                                        color: Color(0xFF000000)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(
                                          10.0,
                                        ),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  items: language.map((item) {
                                    return new DropdownMenuItem(
                                        child: new Text(item), value: item);
                                  }).toList(),
                                  onChanged: (newVal) {
                                    setState(() {
                                      _mySelection = newVal;
                                    });
                                  },
                                  style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      color: Color(0xFF0B2F45),
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.6)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 0,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 0.5,
                            0,
                          ),
                          child: Container(
                              width: SizeConfig.blockSizeHorizontal * 93,
                              height: SizeConfig.blockSizeVertical * 7,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFF1F4F7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 0.5,
                                  SizeConfig.blockSizeVertical * 0,
                                  SizeConfig.blockSizeHorizontal * 0,
                                  0,
                                ),
                                child: DropdownButtonFormField(
                                  dropdownColor: Colors.white,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconEnabledColor: Colors.black,
                                  style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      color: Color(0xFF0B2F45),
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.8),
                                  decoration: InputDecoration(
                                    hintText: "Educational Classification",
                                    hintStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontFamily: 'geometric sans-serif',
                                        color: Color(0xFF000000)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(
                                          10.0,
                                        ),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  items: education.map((item) {
                                    return new DropdownMenuItem(
                                        child: new Text(item), value: item);
                                  }).toList(),
                                  onChanged: (newVal) {
                                    setState(() {
                                      _mySelection1 = newVal;
                                    });
                                  },
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            10,
                            16,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 1,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'YOUR GENDER',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            SizeConfig.blockSizeVertical * 2,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (showAvailableContentTwo.length == 0 ||
                                        showAvailableContentTwo != "male") {
                                      showAvailableContentTwo = "male";
                                    } else if (showAvailableContentTwo ==
                                        "male") {
                                      showAvailableContentTwo = "";
                                    }
                                  });
                                },
                                child: Container(
                                  width: SizeConfig.blockSizeHorizontal * 44,
                                  height: SizeConfig.blockSizeVertical * 6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(56),
                                    border: Border.all(
                                      // color: Color(0xFF3F8BFD),
                                      color: showAvailableContentTwo == "male"
                                          ? Color(0xFF3F8BFD)
                                          : Color(0xFFE5E5E5),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 3,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image.asset(
                                          showAvailableContentTwo == "male"
                                              ? 'assets/images/male.png'
                                              : 'assets/images/neg2.png',
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  7,
                                          height: SizeConfig.blockSizeVertical *
                                              3.5,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            SizeConfig.blockSizeHorizontal * 2,
                                            0,
                                            0,
                                            0,
                                          ),
                                          child: Text(
                                            'Male',
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                    fontFamily:
                                                        'geometric sans-serif',
                                                    color: Color(
                                                      0xFF000000,
                                                    ),
                                                    fontSize: SizeConfig
                                                            .blockSizeVertical *
                                                        1.9,
                                                    fontWeight:
                                                        showAvailableContentTwo ==
                                                                "male"
                                                            ? FontWeight.bold
                                                            : FontWeight.normal,
                                                    useGoogleFonts: false),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 3,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Row(children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (showAvailableContentTwo.length ==
                                                  0 ||
                                              showAvailableContentTwo !=
                                                  "female") {
                                            showAvailableContentTwo = "female";
                                          } else if (showAvailableContentTwo ==
                                              "female") {
                                            showAvailableContentTwo = "";
                                          }
                                        });
                                      },
                                      child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 44,
                                        height:
                                            SizeConfig.blockSizeVertical * 6,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(56),
                                          border: Border.all(
                                            color: showAvailableContentTwo ==
                                                    "female"
                                                ? Color(0xFF3F8BFD)
                                                : Color(0xFFE5E5E5),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            SizeConfig.blockSizeHorizontal * 3,
                                            0,
                                            0,
                                            0,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Image.asset(
                                                showAvailableContentTwo ==
                                                        "female"
                                                    ? 'assets/images/female.png'
                                                    : 'assets/images/neg1.png',
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    7,
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    3.5,
                                                fit: BoxFit.cover,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      2,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                                child: Text(
                                                  'Female',
                                                  style: TrymdPartnerTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                          fontFamily:
                                                              'geometric sans-serif',
                                                          color: Color(
                                                            0xFF000000,
                                                          ),
                                                          fontSize: SizeConfig
                                                                  .blockSizeVertical *
                                                              1.9,
                                                          fontWeight:
                                                              showAvailableContentTwo ==
                                                                      "female"
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal,
                                                          useGoogleFonts:
                                                              false),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 0,
                            SizeConfig.blockSizeVertical * 1.5,
                            SizeConfig.blockSizeHorizontal * 1,
                            0,
                          ),
                          child: Container(
                              width: SizeConfig.blockSizeHorizontal * 93,
                              height: SizeConfig.blockSizeVertical * 7,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFF1F4F7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 0.6,
                                  SizeConfig.blockSizeVertical * 0,
                                  SizeConfig.blockSizeHorizontal * 0,
                                  0,
                                ),
                                child: DropdownButtonFormField(
                                  dropdownColor: Colors.white,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconEnabledColor: Colors.black,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Select app language",
                                    hintStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontFamily: 'geometric sans-serif',
                                        color: Color(0xFF000000)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(
                                          10.0,
                                        ),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  items: applanguage.map((item) {
                                    return new DropdownMenuItem(
                                        child: new Text(item), value: item);
                                  }).toList(),
                                  onChanged: (newVal) {
                                    setState(() {
                                      _mySelection2 = newVal;
                                    });
                                  },
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            10,
                            16,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 1,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'ACTIVE STATUS',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 4,
                            SizeConfig.blockSizeVertical * 2,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 0,
                                  SizeConfig.blockSizeHorizontal * 2,
                                  0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (showAvailableContentThree.length ==
                                              0 ||
                                          showAvailableContentThree != "Yes") {
                                        showAvailableContentThree = "Yes";
                                      } else if (showAvailableContentThree ==
                                          "Yes") {
                                        showAvailableContentThree = "";
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: SizeConfig.blockSizeVertical * 2,
                                    height: SizeConfig.blockSizeVertical * 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        // color: Color(0xFF3F8BFD),
                                        color:
                                            showAvailableContentThree == "Yes"
                                                ? Color(0xFF3F8BFD)
                                                : Color(0xFFE5E5E5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  SizeConfig.blockSizeHorizontal * 20,
                                  0,
                                ),
                                child: Text(
                                  'YES',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.7,
                                        fontWeight:
                                            showAvailableContentThree == "Yes"
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 0,
                                  SizeConfig.blockSizeHorizontal * 2,
                                  0,
                                ),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (showAvailableContentThree.length ==
                                                0 ||
                                            showAvailableContentThree != "No") {
                                          showAvailableContentThree = "No";
                                        } else if (showAvailableContentThree ==
                                            "No") {
                                          showAvailableContentThree = "";
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: SizeConfig.blockSizeVertical * 2,
                                      height: SizeConfig.blockSizeVertical * 2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          // color: Color(0xFF3F8BFD),
                                          color:
                                              showAvailableContentThree == "No"
                                                  ? Color(0xFF3F8BFD)
                                                  : Color(0xFFE5E5E5),
                                        ),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 0,
                                  0,
                                  SizeConfig.blockSizeHorizontal * 14,
                                  0,
                                ),
                                child: Text(
                                  'NO',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.7,
                                        fontWeight:
                                            showAvailableContentThree == "No"
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 3,
                            SizeConfig.blockSizeHorizontal * 4,
                            0,
                          ),
                          child: TextFormField(
                            controller: workExp,
                            obscureText: false,
                            validator: (val) {
                              if (val.length == 0 || val == null) {
                                return "Please select work Experience";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Work Experience*',
                              labelStyle: TextStyle(
                                  color: Color(
                                    0xFF000000,
                                  ),
                                  fontFamily: 'geometric sans-serif'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF1F4F7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF1F4F7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Color(
                                      0xFF000000,
                                    ),
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.6,
                                    useGoogleFonts: false),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 03,
                            10,
                            SizeConfig.blockSizeHorizontal * 14,
                            0,
                          ),
                          child: Row(children: [
                            Text(
                              'Employee Start year',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 2,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                        ),
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
                              SizeConfig.blockSizeVertical * 1,
                              SizeConfig.blockSizeHorizontal * 4,
                              0,
                            ),
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 7,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color(0xFFF1F4F7),
                                  width: 1,
                                ),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  DateTime pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(
                                        1000,
                                      ),
                                      lastDate: DateTime(4000));
                                  if (pickedDate != null) {
                                    print(pickedDate);
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);
                                    print(formattedDate);

                                    setState(() {
                                      proYear = formattedDate;
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      proYear,
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Color(
                                          0xFF000000,
                                        ),
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.black,
                                      size: SizeConfig.blockSizeVertical * 3,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 75,
                            SizeConfig.blockSizeVertical * 5,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (_form.currentState.validate()) {
                                    if (_mySelection1.length == 0) {
                                      _globalWidget.toastMessage(
                                          'Please select educational qualification');
                                    } else if (showAvailableContentTwo.length ==
                                        0) {
                                      _globalWidget
                                          .toastMessage('Please select gender');
                                    } else if (showAvailableContentThree
                                            .length ==
                                        0) {
                                      _globalWidget.toastMessage(
                                          'Please select active status');
                                    } else {
                                      finishFDA();
                                    }
                                  }
                                },
                                child: Text(
                                  'NEXT',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  10,
                                  0,
                                  0,
                                  0,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    if (_form.currentState.validate()) {
                                      if (_mySelection1.length == 0) {
                                        _globalWidget.toastMessage(
                                            'Please select educational qualification');
                                      } else if (showAvailableContentTwo
                                              .length ==
                                          0) {
                                        _globalWidget.toastMessage(
                                            'Please select gender');
                                      } else if (showAvailableContentThree
                                              .length ==
                                          0) {
                                        _globalWidget.toastMessage(
                                            'Please select active status');
                                      } else {
                                        finishFDA();
                                      }
                                    }
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.longArrowAltRight,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
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
        ),
      );
    });
  }

  finishFDA() async {
    var jsonBody = json.encode({
      "professional_id": storage.getItem('vendor_id'),
      "fda_mobile_number": fdaNumber.text,
      "fda_name": fdaName.text,
      "fda_email": textController3.text,
      "languages_spoken": _mySelection,
      "educational_classification": _mySelection1,
      "fda_gender": showAvailableContentTwo,
      "app_language_preference": _mySelection2,
      "active_status": showAvailableContentThree,
      "work_experience": workExp.text,
      "employment_start_year": proYear,
      "daily_working_hours": "",
      "week_off_day": ""
    });
    var response = await Authentications().registrationFDA(jsonBody);

    if (response['status'] == 1) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => DashboardScreen(),
          transitionDuration: Duration(
            seconds: 0,
          ),
        ),
      );
    } else {
      _globalWidget.toastMessage(response['message']);
    }
  }
}
