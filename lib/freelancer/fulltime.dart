// import 'dart:convert';
import 'dart:io';

// import 'package:date_field/date_field.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
// import '../global_widget/flutter_flow_google_map.dart';

import 'package:trymd_partner/category_select/category_selection.dart';
import 'package:trymd_partner/dashboard/dashboard.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/global_widget/trymd_partner_google_map.dart';
// import 'package:trymd_partner/freelancer/home.dart';
// import 'package:trymd_partner/freelancer/location.dart';
// import 'package:trymd_partner/freelancer/location.dart';
import 'package:trymd_partner/repository/vendorupdate.dart';
import '../global_widget/trymd_partner_theme.dart';
// import '../get_started/get_started_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../sizer.dart';
import 'package:email_validator/email_validator.dart';

// import 'home.dart';

class FullTimeWidget extends StatefulWidget {
  const FullTimeWidget({Key key}) : super(key: key);

  @override
  _FullTimeWidgetState createState() => _FullTimeWidgetState();
}

class _FullTimeWidgetState extends State<FullTimeWidget> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  final LocalStorage storage = new LocalStorage('localstorage_app');
  final LocalStorage storage1 = new LocalStorage('');
  TextEditingController proname;
  TextEditingController textController2;
  TextEditingController descriptions;
  TextEditingController textController4;
  TextEditingController email;
  TextEditingController conNumber;
  TextEditingController textController7;
  TextEditingController textController8;
  TextEditingController textController9;
  TextEditingController textController10;
  // TabController _tabController;
  int tabIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String showAvailableContent = "1";
  String showAvailableContentTwo = "";
  // final _formFreelancer = GlobalKey<FormState>();
  final _formFulltime = GlobalKey<FormState>();
  String proYear = "Professional work strat year";
  String imageString = "";
  final picker = ImagePicker();
  Future<XFile> pickedFile = Future.value(null);
  String imageFullpath = "";
  List vendorList = [];
  String selectedvendorName = "";
  String selectedVendorNumber = "";

  @override
  void initState() {
    super.initState();
    proname = TextEditingController();
    textController2 = TextEditingController();
    descriptions = TextEditingController();
    textController4 = TextEditingController();
    email = TextEditingController();
    conNumber = TextEditingController();
    textController7 = TextEditingController();
    textController8 = TextEditingController();
    textController9 = TextEditingController();
    textController10 = TextEditingController();
    conNumber.text = storage.getItem("mobile_number");

    String data = storage.getItem('vendor_name');
    if (data != null) {
      selectedvendorName = storage.getItem('vendor_name');
      selectedVendorNumber = storage.getItem('vendor_number');
      proname.text = storage.getItem('professional_name');
      showAvailableContentTwo = storage.getItem('professional_gender');
      descriptions.text = storage.getItem('professional_description');
      textController4.text = storage.getItem('professional_year');
      email.text = storage.getItem('professional_email');
      imageFullpath = storage.getItem('image');
    }

    getVendorName();
  }

  // DateTime preBackPress = DateTime.now();
  // Future<bool> _onBackButtonPressed() async {
  //   final timegap = DateTime.now().difference(preBackPress);
  //   final cantExit = timegap >= Duration(seconds: 2);
  //   preBackPress = DateTime.now();
  //   if (cantExit) {
  //     //show snackbar
  //     final snack = SnackBar(
  //       content: Text('Press Back again to Exit'),
  //       duration: Duration(seconds: 2),
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(snack);
  //     return false;
  //   } else {
  //     SystemNavigator.pop();
  //     return true;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return WillPopScope(
        // onWillPop: _onBackButtonPressed,
        child: DefaultTabController(
          length: 2,
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
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  0,
                  0,
                  0,
                  0,
                ),
                child: Text(
                  'Professional',
                  style: TrymdPartnerTheme.of(context).bodyText1.override(
                        fontFamily: 'geometric sans-serif',
                        color: Color(
                          0xFF000000,
                        ),
                        fontSize: SizeConfig.blockSizeVertical * 3,
                        fontWeight: FontWeight.w700,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              actions: [],
              centerTitle: true,
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
                            SizeConfig.blockSizeHorizontal * 2,
                            SizeConfig.blockSizeVertical * 2,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 3,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'Your role',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'geometric sans-serif',
                                        color: Color(
                                          0xFF000000,
                                        ),
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
                        (Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 2,
                            0,
                            SizeConfig.blockSizeHorizontal * 0,
                            0,
                          ),
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 5,
                            width: SizeConfig.blockSizeHorizontal * 40,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(56),
                              border: Border.all(
                                color: Color(0XFFE5E5E5),
                              ),
                              gradient: LinearGradient(
                                colors: [Color(0xFF2BA4F9), Color(0xFF07D0F2)],

                                stops: [0, 1],
                                begin: AlignmentDirectional(0.94, -1),
                                end: AlignmentDirectional(-0.94, 1),
                                // color: tabIndex == 1
                                //     ? Color.fromRGBO(63, 139, 253, 1)
                                //     : Color.fromRGBO(231, 232, 237, 0,),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Full-Time",
                                maxLines: 1,
                                //textAlign: TextAlign.center,
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.white,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.8,
                                      fontWeight: FontWeight.w700,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        )),
                        Form(
                          key: _formFulltime,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 0,
                                SizeConfig.blockSizeVertical * 0,
                                0,
                                SizeConfig.blockSizeVertical * 1),
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 2,
                                  SizeConfig.blockSizeVertical * 0,
                                  0,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 3,
                                        5,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Vendor Name',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'geometric sans-serif',
                                              color: Color(
                                                0xFF000000,
                                              ),
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              fontWeight: FontWeight.w700,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 10,
                                  SizeConfig.blockSizeVertical * 2,
                                  0,
                                  0,
                                ),
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              // if (showAvailableContent.length == 0 ||
                                              //     showAvailableContent != "1") {
                                              //   showAvailableContent = "1";
                                              // } else if (showAvailableContent == "1") {
                                              //   showAvailableContent = "";
                                              // }
                                            });
                                          },
                                          child: Container(
                                            width: 16,
                                            height: 16,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(
                                                color:
                                                    showAvailableContent == "1"
                                                        ? Color(0xFF3F8BFD)
                                                        : Color(0xFFE5E5E5),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 1,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Single vendor',
                                          textAlign: TextAlign.center,
                                          style: TrymdPartnerTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    'geometric sans-serif',
                                                color: Colors.black,
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    1.6,
                                                fontWeight: FontWeight.w700,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 3,
                                  SizeConfig.blockSizeVertical * 1.9,
                                  SizeConfig.blockSizeHorizontal * 3,
                                  0,
                                ),
                                child: Container(
                                  height: SizeConfig.blockSizeVertical * 8,
                                  width: SizeConfig.blockSizeHorizontal * 95,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0XFFE5E5E5),
                                      width: 1.0,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: DropdownButtonFormField(
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(
                                              10.0,
                                            ),
                                          ),
                                          // borderSide:
                                          //     BorderSide(color: Color(0xFFF1F5F7), width: 1.0,),
                                        ),
                                      ),
                                      value: selectedvendorName,
                                      items: vendorList.map((item) {
                                        return new DropdownMenuItem(
                                          child: new Text(item['vendor_name'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      'geometric sans-serif',
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      2)),
                                          value: item['vendor_name'].toString(),
                                        );
                                      }).toList(),
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconEnabledColor: Colors.black,
                                      isExpanded: true,
                                      onChanged: (newVal) {
                                        setState(() {
                                          selectedvendorName = newVal;
                                          vendorList.forEach((element) {
                                            if (element['vendor_name'] ==
                                                selectedvendorName) {
                                              selectedVendorNumber =
                                                  element['vendor_number'];
                                            }
                                          });
                                          print(selectedVendorNumber);
                                        });
                                      },
                                      // value: selectedvendorName,
                                      style: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(0xFF0B2F45),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  2)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 2,
                                  SizeConfig.blockSizeVertical * 1.5,
                                  0,
                                  SizeConfig.blockSizeVertical * 0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 3,
                                        0,
                                        0,
                                        SizeConfig.blockSizeVertical * 0,
                                      ),
                                      child: Text(
                                        'About you',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'geometric sans-serif',
                                              color: Color(
                                                0xFF000000,
                                              ),
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              fontWeight: FontWeight.w700,
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
                                  SizeConfig.blockSizeVertical * 1.5,
                                  SizeConfig.blockSizeHorizontal * 3,
                                  0,
                                ),
                                child: TextFormField(
                                  controller: proname,
                                  validator: (val) {
                                    if (val == null || val.length == 0) {
                                      return "please provide name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 2),
                                    labelText: 'Professional Name',
                                    labelStyle:
                                        TextStyle(color: Color(0xFF000000)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFE5E5E5),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFE5E5E5),
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
                                        lineHeight: 0.5,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        fontWeight: FontWeight.w400,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 2,
                                  SizeConfig.blockSizeVertical * 1.5,
                                  0,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 3,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Your gender',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'geometric sans-serif',
                                              color: Color(
                                                0xFF000000,
                                              ),
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              fontWeight: FontWeight.w700,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 1.5,
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
                                            if (showAvailableContentTwo
                                                        .length ==
                                                    0 ||
                                                showAvailableContentTwo !=
                                                    "male") {
                                              showAvailableContentTwo = "male";
                                            } else if (showAvailableContentTwo ==
                                                "male") {
                                              showAvailableContentTwo = "";
                                            }
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            SizeConfig.blockSizeHorizontal * 0,
                                            0,
                                            SizeConfig.blockSizeHorizontal * 3,
                                            0,
                                          ),
                                          child: Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    44,
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    6,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(56),
                                              border: Border.all(
                                                // color: Color(0xFF3F8BFD),
                                                color:
                                                    showAvailableContentTwo ==
                                                            "male"
                                                        ? Color(0xFF3F8BFD)
                                                        : Color(0XFFE5E5E5),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                SizeConfig.blockSizeHorizontal *
                                                    3,
                                                0,
                                                0,
                                                0,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Image.asset(
                                                    showAvailableContentTwo ==
                                                            "male"
                                                        ? 'assets/images/male.png'
                                                        : 'assets/images/neg2.png',
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        7,
                                                    height: SizeConfig
                                                            .blockSizeVertical *
                                                        3.5,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                      SizeConfig
                                                              .blockSizeHorizontal *
                                                          2,
                                                      0,
                                                      0,
                                                      0,
                                                    ),
                                                    child: Text(
                                                      'Male',
                                                      style:
                                                          TrymdPartnerTheme.of(
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
                                                                    1.8,
                                                                fontWeight: showAvailableContentTwo ==
                                                                        "male"
                                                                    ? FontWeight
                                                                        .w700
                                                                    : FontWeight
                                                                        .w400,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
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
                                                if (showAvailableContentTwo
                                                            .length ==
                                                        0 ||
                                                    showAvailableContentTwo !=
                                                        "female") {
                                                  showAvailableContentTwo =
                                                      "female";
                                                } else if (showAvailableContentTwo ==
                                                    "female") {
                                                  showAvailableContentTwo = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  44,
                                              height:
                                                  SizeConfig.blockSizeVertical *
                                                      6,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(56),
                                                border: Border.all(
                                                  color:
                                                      showAvailableContentTwo ==
                                                              "female"
                                                          ? Color(0xFF3F8BFD)
                                                          : Color(0XFFE5E5E5),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      3,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                        SizeConfig
                                                                .blockSizeHorizontal *
                                                            1.8,
                                                        0,
                                                        0,
                                                        0,
                                                      ),
                                                      child: Text(
                                                        'Female',
                                                        style: TrymdPartnerTheme
                                                                .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'geometric sans-serif',
                                                              color: Color(
                                                                0xFF000000,
                                                              ),
                                                              fontSize: SizeConfig
                                                                      .blockSizeVertical *
                                                                  1.8,
                                                              fontWeight:
                                                                  showAvailableContentTwo ==
                                                                          "female"
                                                                      ? FontWeight
                                                                          .w700
                                                                      : FontWeight
                                                                          .w400,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
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
                                  SizeConfig.blockSizeHorizontal * 3,
                                  SizeConfig.blockSizeVertical * 1.5,
                                  SizeConfig.blockSizeHorizontal * 4,
                                  0,
                                ),
                                child: TextFormField(
                                  maxLines: 5,
                                  controller: descriptions,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Description',
                                    labelStyle:
                                        TextStyle(color: Color(0xFF000000)),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            SizeConfig.blockSizeHorizontal * 3,
                                            0,
                                            0,
                                            SizeConfig.blockSizeVertical * 2),
                                    suffixIcon: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 0,
                                          0,
                                          0,
                                          SizeConfig.blockSizeVertical * 5),
                                      child: Icon(
                                        Icons.info_outline,
                                        color: Color(0xFFC1C1C1),
                                        size: 22,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFE5E5E5),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFE5E5E5),
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
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          useGoogleFonts: false),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 3,
                                  SizeConfig.blockSizeVertical * 1.5,
                                  SizeConfig.blockSizeHorizontal * 0,
                                  0,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 0,
                                    SizeConfig.blockSizeVertical * 0,
                                    SizeConfig.blockSizeHorizontal * 4,
                                    0,
                                  ),
                                  child: TextFormField(
                                    controller: textController4,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Professional work start year',
                                      labelStyle:
                                          TextStyle(color: Color(0xFF000000)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0XFFE5E5E5),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      suffixIcon: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 3,
                                          SizeConfig.blockSizeVertical * 1.5,
                                          0,
                                          0,
                                        ),
                                        child: FaIcon(
                                          FontAwesomeIcons.calendar,
                                          color: Color(0xFFC1C1C1),
                                          size: 22,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0XFFE5E5E5),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.8,
                                    ),
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime pickedDate =
                                          await showDatePicker(
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
                                          textController4.text = formattedDate;
                                        });
                                      } else {
                                        print("Date is not selected");
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 2,
                                  SizeConfig.blockSizeVertical * 1.5,
                                  0,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 3,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Image',
                                        textAlign: TextAlign.start,
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
                                                    2,
                                                fontWeight: FontWeight.w700,
                                                useGoogleFonts: false),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 1,
                                        SizeConfig.blockSizeVertical * 0.3,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        '(240 px X 1080 px)',
                                        textAlign: TextAlign.start,
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
                                                    1.6,
                                                fontWeight: FontWeight.w400,
                                                useGoogleFonts: false),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 1,
                                          SizeConfig.blockSizeVertical * 1.5,
                                          0,
                                          0,
                                        ),
                                        child: FutureBuilder<XFile>(
                                          future: pickedFile,
                                          builder: (context, snap) {
                                            if (snap.hasData) {
                                              imageFullpath = snap.data.path;
                                              var s = File(snap.data.path);
                                              var idx = s.toString().split("/");
                                              int dd = idx.length;
                                              imageString = idx[dd - 1]
                                                  .replaceAll("'", "");
                                              return Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    35,
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    13,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.file(
                                                  File(snap.data.path),
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            }
                                            return Container(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  35,
                                              height:
                                                  SizeConfig.blockSizeVertical *
                                                      13,
                                              // height: SizeConfig.blockSizeVertical * 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: imageFullpath.length == 0
                                                  ? Image.asset(
                                                      'assets/images/User.png',
                                                      fit: BoxFit.contain,
                                                    )
                                                  : Image.file(
                                                      File(imageFullpath),
                                                      fit: BoxFit.cover,
                                                    ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          100,
                                          70,
                                          0,
                                          0,
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2,
                                          shape: const CircleBorder(),
                                          child: Container(
                                            width: 28,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                1,
                                                1,
                                                0,
                                                0,
                                              ),
                                              child: InkWell(
                                                onTap: () => getgallery(),
                                                child: Icon(
                                                  Icons.photo_camera_outlined,
                                                  color: Color(0xF2080808),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ]),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 2,
                                  SizeConfig.blockSizeVertical * 1.5,
                                  0,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 3,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Contact details',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'geometric sans-serif',
                                              color: Color(
                                                0xFF000000,
                                              ),
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              fontWeight: FontWeight.w700,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 4,
                                  SizeConfig.blockSizeVertical * 1.5,
                                  SizeConfig.blockSizeHorizontal * 4,
                                  0,
                                ),
                                child: TextFormField(
                                  controller: email,
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
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email ID',
                                    labelStyle: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.7,
                                          fontWeight: FontWeight.w400,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFE5E5E5),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFE5E5E5),
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
                                        lineHeight: 0.5,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 4,
                                  SizeConfig.blockSizeVertical * 1.5,
                                  SizeConfig.blockSizeHorizontal * 4,
                                  0,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: conNumber,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Contact Number',
                                    labelStyle: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.7,
                                          fontWeight: FontWeight.w400,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFE5E5E5),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFE5E5E5),
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
                                        lineHeight: 0.5,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              10,
                              0,
                              0,
                            ),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0XFFFFFFFF),
                              ),
                            )),
                        // Padding(
                        //     padding: EdgeInsetsDirectional.fromSTEB(
                        //         SizeConfig.blockSizeHorizontal * 75,
                        //         SizeConfig.blockSizeVertical * 0,
                        //         0,
                        //         0,),
                        //     child: TextButton(
                        //         onPressed: () {
                        //           if (_formFulltime.currentState
                        //               .validate()) {
                        //             updateProfessionalInfo();
                        //           }
                        //         },
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.end,
                        //           children: [
                        //             Text(
                        //               'NEXT',
                        //               style: TrymdPartnerTheme.of(context)
                        //                   .bodyText1
                        //                   .override(
                        //                     fontFamily:
                        //                         'geometric sans-serif',
                        //                     color: Color(0xFF000000,),
                        //                     fontSize: SizeConfig
                        //                             .blockSizeVertical *
                        //                         2.5,
                        //                     fontWeight: FontWeight.w700,
                        //                     useGoogleFonts: false,
                        //                   ),
                        //             ),
                        //             SizedBox(width: 10,),
                        //             FaIcon(
                        //               FontAwesomeIcons.longArrowAltRight,
                        //               color: Color(0xFF000000,),
                        //               size: SizeConfig.blockSizeVertical *
                        //                   2.5,
                        //             ),
                        //           ],
                        //         ),),),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 8,
                        )
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

  void getgallery() async {
    try {
      pickedFile = picker.pickImage(source: ImageSource.gallery);
      // pickedFile = picker.getImage(
      //   source: ImageSource.gallery,
      // );

      setState(() {});
    } catch (e) {
      return e;
    }
  }

  getVendorName() async {
    var nameResponse = await VendorClassificationGet().getVendorNames();
    if (nameResponse['status'] == 1) {
      vendorList = nameResponse['data'];
      setState(() {
        selectedvendorName = vendorList[0]['vendor_name'];
      });
    }
  }

  updateProfessionalInfo() async {
    if (tabIndex == 1) {
      if (_formFulltime.currentState.validate()) {
        if (showAvailableContentTwo.length == 0) {
          _globalWidget.toastMessage('Please select your gender');
        } else if (selectedvendorName.length == 0) {
          _globalWidget.toastMessage('Please select vendor name');
        } else if (proYear.length == 0) {
          _globalWidget.toastMessage('Please select work start year');
        } else {
          var jsonBody = ({
            "professional_type": "fulltime",
            "vendor_name": selectedvendorName,
            "vendor_number": selectedVendorNumber,
            "professional_id": storage.getItem('vendor_id'),
            "professional_name": proname.text,
            "professional_gender": showAvailableContentTwo,
            "professional_description": descriptions.text,
            "professional_year": proYear,
            "professional_image": imageString,
            "professional_email": email.text,
            "professional_mobile": storage.getItem('mobile_number'),
            "user_type": "professional"
          });
          print(jsonBody);
          var response =
              await VendorClassificationGet().updateProfileInfo(jsonBody);
          print(response);
          if (response['status'] == 1) {
            storage.setItem('vendor_name', selectedvendorName);
            storage.setItem('vendor_number', selectedVendorNumber);
            storage.setItem('professional_name', proname.text);
            storage.setItem('professional_gender', showAvailableContentTwo);
            storage.setItem('professional_description', descriptions.text);
            storage.setItem('professional_year', textController4.text);
            storage.setItem('professional_email', email.text);
            if (imageFullpath.length != 0) {
              storage.setItem('image', imageFullpath);
            } else {
              storage.setItem('image', "");
            }

            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    CategorySelectionWidget(
                  vendorType: "professional",
                ),
                transitionDuration: Duration(
                  seconds: 0,
                ),
              ),
            );
          } else {
            _globalWidget.toastMessage('Could not update');
          }
        }
      }
    }
  }
}
