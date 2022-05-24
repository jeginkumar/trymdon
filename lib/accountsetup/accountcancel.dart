import 'dart:convert';
// import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:trymd_partner/accountsetup/accountsetbank.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_drop_down.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
// import 'package:trymd_partner/flutter_flow_drop_down.dart';
// import 'package:trymd_partner/operation_details/operational_details_widget.dart';
// import 'package:dotted_line/dotted_line.dart';
// import '../trymd_flow/trymd_theme.dart' as tt;
import 'package:flutter/material.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
// import 'package:trymd_partner/trymd_flow/flutter_flow_drop_down.dart';
import '../repository/selections.dart';
import '../repository/updatebankdetails.dart';
import '../sizer.dart';
import 'accept_widget.dart';
// import 'colorLoader.dart';

class DashboardAccountCancelWidget extends StatefulWidget {
  final vendorType;
  DashboardAccountCancelWidget({this.vendorType});

  @override
  _DashboardAccountCancelWidgetState createState() =>
      _DashboardAccountCancelWidgetState();
}

class _DashboardAccountCancelWidgetState
    extends State<DashboardAccountCancelWidget>
    with SingleTickerProviderStateMixin {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final LocalStorage storage = new LocalStorage('localstorage_app');
  TextEditingController textController = TextEditingController();

  // final _form = GlobalKey<FormState>();
  // final _form2 = GlobalKey<FormState>();
  // TabController _tabController;
  int tabIndex = 0;
  String selectedHours = "";
  List servicesList = [];
  List slotDurations = [];
  List<String> taxList = [];
  String forAccordion = "";
  int slot = 1;
  double fee = 0;
  double tax = 0;
  double total = 0;
  var duration = "";
  List<Widget> bankDetailsWidget = [];
  List<Widget> cancellationWidget = [];
  bool forbank = false;
  dynamic cancelLisst = [[], [], [], [], [], [], [], [], [], []];
  TextEditingController profName = TextEditingController();
  TextEditingController accName = TextEditingController();
  TextEditingController accNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController accType = TextEditingController();
  List data = [];
  List countList = ["1"];
  String beforeSetOne = "";
  String timeSetOne = "";
  String deductedSetOne = "";
  String beforeSetTwo = "";
  String timeSetTwo = "";
  String deductedSetTwo = "";
  String beforeSetThree = "";
  String timeSetThree = "";
  String deductedSetThree = "";
  String beforeSetFour = "";
  String timeSetFour = "";
  String deductedSetFour = "";
  String beforeSetFive = "";
  String timeSetFive = "";
  String deductedSetFive = "";
  String beforeSetSix = "";
  String timeSetSix = "";
  String deductedSetSix = "";
  bool warning = false;
  bool toogleSwitch = false;
  bool empty = true;
  bool next = false;
  List cancelList = [];

  Future<bool> _onBackButtonPressed() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            BankAccountSetupWidget(
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
  void initState() {
    super.initState();
    getSelectedServices();
    getSlotsDurations();
    // bankDetailsWidget.add(bankDet(context, 0,),),;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return WillPopScope(
        onWillPop: _onBackButtonPressed,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                await Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        BankAccountSetupWidget(vendorType: widget.vendorType),
                    transitionDuration: Duration(
                      seconds: 0,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
                size: SizeConfig.blockSizeVertical * 5,
              ),
            ),
            title: Text(
              'Account Setup',
              style: TextStyle(
                fontFamily: 'geometric sans-serif',
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // useGoogleFonts: false,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Color(0XFFF5F5F5),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    10,
                    11,
                    0,
                    0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          6,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          'Cancellation Details',
                          style: TextStyle(
                            fontFamily: 'geometric sans-serif',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xFFDFE1E7),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            countList.add("1");
                            // cancellationWidget.add(
                            //     cancellationDynamic(context, cancellationWidget.length),),;
                          });
                        },
                        icon: Icon(Icons.add_circle),
                        color: Colors.blue,
                        iconSize: 32,
                      ),
                      Text(
                        "ADD DETAILS",
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Color(0xFF0B2F45),
                          fontSize: SizeConfig.blockSizeVertical * 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5)
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                cancellationSetOne(
                  0,
                ),
                if (countList.length >= 2) cancellationSetTwo(1),
                if (countList.length >= 3) cancellationSetThree(2),
                if (countList.length >= 4) cancellationSetFour(3),
                if (countList.length >= 5) cancellationSetFive(4),
                if (countList.length >= 6) cancellationSetSix(5),

                // ListView.builder(
                //   shrinkWrap: true,
                //   scrollDirection: Axis.vertical,
                //   physics: ClampingScrollPhysics(),
                //   itemCount: cancellationWidget.length,
                //   itemBuilder: (context, index) {
                //     return cancellationWidget[index];
                //   },
                // ),

                // ..._dynamicSetTimeWidget(),

                if (warning == true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeVertical * 2,
                      SizeConfig.blockSizeVertical * 3,
                      0,
                      0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Color.fromRGBO(255, 102, 102, 1),
                              size: SizeConfig.blockSizeVertical * 3,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Warning",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                color: Color.fromRGBO(255, 102, 102, 1),
                                fontSize: SizeConfig.blockSizeVertical * 2.2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Please fill the cancellation details properly",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                color: Color.fromRGBO(255, 102, 102, 1),
                                fontSize: SizeConfig.blockSizeVertical * 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                InkWell(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    updateCancelDetailsFun();
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 3,
                      SizeConfig.blockSizeVertical * 3,
                      SizeConfig.blockSizeHorizontal * 3,
                      0,
                    ),
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF3F8BFD), Color(0xFF07D0F2)],
                          stops: [0, 1],
                          begin: AlignmentDirectional(0.94, -1),
                          end: AlignmentDirectional(-0.94, 1),
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          14,
                          0,
                          0,
                        ),
                        child: Text(
                          'Save',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'geometric sans-serif',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                if (cancelList.isNotEmpty)
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          SizeConfig.blockSizeHorizontal * 6,
                          SizeConfig.blockSizeVertical * 5,
                          1,
                          0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cancellation Details",
                              style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 2,
                                  height: 1.55,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                if (next == false) {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              AcceptWidget(
                                        vendorType: widget.vendorType,
                                      ),
                                      transitionDuration: Duration(
                                        seconds: 0,
                                      ),
                                    ),
                                  );
                                } else {
                                  _globalWidget.toastMessage(
                                      'Please fill the cancellation details');
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'NEXT',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  2.5,
                                          fontWeight: FontWeight.w700,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.longArrowAltRight,
                                    color: Color(
                                      0xFF000000,
                                    ),
                                    size: SizeConfig.blockSizeVertical * 2.5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        itemCount: cancelList.length,
                        itemBuilder: (context, index1) {
                          return cancelListWidegt(
                            cancelList[index1],
                          );
                        },
                      ),
                    ],
                  ),

                SizedBox(
                  height: 40,
                ),

                SizedBox(
                  height: 20,
                ),

                // Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                //   Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 15),
                //       child: RichText(
                //         text: TextSpan(
                //           text: 'Note : ',
                //           style: TextStyle(
                //               fontSize: SizeConfig.blockSizeVertical * 2,
                //               height: 1.55,
                //               color: Colors.grey,
                //               fontFamily: 'geometric sans-serif',
                //               fontWeight: FontWeight.bold),
                //           children: <TextSpan>[
                //             TextSpan(text: " "),
                //             TextSpan(
                //                 text:
                //                     "You can not remove Cancellation details \nonce added",
                //                 style: TextStyle(
                //                   height: 1.5,
                //                   fontSize: SizeConfig.blockSizeVertical * 1.8,
                //                   letterSpacing: 0.1,
                //                   color: Colors.grey,
                //                   fontFamily: 'geometric sans-serif',
                //                 ),),
                //           ],
                //         ),
                //       ),),
                // ],),

                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget cancelListWidegt(data) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.12,
      margin: EdgeInsets.only(
          top: 10,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.03,
        bottom: MediaQuery.of(context).size.width * 0.02,
      ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                'Before',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'geometric sans-serif',
                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                  fontWeight: FontWeight.w400,
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
                  width: SizeConfig.blockSizeHorizontal * 22,
                  height: SizeConfig.blockSizeVertical * 5,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      12.0,
                    ),
                    child: Text(
                      data['before'].toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'geometric sans-serif',
                        fontSize: SizeConfig.blockSizeVertical * 1.8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Time',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'geometric sans-serif',
                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                  fontWeight: FontWeight.w400,
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
                  width: SizeConfig.blockSizeHorizontal * 22,
                  height: SizeConfig.blockSizeVertical * 5,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      12.0,
                    ),
                    child: Text(
                      data['time'].toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'geometric sans-serif',
                        fontSize: SizeConfig.blockSizeVertical * 1.8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Deducted',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'geometric sans-serif',
                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                  fontWeight: FontWeight.w400,
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
                  width: SizeConfig.blockSizeHorizontal * 22,
                  height: SizeConfig.blockSizeVertical * 5,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      12.0,
                    ),
                    child: Text(
                      data['deduct'].toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'geometric sans-serif',
                        fontSize: SizeConfig.blockSizeVertical * 1.8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

// cancellation one
  Widget cancellationSetOne(index) {
    bool col = false;
    bool errorColor = false;
    timeSetOne = "Hours";
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 6,
                  SizeConfig.blockSizeVertical * 2,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 8,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              10,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: errorColor
                                      ? Colors.red
                                      : Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                obscureText: false,
                                onChanged: (val) {
                                  // cancelLisst[index].add(val);
                                  if (timeSetOne == "Hours") {
                                    if (int.parse(val) > 24) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  } else if (timeSetOne == "Mins") {
                                    if (int.parse(val) > 60) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  }
                                  beforeSetOne = val;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 0,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 10,
                              height: SizeConfig.blockSizeVertical * 2,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Text(
                                'Before',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: errorColor
                                      ? Colors.red
                                      : Color(0xFF0B2F45),
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              SizeConfig.blockSizeHorizontal * 2.6,
              SizeConfig.blockSizeVertical * 2,
              0,
              0,
            ),
            child: TrymdPartnerDropDown(
              options: ['Hours', 'Mins'].toList(),
              onChanged: (val) {
                setState(() {
                  timeSetOne = val;
                });
                // cancelLisst[index].add(selectedHours);
              },
              width: SizeConfig.blockSizeHorizontal * 25,
              height: SizeConfig.blockSizeVertical * 6.5,
              textStyle: TextStyle(
                fontFamily: 'geometric sans-serif',
                color: Color(0xFF0B2F45),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF0B2F45),
                size: SizeConfig.blockSizeVertical * 3,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Color(0xFFE5E5E5),
              borderWidth: 1,
              borderRadius: 10,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  0,
                  SizeConfig.blockSizeVertical * 1,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 8,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 2.6,
                              SizeConfig.blockSizeVertical * 1.5,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: col == true
                                      ? Colors.red
                                      : Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  new LengthLimitingTextInputFormatter(3),
                                ],
                                obscureText: false,
                                onChanged: (val) {
                                  // cancelLisst[index].add(val);
                                  deductedSetOne = val;
                                  if (int.parse(val) > 100) {
                                    setState(() {
                                      col = true;
                                    });
                                  } else {
                                    setState(() {
                                      col = false;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
                              SizeConfig.blockSizeVertical * 0,
                              0,
                              0,
                            ),
                            child: Container(
                              // width: SizeConfig.blockSizeHorizontal * 19,
                              // height: SizeConfig.blockSizeVertical * 2,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Text(
                                '% Deducted',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color:
                                      col == true ? Colors.red : Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.remove_circle),
          //   color: Colors.red,
          //   iconSize: SizeConfig.blockSizeVertical * 3,
          // )
        ],
      );
    });
  }

// cancellation Two
  Widget cancellationSetTwo(index) {
    bool col = false;
    bool errorColor = false;
    timeSetTwo = "Hours";
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 3,
                  SizeConfig.blockSizeVertical * 1.7,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 8,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              10,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                obscureText: false,
                                onChanged: (val) {
                                  // cancelLisst[index].add(val);
                                  if (timeSetTwo == "Hours") {
                                    if (int.parse(val) > 24) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  } else if (timeSetTwo == "Mins") {
                                    if (int.parse(val) > 60) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  }
                                  beforeSetTwo = val;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 0,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 10,
                              height: SizeConfig.blockSizeVertical * 2,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Text(
                                'Before',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: errorColor ? Colors.red : Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              SizeConfig.blockSizeHorizontal * 2.6,
              SizeConfig.blockSizeVertical * 2,
              0,
              0,
            ),
            child: TrymdPartnerDropDown(
              options: ['Hours', 'Mins'].toList(),
              onChanged: (val) {
                setState(() {
                  timeSetTwo = val;
                });
                // cancelLisst[index].add(selectedHours);
              },
              width: SizeConfig.blockSizeHorizontal * 25,
              height: SizeConfig.blockSizeVertical * 6.5,
              textStyle: TextStyle(
                fontFamily: 'geometric sans-serif',
                color: Color(0xFF0B2F45),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF0B2F45),
                size: SizeConfig.blockSizeVertical * 3,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Color(0xFFE5E5E5),
              borderWidth: 1,
              borderRadius: 10,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  0,
                  SizeConfig.blockSizeVertical * 1,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 7,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 2.6,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6.5,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                obscureText: false,
                                onChanged: (val) {
                                  deductedSetTwo = val;
                                  if (int.parse(val) > 100) {
                                    setState(() {
                                      col = true;
                                    });
                                  } else {
                                    setState(() {
                                      col = false;
                                    });
                                  }
                                  // cancelLisst[index].add(val);
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 0.2,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 19,
                              height: SizeConfig.blockSizeVertical * 2,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Text(
                                '% Deducted',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       print(countList);
          //       countList.removeAt(1);
          //     });
          //   },
          //   icon: Icon(Icons.remove_circle),
          //   color: Colors.red,
          //   iconSize: SizeConfig.blockSizeVertical * 3,
          // )
        ],
      );
    });
  }

// cancellation Three
  Widget cancellationSetThree(index) {
    bool col = false;
    bool errorColor = false;
    timeSetThree = "Hours";
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 3,
                  SizeConfig.blockSizeVertical * 1.7,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 8,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              10,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                obscureText: false,
                                onChanged: (val) {
                                  // cancelLisst[index].add(val);
                                  if (timeSetThree == "Hours") {
                                    if (int.parse(val) > 24) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  } else if (timeSetThree == "Mins") {
                                    if (int.parse(val) > 60) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  }
                                  beforeSetThree = val;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 0.2,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 10,
                              height: SizeConfig.blockSizeVertical * 2,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Text(
                                'Before',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: errorColor
                                      ? Colors.red
                                      : Color(0xFF0B2F45),
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              SizeConfig.blockSizeHorizontal * 2.6,
              SizeConfig.blockSizeVertical * 2,
              0,
              0,
            ),
            child: TrymdPartnerDropDown(
              options: ['Hours', 'Mins'].toList(),
              onChanged: (val) {
                setState(() {
                  timeSetThree = val;
                });
                // cancelLisst[index].add(selectedHours);
              },
              width: SizeConfig.blockSizeHorizontal * 25,
              height: SizeConfig.blockSizeVertical * 6.5,
              textStyle: TextStyle(
                fontFamily: 'geometric sans-serif',
                color: Color(0xFF0B2F45),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF0B2F45),
                size: SizeConfig.blockSizeVertical * 3,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Color(0xFFE5E5E5),
              borderWidth: 1,
              borderRadius: 10,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  0,
                  SizeConfig.blockSizeVertical * 1,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 7,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 2.6,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6.5,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                obscureText: false,
                                onChanged: (val) {
                                  deductedSetThree = val;
                                  if (int.parse(val) > 100) {
                                    setState(() {
                                      col = true;
                                    });
                                  } else {
                                    setState(() {
                                      col = false;
                                    });
                                  }
                                  // cancelLisst[index].add(val);
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 0.2,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 19,
                              height: SizeConfig.blockSizeVertical * 2,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Text(
                                '% Deducted',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       countList.removeAt(2);
          //     });
          //   },
          //   icon: Icon(Icons.remove_circle),
          //   color: Colors.red,
          //   iconSize: SizeConfig.blockSizeVertical * 3,
          // )
        ],
      );
    });
  }

// cancellation Four
  Widget cancellationSetFour(index) {
    bool col = false;
    bool errorColor = false;
    timeSetFour = "Hours";
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 3,
                  SizeConfig.blockSizeVertical * 1.7,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 8,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              10,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                obscureText: false,
                                onChanged: (val) {
                                  // cancelLisst[index].add(val);
                                  if (timeSetFour == "Hours") {
                                    if (int.parse(val) > 24) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  } else if (timeSetFour == "Mins") {
                                    if (int.parse(val) > 60) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  }
                                  beforeSetFour = val;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 0.2,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 10,
                              height: SizeConfig.blockSizeVertical * 2,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Text(
                                'Before',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: errorColor
                                      ? Colors.red
                                      : Color(0xFF0B2F45),
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              SizeConfig.blockSizeHorizontal * 2.6,
              SizeConfig.blockSizeVertical * 2,
              0,
              0,
            ),
            child: TrymdPartnerDropDown(
              options: ['Hours', 'Mins'].toList(),
              onChanged: (val) {
                setState(() {
                  timeSetFour = val;
                });
                // cancelLisst[index].add(selectedHours);
              },
              width: SizeConfig.blockSizeHorizontal * 25,
              height: SizeConfig.blockSizeVertical * 6.5,
              textStyle: TextStyle(
                fontFamily: 'geometric sans-serif',
                color: Color(0xFF0B2F45),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF0B2F45),
                size: SizeConfig.blockSizeVertical * 3,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Color(0xFFE5E5E5),
              borderWidth: 1,
              borderRadius: 10,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  0,
                  SizeConfig.blockSizeVertical * 1,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 7,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 2.6,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6.5,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                obscureText: false,
                                onChanged: (val) {
                                  deductedSetFour = val;
                                  if (int.parse(val) > 100) {
                                    setState(() {
                                      col = true;
                                    });
                                  } else {
                                    setState(() {
                                      col = false;
                                    });
                                  }
                                  // cancelLisst[index].add(val);
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 0.2,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 19,
                              height: SizeConfig.blockSizeVertical * 2,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Text(
                                '% Deducted',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       countList.removeAt(3);
          //     });
          //   },
          //   icon: Icon(Icons.remove_circle),
          //   color: Colors.red,
          //   iconSize: SizeConfig.blockSizeVertical * 3,
          // )
        ],
      );
    });
  }

// cancellation Five
  Widget cancellationSetFive(index) {
    bool col = false;
    bool errorColor = false;
    timeSetFive = "Hours";
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 3,
                  SizeConfig.blockSizeVertical * 1.7,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 8,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              10,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                obscureText: false,
                                onChanged: (val) {
                                  // cancelLisst[index].add(val);
                                  if (timeSetFive == "Hours") {
                                    if (int.parse(val) > 24) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  } else if (timeSetFive == "Mins") {
                                    if (int.parse(val) > 60) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  }
                                  beforeSetFive = val;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 0.2,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 10,
                              height: SizeConfig.blockSizeVertical * 2,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Text(
                                'Before',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: errorColor
                                      ? Colors.red
                                      : Color(0xFF0B2F45),
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              SizeConfig.blockSizeHorizontal * 2.6,
              SizeConfig.blockSizeVertical * 2,
              0,
              0,
            ),
            child: TrymdPartnerDropDown(
              options: ['Hours', 'Mins'].toList(),
              onChanged: (val) {
                setState(() {
                  timeSetFive = val;
                });
                // cancelLisst[index].add(selectedHours);
              },
              width: SizeConfig.blockSizeHorizontal * 25,
              height: SizeConfig.blockSizeVertical * 6.5,
              textStyle: TextStyle(
                fontFamily: 'geometric sans-serif',
                color: Color(0xFF0B2F45),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF0B2F45),
                size: SizeConfig.blockSizeVertical * 3,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Color(0xFFE5E5E5),
              borderWidth: 1,
              borderRadius: 10,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  0,
                  SizeConfig.blockSizeVertical * 1,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 7,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 2.6,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6.5,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                obscureText: false,
                                onChanged: (val) {
                                  deductedSetFive = val;
                                  if (int.parse(val) > 100) {
                                    setState(() {
                                      col = true;
                                    });
                                  } else {
                                    setState(() {
                                      col = false;
                                    });
                                  }
                                  // cancelLisst[index].add(val);
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 0.2,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 19,
                              height: SizeConfig.blockSizeVertical * 2,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Text(
                                '% Deducted',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       countList.removeAt(4);
          //     });
          //   },
          //   icon: Icon(Icons.remove_circle),
          //   color: Colors.red,
          //   iconSize: SizeConfig.blockSizeVertical * 3,
          // )
        ],
      );
    });
  }

// cancellation Six
  Widget cancellationSetSix(index) {
    bool col = false;
    bool errorColor = false;
    timeSetSix = "Hours";
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 3,
                  SizeConfig.blockSizeVertical * 1.7,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 8,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              10,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                obscureText: false,
                                onChanged: (val) {
                                  // cancelLisst[index].add(val);
                                  if (timeSetSix == "Hours") {
                                    if (int.parse(val) > 24) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  } else if (timeSetSix == "Mins") {
                                    if (int.parse(val) > 60) {
                                      setState(() {
                                        errorColor = true;
                                      });
                                    } else {
                                      setState(() {
                                        errorColor = false;
                                      });
                                    }
                                  }
                                  beforeSetSix = val;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 0.2,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 10,
                              height: SizeConfig.blockSizeVertical * 2,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Text(
                                'Before',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: errorColor
                                      ? Colors.red
                                      : Color(0xFF0B2F45),
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              SizeConfig.blockSizeHorizontal * 2.6,
              SizeConfig.blockSizeVertical * 2,
              0,
              0,
            ),
            child: TrymdPartnerDropDown(
              options: ['Hours', 'Mins'].toList(),
              onChanged: (val) {
                setState(() {
                  timeSetSix = val;
                });
                // cancelLisst[index].add(selectedHours);
              },
              width: SizeConfig.blockSizeHorizontal * 25,
              height: SizeConfig.blockSizeVertical * 6.5,
              textStyle: TextStyle(
                fontFamily: 'geometric sans-serif',
                color: Color(0xFF0B2F45),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF0B2F45),
                size: SizeConfig.blockSizeVertical * 3,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Color(0xFFE5E5E5),
              borderWidth: 1,
              borderRadius: 10,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  0,
                  SizeConfig.blockSizeVertical * 1,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 7,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 2.6,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6.5,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                obscureText: false,
                                onChanged: (val) {
                                  deductedSetSix = val;
                                  if (int.parse(val) > 100) {
                                    setState(() {
                                      col = true;
                                    });
                                  } else {
                                    setState(() {
                                      col = false;
                                    });
                                  }
                                  // cancelLisst[index].add(val);
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0x00000000,
                                      ),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 0.2,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 19,
                              height: SizeConfig.blockSizeVertical * 2,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Text(
                                '% Deducted',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       countList.removeAt(5);
          //     });
          //   },
          //   icon: Icon(Icons.remove_circle),
          //   color: Colors.red,
          //   iconSize: SizeConfig.blockSizeVertical * 3,
          // )
        ],
      );
    });
  }

  // Function ****************************************************************************************
  getSelectedServices() async {
    var vendorId = storage.getItem("vendor_id");
    print(vendorId);
    var response =
        await VendorSelectedCategories().getSelectedServices(vendorId);
    if (response['status'] == 1) {
      servicesList = response['service_master'][0]['servicetags'];

      if (servicesList.length != 0) {
        empty = false;
      } else {
        empty = true;
      }
    }
    selectedHours = "Hours";
    // setState(() {});
  }

  getSlotsDurations() async {
    var response = await UpdateBankDetails().getSlotTimeResponse();
    if (response['status'] == 1) {
      var data = response['data'];
      data.forEach((ele) {
        slotDurations.add(
          ele['duration'],
        );
      });
    }
    taxList = ["5", "12", "18"];
    setState(() {});
  }

  updateCancelDetailsFun() async {
    showDialog(
        context: context,
        barrierColor: Colors.white38,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    data = [
      [beforeSetOne, timeSetOne, deductedSetOne],
      [beforeSetTwo, timeSetTwo, deductedSetTwo],
      [beforeSetThree, timeSetThree, deductedSetThree],
      [beforeSetFour, timeSetFour, deductedSetFour],
      [beforeSetFive, timeSetFive, deductedSetFive],
      [beforeSetSix, timeSetSix, deductedSetSix]
    ];

    List datum = [];
    for (int i = 0; i < data.length; i++) {
      if (data[i].length != 0) {
        if (data[i][0] != "" && data[i][1] != "" && data[i][2] != "") {
          datum.add(
            data[i],
          );
        }
      }
    }

    if (datum.length == 0) {
      setState(() {
        warning = true;
      });
      Navigator.pop(context);
    } else {
      setState(() {
        warning = false;
      });

      var id = storage.getItem("vendor_id");
      var json = jsonEncode({"professional_id": id, "data": datum});
      var response =
          await UpdateBankDetails().updateCancellationDetailsResponse(json);
      if (response['status'] == 1) {
        setState(() {
          cancelList = [];
          datum.forEach((element) {
            cancelList.add({
              "before": element[0],
              "time": element[1],
              "deduct": element[2],
            });
          });
        });
        Navigator.pop(context);
        _globalWidget.toastMessage('Details updated successfully');
      } else {
        _globalWidget.toastMessage('Something went wrong');
        Navigator.pop(context);
      }
    }
  }
}
