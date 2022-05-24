import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:trymd_partner/auth_screens/registration/registration_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trymd_partner/fda_screens/fda_login.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/global_widget/trymd_partner_theme.dart';
import '../sizer.dart';

class GetStartedWidget extends StatefulWidget {
  const GetStartedWidget({Key key}) : super(key: key);

  @override
  _GetStartedWidgetState createState() => _GetStartedWidgetState();
}

class _GetStartedWidgetState extends State<GetStartedWidget> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final LocalStorage storage = new LocalStorage('localstorage_app');
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String showAvailableContent = "";

  DateTime preBackPress = DateTime.now();

  Future<bool> _onBackButtonPressed() async {
    final timegap = DateTime.now().difference(preBackPress);
    final cantExit = timegap >= Duration(seconds: 2);
    preBackPress = DateTime.now();
    if (cantExit) {
      //show snackbar
      final snack = SnackBar(
        content: Text('Press Back again to Exit'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }

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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          backgroundColor: Color(0xFFF5F5F5),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 0,
                      SizeConfig.blockSizeVertical * 0,
                      0,
                      SizeConfig.blockSizeVertical * 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          SizeConfig.blockSizeHorizontal * 2,
                          SizeConfig.blockSizeVertical * 10,
                          0,
                          0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 8.5,
                                SizeConfig.blockSizeVertical * 2,
                                0,
                                0,
                              ),
                              child: Text(
                                'Get Started',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'geometric sans-serif',
                                      color: Color(
                                        0xFF000000,
                                      ),
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 4,
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
                          SizeConfig.blockSizeHorizontal * 11,
                          SizeConfig.blockSizeVertical * 1,
                          0,
                          0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Start by choosing your Role',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Color(
                                      0xFF000000,
                                    ),
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.5,
                                    fontWeight: FontWeight.w700,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ],
                        ),
                      ),

                      //Professional Container **************************************
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            right: SizeConfig.blockSizeHorizontal * 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (showAvailableContent !=
                                        "professional") {
                                      showAvailableContent = "professional";
                                    } else if (showAvailableContent ==
                                        "professional") {
                                      showAvailableContent = "";
                                    }
                                  });

                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              RegistrationScreen(
                                        userType: "professional",
                                      ),
                                      transitionDuration: Duration(
                                        seconds: 0,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeVertical * 1.4,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Material(
                                        color: Colors.grey,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Container(
                                          // width: 325,
                                          // height: 145,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  85,
                                          height:
                                              SizeConfig.blockSizeVertical * 20,
                                          decoration: BoxDecoration(
                                            // color:Color(0xFFF1F4F7),
                                            gradient: LinearGradient(
                                              colors: showAvailableContent ==
                                                      "professional"
                                                  ? [
                                                      Color(0xFF0085FF),
                                                      Color(0xFF07D0F2)
                                                    ]
                                                  : [
                                                      Color(0xFFF1F4F7),
                                                      Color(0xFFF1F4F7)
                                                    ],
                                              stops: [0, 1],
                                              begin: AlignmentDirectional(1, 1),
                                              end: AlignmentDirectional(
                                                0,
                                                0,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      5,
                                                  SizeConfig.blockSizeVertical *
                                                      2.5,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  // mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    FaIcon(
                                                      FontAwesomeIcons.userAlt,
                                                      color:
                                                          showAvailableContent ==
                                                                  "professional"
                                                              ? Colors.white
                                                              : Color(
                                                                  0xFF000000,
                                                                ),
                                                      size: SizeConfig
                                                              .blockSizeVertical *
                                                          3,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      4.3,
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'INDIVIDUAL',
                                                      style: TrymdPartnerTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'geometric sans-serif',
                                                            color: showAvailableContent ==
                                                                    "professional"
                                                                ? Colors.white
                                                                : Color(
                                                                    0xFF000000,
                                                                  ),
                                                            fontSize: SizeConfig
                                                                    .blockSizeVertical *
                                                                2.5,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      4.3,
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'I’m earns a living from a specified ',
                                                      style: TrymdPartnerTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'geometric sans-serif',
                                                            color: showAvailableContent ==
                                                                    "professional"
                                                                ? Colors.white
                                                                : Color(
                                                                    0xFF000000,
                                                                  ),
                                                            fontSize: SizeConfig
                                                                    .blockSizeVertical *
                                                                1.8,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      4.3,
                                                  SizeConfig.blockSizeVertical *
                                                      0.5,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Professional activity',
                                                      style: TrymdPartnerTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'geometric sans-serif',
                                                            color: showAvailableContent ==
                                                                    "professional"
                                                                ? Colors.white
                                                                : Color(
                                                                    0xFF000000,
                                                                  ),
                                                            fontSize: SizeConfig
                                                                    .blockSizeVertical *
                                                                1.8,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

                      // VENDOR CONTAINER *********************************************************************
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 3,
                            right: SizeConfig.blockSizeHorizontal * 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (showAvailableContent != "vendor") {
                                      showAvailableContent = "vendor";
                                    } else if (showAvailableContent ==
                                        "vendor") {
                                      showAvailableContent = "";
                                    }
                                  });
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              RegistrationScreen(
                                                  userType: "vendor"),
                                      transitionDuration: Duration(
                                        seconds: 0,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeVertical * 1.4,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Material(
                                        color: Color(0xFFF1F4F7),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Container(
                                          // width: 325,
                                          // height: 145,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  85,
                                          height:
                                              SizeConfig.blockSizeVertical * 20,
                                          decoration: BoxDecoration(
                                            // color:Color(0xFFF1F4F7),
                                            gradient: LinearGradient(
                                              colors: showAvailableContent ==
                                                      "vendor"
                                                  ? [
                                                      Color(0xFF0085FF),
                                                      Color(0xFF07D0F2)
                                                    ]
                                                  : [
                                                      Color(0xFFF1F4F7),
                                                      Color(0xFFF1F4F7)
                                                    ],
                                              stops: [0, 1],
                                              begin: AlignmentDirectional(1, 1),
                                              end: AlignmentDirectional(
                                                0,
                                                0,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      5,
                                                  SizeConfig.blockSizeVertical *
                                                      2.5,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  // mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    FaIcon(
                                                      FontAwesomeIcons.users,
                                                      color:
                                                          showAvailableContent ==
                                                                  "vendor"
                                                              ? Colors.white
                                                              : Color(
                                                                  0XFF000000,
                                                                ),
                                                      size: 24,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      4.3,
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'ORGANISATION',
                                                      style: TrymdPartnerTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'geometric sans-serif',
                                                            color:
                                                                showAvailableContent ==
                                                                        "vendor"
                                                                    ? Colors
                                                                        .white
                                                                    : Color(
                                                                        0xFF000000,
                                                                      ),
                                                            fontSize: SizeConfig
                                                                    .blockSizeVertical *
                                                                2.5,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      4.3,
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'I’m organized group of people with a ',
                                                      style: TrymdPartnerTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'geometric sans-serif',
                                                            color:
                                                                showAvailableContent ==
                                                                        "vendor"
                                                                    ? Colors
                                                                        .white
                                                                    : Color(
                                                                        0xFF000000,
                                                                      ),
                                                            fontSize: SizeConfig
                                                                    .blockSizeVertical *
                                                                1.8,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      4.3,
                                                  SizeConfig.blockSizeVertical *
                                                      0.5,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'particular purpose such as',
                                                      style: TrymdPartnerTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'geometric sans-serif',
                                                            color:
                                                                showAvailableContent ==
                                                                        "vendor"
                                                                    ? Colors
                                                                        .white
                                                                    : Color(
                                                                        0xFF000000,
                                                                      ),
                                                            fontSize: SizeConfig
                                                                    .blockSizeVertical *
                                                                1.8,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

// FDA CIONTAINER *****************************************************
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 3,
                            right: SizeConfig.blockSizeHorizontal * 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (showAvailableContent != "fda") {
                                      showAvailableContent = "fda";
                                    } else if (showAvailableContent == "fda") {
                                      showAvailableContent = "";
                                    }
                                  });
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              LoginForFDA(userType: "fda"),
                                      transitionDuration: Duration(
                                        seconds: 0,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeVertical * 1.4,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Material(
                                        color: Color(0xFFF1F4F7),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Container(
                                          // width: 325,
                                          // height: 145,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  85,
                                          height:
                                              SizeConfig.blockSizeVertical * 20,
                                          decoration: BoxDecoration(
                                            // color:Color(0xFFF1F4F7),
                                            gradient: LinearGradient(
                                              colors:
                                                  showAvailableContent == "fda"
                                                      ? [
                                                          Color(0xFF0085FF),
                                                          Color(0xFF07D0F2)
                                                        ]
                                                      : [
                                                          Color(0xFFF1F4F7),
                                                          Color(0xFFF1F4F7)
                                                        ],
                                              stops: [0, 1],
                                              begin: AlignmentDirectional(1, 1),
                                              end: AlignmentDirectional(
                                                0,
                                                0,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      5,
                                                  SizeConfig.blockSizeVertical *
                                                      2.5,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  // mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .compactDisc,
                                                      color:
                                                          showAvailableContent ==
                                                                  "fda"
                                                              ? Colors.white
                                                              : Color(
                                                                  0XFF000000,
                                                                ),
                                                      size: 24,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      4.3,
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'FDA',
                                                      style: TrymdPartnerTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'geometric sans-serif',
                                                            color:
                                                                showAvailableContent ==
                                                                        "fda"
                                                                    ? Colors
                                                                        .white
                                                                    : Color(
                                                                        0xFF000000,
                                                                      ),
                                                            fontSize: SizeConfig
                                                                    .blockSizeVertical *
                                                                2.5,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      4.3,
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      "I'm Front Desk Admin",
                                                      style: TrymdPartnerTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'geometric sans-serif',
                                                            color:
                                                                showAvailableContent ==
                                                                        "fda"
                                                                    ? Colors
                                                                        .white
                                                                    : Color(
                                                                        0xFF000000,
                                                                      ),
                                                            fontSize: SizeConfig
                                                                    .blockSizeVertical *
                                                                1.8,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      4.3,
                                                  SizeConfig.blockSizeVertical *
                                                      0.5,
                                                  0,
                                                  0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'To help and monitoring purpose such as',
                                                      style: TrymdPartnerTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'geometric sans-serif',
                                                            color:
                                                                showAvailableContent ==
                                                                        "fda"
                                                                    ? Colors
                                                                        .white
                                                                    : Color(
                                                                        0xFF000000,
                                                                      ),
                                                            fontSize: SizeConfig
                                                                    .blockSizeVertical *
                                                                1.8,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

                      // comming soon ****************************
                      Padding(
                          padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 3,
                          ),
                          child: InkWell(
                            onTap: () {
                              _globalWidget
                                  .toastMessage('Service is comming soon');
                            },
                            child: Container(
                              // width: 325,
                              // height: 145,
                              width: SizeConfig.blockSizeHorizontal * 85,
                              height: SizeConfig.blockSizeVertical * 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1F4F7),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 5,
                                      SizeConfig.blockSizeVertical * 2.5,
                                      0,
                                      0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.business,
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 4.3,
                                      SizeConfig.blockSizeVertical * 2,
                                      0,
                                      0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'CORPORATE',
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
                                                    2.5,
                                                fontWeight: FontWeight.w700,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 4.3,
                                      SizeConfig.blockSizeVertical * 2,
                                      0,
                                      0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'relating to large companies, or to a ',
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
                                                    1.8,
                                                fontWeight: FontWeight.w700,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 4.3,
                                      SizeConfig.blockSizeVertical * 0.5,
                                      0,
                                      0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'particular Company or an Enterprise\n',
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
                                                    1.8,
                                                fontWeight: FontWeight.w700,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),

                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(
                      //       SizeConfig.blockSizeHorizontal * 75,
                      //       SizeConfig.blockSizeVertical * 5,
                      //       0,
                      //       0,),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: [
                      //       InkWell(
                      //         onTap: () async {
                      //           moveToNext();
                      //         },
                      //         child: Text(
                      //           'NEXT',
                      //           style: TrymdPartnerTheme.of(context)
                      //               .bodyText1
                      //               .override(
                      //                 fontFamily: 'geometric sans-serif',
                      //                 color: Color(0xFF000000,),
                      //                 fontSize:
                      //                     SizeConfig.blockSizeVertical *
                      //                         2.5,
                      //                 fontWeight: FontWeight.w700,
                      //                 useGoogleFonts: false,
                      //               ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsetsDirectional.fromSTEB(
                      //             10, 0, 0, 0,),
                      //         child: InkWell(
                      //           onTap: () async {
                      //             moveToNext();
                      //           },
                      //           child: FaIcon(
                      //             FontAwesomeIcons.longArrowAltRight,
                      //             color: Color(0xFF000000,),
                      //             size: SizeConfig.blockSizeVertical * 2.5,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
      );
    });
  }

  // functions *****************************************************************
  moveToNext() async {
    if (showAvailableContent.length == 0 || showAvailableContent.isEmpty) {
      _globalWidget.toastMessage('Please select at least one role');
    } else {
      if (showAvailableContent == "professional") {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                RegistrationScreen(
              userType: "professional",
            ),
            transitionDuration: Duration(
              seconds: 0,
            ),
          ),
        );
        //  var response = await Authentications()
        //     .registerVendorTypeResponse(uid, mobileNumber, showAvailableContent);
      } else if (showAvailableContent == "vendor") {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                RegistrationScreen(userType: "vendor"),
            transitionDuration: Duration(
              seconds: 0,
            ),
          ),
        );
        //  var response = await Authentications()
        //         .registerVendorTypeResponse(uid, mobileNumber, showAvailableContent);
      } else if (showAvailableContent == "fda") {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                LoginForFDA(userType: "fda"),
            transitionDuration: Duration(
              seconds: 0,
            ),
          ),
        );
        //  var response = await Authentications()
        //         .registerVendorTypeResponse(uid, mobileNumber, showAvailableContent);
      } else {
        _globalWidget.toastMessage('Could not identify user type');
      }
    }
  }
}
