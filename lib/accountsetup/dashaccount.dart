import 'dart:convert';
// import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:trymd_partner/accountsetup/accountcancel.dart';
import 'package:trymd_partner/accountsetup/accountsetbank.dart';
import 'package:trymd_partner/dashboard/dashboard.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/global_widget/trymd_partner_drop_down.dart';
import 'package:trymd_partner/global_widget/trymd_partner_theme.dart';
import 'package:trymd_partner/trymd_partner_drop_down.dart';
// import 'package:trymd_partner/operation_details/operational_details_widget.dart';
// import 'package:dotted_line/dotted_line.dart';
// import '../trymd_flow/trymd_theme.dart' as tt;
import 'package:flutter/material.dart';
// import 'package:trymd_partner/trymd_flow/flutter_flow_drop_down.dart';
import '../repository/selections.dart';
import '../repository/updatebankdetails.dart';
import '../sizer.dart';
// import 'accept_widget.dart';
import 'colorLoader.dart';

class DashboardAccount extends StatefulWidget {
  final vendorType;
  DashboardAccount({this.vendorType});

  @override
  _DashboardAccountState createState() => _DashboardAccountState();
}

class _DashboardAccountState extends State<DashboardAccount>
    with SingleTickerProviderStateMixin {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final LocalStorage storage = new LocalStorage('localstorage_app');
  TextEditingController textController = TextEditingController();

  // final _form = GlobalKey<FormState>();
  final _form2 = GlobalKey<FormState>();
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
  List countList = [];
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
  void initState() {
    super.initState();
    getSelectedServices();
    getSlotsDurations();
    // bankDetailsWidget.add(bankDet(context, 0,),);
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
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
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
              style: TrymdPartnerTheme.of(context).bodyText1.override(
                    fontFamily: 'geometric sans-serif',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
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
                        3,
                        0,
                        0,
                        0,
                      ),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BankAccountSetupWidget(),
                            ),
                          );
                        },
                        child: Text(
                          'Service Fee details',
                          style: TextStyle(
                            fontFamily: 'geometric sans-serif',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Color(0xFFDFE1E7),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  15,
                  10,
                  0,
                  0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Service Listing',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (empty == true)
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2),
                  child: Column(
                    children: [
                      ColorLoader(),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Service is Empty",
                        style: TrymdPartnerTheme.of(context).bodyText1.override(
                              fontFamily: 'geometric sans-serif',
                              color: Colors.grey[300],
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ],
                  ),
                ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      title: Text(
                        'Click to see Slot Details',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Trailing expansion arrow icon',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Colors.grey[600],
                          fontSize: SizeConfig.blockSizeVertical * 1.8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: <Widget>[
                        Form(
                            key: _form2,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        10,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.05),
                                    ),
                                    // gradient: gradient,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text(
                                      //   'hi',
                                      //   style: TextStyle(
                                      //     fontFamily: 'geometric sans-serif',
                                      //     color: Colors.black,
                                      //     fontSize:
                                      //         SizeConfig.blockSizeVertical *
                                      //             2.2,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Time Slot',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontFamily:
                                                  'geometric sans-serif',
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      1.8,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 10,
                                            ),
                                            child: TrymdPartnerDropDownOne(
                                              options: slotDurations,
                                              onChanged: (val) => setState(
                                                  () => duration = val),
                                              height:
                                                  SizeConfig.blockSizeVertical *
                                                      5,
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  24,
                                              textStyle: TextStyle(
                                                fontFamily:
                                                    "geometric sans-serif",
                                                color: Colors.black54,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 22,
                                                color: Colors.black,
                                              ),
                                              fillColor: Color(0xFFEEEEEE),
                                              elevation: 0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0,
                                              borderRadius: 5,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(12, 4, 12, 4),
                                              hidesUnderline: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // IconButton(
                                      //   onPressed: () {
                                      //     setState(() {
                                      // if (forAccordion == data["speciality_id"]) {
                                      //   forAccordion = "";
                                      //   slot = 0;
                                      //   fee = 0;
                                      //   tax = 0;
                                      //   total = 0;
                                      //   // duration = "";
                                      // } else if (forAccordion != data["speciality_id"]) {
                                      //   forAccordion = data["speciality_id"];
                                      // }
                                      //     });
                                      // },
                                      // icon:
                                      //  forAccordion == data["speciality_id"]
                                      //     ? Icon(Icons.keyboard_arrow_up)
                                      //     :
                                      //       Icon(Icons.keyboard_arrow_down),
                                      //   color: Colors.black,
                                      // )
                                    ],
                                  ),
                                ),
                                // if (forAccordion == data["speciality_id"])
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 15),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        10,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.05),
                                    ),
                                    // gradient: gradient,
                                  ),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            SizeConfig.blockSizeVertical * 2,
                                            0,
                                            0,
                                          ),
                                          child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
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
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '# Slots',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily:
                                                              'geometric sans-serif',
                                                          fontSize: SizeConfig
                                                                  .blockSizeVertical *
                                                              1.7,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                          0,
                                                          10,
                                                          0,
                                                          0,
                                                        ),
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFEEEEEE),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                              10,
                                                              0,
                                                              10,
                                                              0,
                                                            ),
                                                            child:
                                                                TextFormField(
                                                              // controller: slots,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              // inputFormatters: [
                                                              //   FilteringTextInputFormatter
                                                              //       .digitsOnly,
                                                              //   new LengthLimitingTextInputFormatter(
                                                              //       2),
                                                              // ],
                                                              // enabled: false,
                                                              // obscureText: false,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  slot =
                                                                      int.parse(
                                                                          val);
                                                                  // duro = slot * int.parse(duration);
                                                                });
                                                              },
                                                              // validator: (val) {
                                                              //   if (val.length == 0 || val == null) {
                                                              //     return "!";
                                                              //   } else {
                                                              //     return null;
                                                              //   }
                                                              // },
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText: '1',
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .black54),
                                                                enabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color:
                                                                        Color(
                                                                      0x00000000,
                                                                    ),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                      4.0,
                                                                    ),
                                                                    topRight: Radius
                                                                        .circular(
                                                                      4.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color:
                                                                        Color(
                                                                      0x00000000,
                                                                    ),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                      4.0,
                                                                    ),
                                                                    topRight: Radius
                                                                        .circular(
                                                                      4.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontFamily:
                                                                    'geometric sans-serif',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                    8,
                                                    0,
                                                    0,
                                                    0,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Duration',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily:
                                                              'geometric sans-serif',
                                                          fontSize: SizeConfig
                                                                  .blockSizeVertical *
                                                              1.7,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 55,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        margin: EdgeInsets.only(
                                                          top: 10,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '10',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'geometric sans-serif',
                                                            ),
                                                          ),
                                                        ),

                                                        // TrymdPartnerDropDownOne(
                                                        //   options: slotDurations,
                                                        //   onChanged: (val) =>
                                                        //       setState(() => duration = val),
                                                        //   height: SizeConfig.blockSizeVertical * 5,
                                                        //   width: SizeConfig.blockSizeHorizontal * 24,
                                                        //   textStyle: TextStyle(
                                                        //     fontFamily: "geometric sans-serif",
                                                        //     color: Colors.black54,
                                                        //     fontSize: 13,
                                                        //     fontWeight: FontWeight.w500,
                                                        //   ),
                                                        //   icon: Icon(
                                                        //     Icons.keyboard_arrow_down,
                                                        //     size: 22,
                                                        //     color: Colors.black,
                                                        //   ),
                                                        //   fillColor: Color(0xFFEEEEEE),
                                                        //   elevation: 0,
                                                        //   borderColor: Colors.transparent,
                                                        //   borderWidth: 0,
                                                        //   borderRadius: 5,
                                                        //   margin: EdgeInsetsDirectional.fromSTEB(
                                                        //       12, 4, 12, 4),
                                                        //   hidesUnderline: true,
                                                        // )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                    10,
                                                    0,
                                                    0,
                                                    0,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Fee',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily:
                                                              'geometric sans-serif',
                                                          fontSize: SizeConfig
                                                                  .blockSizeVertical *
                                                              1.7,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                          0,
                                                          10,
                                                          0,
                                                          0,
                                                        ),
                                                        child: Container(
                                                          width: 55,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFEEEEEE),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                              5,
                                                              0,
                                                              0,
                                                              0,
                                                            ),
                                                            child:
                                                                TextFormField(
                                                              // controller: fee,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly,
                                                                new LengthLimitingTextInputFormatter(
                                                                    4),
                                                              ],
                                                              obscureText:
                                                                  false,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  fee = double
                                                                      .parse(
                                                                          val);
                                                                  tax = (tax /
                                                                          100) *
                                                                      fee;
                                                                  total =
                                                                      fee + tax;
                                                                });
                                                              },
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText: '100',
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .black54,
                                                                    fontFamily:
                                                                        'geometric sans-serif'),
                                                                enabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color:
                                                                        Color(
                                                                      0x00000000,
                                                                    ),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                      4.0,
                                                                    ),
                                                                    topRight: Radius
                                                                        .circular(
                                                                      4.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color:
                                                                        Color(
                                                                      0x00000000,
                                                                    ),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                      4.0,
                                                                    ),
                                                                    topRight: Radius
                                                                        .circular(
                                                                      4.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'geometric sans-serif',
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black54),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                    15,
                                                    0,
                                                    0,
                                                    0,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Tax',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily:
                                                              'geometric sans-serif',
                                                          fontSize: SizeConfig
                                                                  .blockSizeVertical *
                                                              1.7,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                          0,
                                                          0,
                                                          0,
                                                          0,
                                                        ),
                                                        child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                              top: 10,
                                                            ),
                                                            child:
                                                                TrymdPartnerDropDown(
                                                              options: taxList,
                                                              onChanged: (val) {
                                                                print(slot);
                                                                //     setState(() {
                                                                //   fee = fee;
                                                                //   tax = (double.parse(val) / 100) *
                                                                //       fee;
                                                                //   total = fee + tax;
                                                                // });
                                                              },
                                                              // setState(() => duration = val),
                                                              height: SizeConfig
                                                                      .blockSizeVertical *
                                                                  5,
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  20,
                                                              textStyle:
                                                                  TextStyle(
                                                                fontFamily:
                                                                    "geometric sans-serif",
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down,
                                                                size: 22,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              fillColor: Color(
                                                                  0xFFEEEEEE),
                                                              elevation: 0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0,
                                                              borderRadius: 5,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          4,
                                                                          12,
                                                                          4),
                                                              hidesUnderline:
                                                                  true,
                                                            )

                                                            // Container(
                                                            //   width: 55,
                                                            //   height: 40,
                                                            //   decoration: BoxDecoration(
                                                            //     color: Color(0xFFEEEEEE),
                                                            //     borderRadius: BorderRadius.circular(5),
                                                            //   ),
                                                            //   child: Padding(
                                                            //       padding: EdgeInsetsDirectional.fromSTEB(
                                                            //           5, 0, 0, 0,),
                                                            //       child: TextFormField(
                                                            //           obscureText: false,
                                                            //           // controller: tax,
                                                            //           keyboardType: TextInputType.number,
                                                            //           inputFormatters: [
                                                            //             FilteringTextInputFormatter
                                                            //                 .digitsOnly,
                                                            //             new LengthLimitingTextInputFormatter(
                                                            //                 3),
                                                            //           ],
                                                            //           onChanged: (val) {
                                                            //             setState(() {
                                                            //               fee = fee;
                                                            //               tax = (double.parse(val) / 100) *
                                                            //                   fee;
                                                            //               total = fee + tax;
                                                            //             });
                                                            //           },
                                                            //           decoration: InputDecoration(
                                                            //             hintText: '18%',
                                                            //             hintStyle: TextStyle(
                                                            //                 color: Colors.black54,
                                                            //                 fontFamily:
                                                            //                     'geometric sans-serif'),
                                                            //             enabledBorder: UnderlineInputBorder(
                                                            //               borderSide: BorderSide(
                                                            //                 color: Color(0x00000000,),
                                                            //                 width: 1,
                                                            //               ),
                                                            //               borderRadius:
                                                            //                   const BorderRadius.only(
                                                            //                 topLeft: Radius.circular(4.0,),
                                                            //                 topRight: Radius.circular(4.0,),
                                                            //               ),
                                                            //             ),
                                                            //             focusedBorder: UnderlineInputBorder(
                                                            //               borderSide: BorderSide(
                                                            //                 color: Color(0x00000000,),
                                                            //                 width: 1,
                                                            //               ),
                                                            //               borderRadius:
                                                            //                   const BorderRadius.only(
                                                            //                 topLeft: Radius.circular(4.0,),
                                                            //                 topRight: Radius.circular(4.0,),
                                                            //               ),
                                                            //             ),
                                                            //           ),
                                                            //           style: TextStyle(
                                                            //               color: Colors.black54,
                                                            //               fontSize: 16,
                                                            //               fontFamily:
                                                            //                   'geometric sans-serif'),),),
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                    10,
                                                    0,
                                                    0,
                                                    0,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Total',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily:
                                                              'geometric sans-serif',
                                                          fontSize: SizeConfig
                                                                  .blockSizeVertical *
                                                              1.7,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                          0,
                                                          10,
                                                          0,
                                                          0,
                                                        ),
                                                        child: Container(
                                                          width: 55,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFEEEEEE),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                              10,
                                                              10,
                                                              0,
                                                              0,
                                                            ),
                                                            child: Text(
                                                              total.toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'geometric sans-serif'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            12,
                                            0,
                                            0,
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              FocusScopeNode currentFocus =
                                                  FocusScope.of(context);
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                              if (_form2.currentState
                                                  .validate()) {
                                                if (duration.length == 0) {
                                                  _globalWidget.toastMessage(
                                                      'Please select duration hours');
                                                } else {
                                                  updateslots(
                                                      data,
                                                      slot,
                                                      duration,
                                                      fee,
                                                      tax,
                                                      total);
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.81,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFF3F8BFD),
                                                    Color(0xFF07D0F2)
                                                  ],
                                                  stops: [0, 1],
                                                  begin: AlignmentDirectional(
                                                      0.94, -1),
                                                  end: AlignmentDirectional(
                                                      -0.94, 1),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  0,
                                                  12,
                                                  0,
                                                  0,
                                                ),
                                                child: Text(
                                                  'SAVE',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'geometric sans-serif',
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(
                                //       SizeConfig.blockSizeHorizontal * 70, 0, 0, 0,),
                                //   child: Row(
                                //     mainAxisSize: MainAxisSize.max,
                                //     children: [
                                //       InkWell(
                                //         onTap: () async {
                                //           await Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //               builder: (context) => DashboardAccountCancelWidget(),
                                //             ),
                                //           );

                                //           FocusScopeNode currentFocus = FocusScope.of(context);
                                //           if (!currentFocus.hasPrimaryFocus) {
                                //             currentFocus.unfocus();
                                //           }
                                //           if (_form2.currentState.validate()) {
                                //             if (duration.length == 0) {
                                //               Fluttertoast.showToast(
                                //                   msg: "Please select Duration hours",
                                //                   toastLength: Toast.LENGTH_SHORT,
                                //                   gravity: ToastGravity.SNACKBAR,
                                //                   timeInSecForIosWeb: 1,
                                //                   backgroundColor: Colors.black54,
                                //                   textColor: Colors.white,
                                //                   fontSize: 16.0);
                                //             } else {
                                //               updateslots(data['speciality_id'], slot, duration,
                                //                   fee, tax, total);
                                //             }
                                //           }
                                //         },
                                //         child: Text(
                                //           'NEXT',
                                //           style: TrymdPartnerTheme.of(context).bodyText1.override(
                                //                 fontFamily: 'Harmonia Sans W01 Bold',
                                //                 color: Colors.black,
                                //                 fontSize: 20,
                                //                 fontWeight: FontWeight.bold,
                                //                 useGoogleFonts: false,
                                //               ),
                                //         ),
                                //       ),
                                //       Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0,),
                                //         child: InkWell(
                                //           onTap: () async {
                                //             FocusScopeNode currentFocus = FocusScope.of(context);
                                //             if (!currentFocus.hasPrimaryFocus) {
                                //               currentFocus.unfocus();
                                //             }
                                //             if (_form2.currentState.validate()) {
                                //               if (duration.length == 0) {
                                //                 Fluttertoast.showToast(
                                //                     msg: "Please select Duration hours",
                                //                     toastLength: Toast.LENGTH_SHORT,
                                //                     gravity: ToastGravity.SNACKBAR,
                                //                     timeInSecForIosWeb: 1,
                                //                     backgroundColor: Colors.black54,
                                //                     textColor: Colors.white,
                                //                     fontSize: 16.0);
                                //               } else {
                                //                 updateslots(data['speciality_id'], slot, duration,
                                //                     fee, tax, total);
                                //               }
                                //             }
                                //           },
                                //           child: FaIcon(
                                //             FontAwesomeIcons.longArrowAltRight,
                                //             color: Color(0xFF0B2F45),
                                //             size: 24,
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ))
                      ],
                    );
                  })
            ],
          )
              // return accord(context, servicesList[index],);

              ),
        ),
      );
    });
  }
  // DefaultTabController(
  //     length: 3,
  //     child: SafeArea(
  //       child: Container(
  //         width: MediaQuery.of(context).size.width,
  //         decoration: BoxDecoration(
  //           color: Color(0xFFF5F5F5),
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Stack(children: [
  //               Padding(
  //                   padding: EdgeInsets.only(
  //                       top: SizeConfig.blockSizeVertical * 1.5),
  //                   child: Container(
  //                       width: SizeConfig.blockSizeHorizontal * 95,
  //                       height: SizeConfig.blockSizeVertical * 5,
  //                       margin: EdgeInsets.symmetric(
  //                           horizontal: 0, vertical: 5),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(10,),
  //                         color: Colors.transparent,
  //                       ),
  //                       child: Stack(children: [
  //                         Padding(
  //                             padding: EdgeInsets.only(
  //                                 left: SizeConfig
  //                                         .blockSizeHorizontal *
  //                                     23,
  //                                 top:
  //                                     SizeConfig.blockSizeVertical *
  //                                         2.2),
  //                             child: Container(
  //                                 width: 60,
  //                                 margin: EdgeInsets.symmetric(
  //                                     horizontal: 5),
  //                                 child: DottedLine(
  //                                   dashLength: 6.0,
  //                                   lineThickness: 2,
  //                                   dashColor: Colors.grey,
  //                                 ),),),
  //                         Padding(
  //                             padding: EdgeInsets.only(
  //                                 left: SizeConfig
  //                                         .blockSizeHorizontal *
  //                                     55,
  //                                 top:
  //                                     SizeConfig.blockSizeVertical *
  //                                         2.2),
  //                             child: Container(
  //                                 width: 60,
  //                                 margin: EdgeInsets.symmetric(
  //                                     horizontal: 5),
  //                                 child: DottedLine(
  //                                   dashLength: 6.0,
  //                                   lineThickness: 2,
  //                                   dashColor: Colors.grey,
  //                                 ),),),
  //                         TabBar(
  //                           controller: _tabController,
  //                           tabs: [tab1(), tab2(), tab3()],
  //                           isScrollable: false,
  //                           indicatorWeight: 0.01,
  //                           indicatorColor: Colors.transparent,
  //                           onTap: (index) {
  //                             setState(() {
  //                               tabIndex = index;
  //                             });
  //                           },
  //                           labelPadding: EdgeInsets.symmetric(
  //                               horizontal: 30,),
  //                         ),
  //                       ])))
  //             ]),
  //             Expanded(
  //                 child: TabBarView(
  //                     // physics: NeverScrollableScrollPhysics(),
  //                     controller: _tabController,
  //                     children: [
  //                   firsttab(),
  //                   secondTab(),
  //                   thirdTab()
  //                 ]))
  //           ],
  //         ),
  //       ),
  //     ),),),);

  // Widget tab1() {
  //   return Tab(
  //       child: Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 0,),
  //     child: Container(
  //       width: SizeConfig.blockSizeHorizontal * 11,
  //       padding: EdgeInsets.symmetric(horizontal: 10,),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(50,),
  //         gradient: LinearGradient(
  //             colors: tabIndex == 0
  //                 ? [
  //                     Color(0xFF07D0F2),
  //                     Color(0xFF95EBF9),
  //                   ]
  //                 : [Colors.grey[300], Colors.grey[300]]),
  //       ),
  //       child: Align(
  //         alignment: Alignment.center,
  //         child: Text(
  //           "1",
  //           maxLines: 1,
  //           style: TextStyle(
  //             fontSize: SizeConfig.blockSizeVertical * 2,
  //             fontFamily: 'geometric sans-serif',
  //             fontWeight: FontWeight.w600,
  //             color: tabIndex == 0 ? Colors.white : Colors.black,
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),);
  // }

  // Widget tab2() {
  //   return Tab(
  //       child: Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 0,),
  //     child: Container(
  //       width: SizeConfig.blockSizeHorizontal * 11,
  //       padding: EdgeInsets.symmetric(horizontal: 10,),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(50,),
  //         gradient: LinearGradient(
  //             colors: tabIndex == 1
  //                 ? [
  //                     Color(0xFF07D0F2),
  //                     Color(0xFF95EBF9),
  //                   ]
  //                 : [Colors.grey[300], Colors.grey[300]]),
  //       ),
  //       child: Align(
  //         alignment: Alignment.center,
  //         child: Text(
  //           "2",
  //           maxLines: 1,
  //           style: TextStyle(
  //             fontSize: SizeConfig.blockSizeVertical * 2,
  //             fontFamily: 'geometric sans-serif',
  //             fontWeight: FontWeight.w600,
  //             color: tabIndex == 1 ? Colors.white : Colors.black,
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),);
  // }

  // Widget tab3() {
  //   return Tab(
  //       child: Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 0,),
  //     child: Container(
  //       width: SizeConfig.blockSizeHorizontal * 11,
  //       padding: EdgeInsets.symmetric(horizontal: 10,),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(50,),
  //         gradient: LinearGradient(
  //             colors: tabIndex == 2
  //                 ? [
  //                     Color(0xFF07D0F2),
  //                     Color(0xFF95EBF9),
  //                   ]
  //                 : [Colors.grey[300], Colors.grey[300]]),
  //       ),
  //       child: Align(
  //         alignment: Alignment.center,
  //         child: Text(
  //           "3",
  //           maxLines: 1,
  //           style: TextStyle(
  //             fontSize: SizeConfig.blockSizeVertical * 2,
  //             fontFamily: 'geometric sans-serif',
  //             fontWeight: FontWeight.w600,
  //             color: tabIndex == 2 ? Colors.white : Colors.black,
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),);
  // }

  // Widget firsttab() {
  //   return SingleChildScrollView(
  //       child: Column(children: [
  //     Padding(
  //       padding: EdgeInsetsDirectional.fromSTEB(10, 11, 0, 0,),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           Padding(
  //             padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0,),
  //             child: InkWell(
  //               onTap: () async {
  //                 await Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => BankAccountSetupWidget(),
  //                   ),
  //                 );
  //               },
  //               child: Text(
  //                 'Service Fee details',
  //                 style: TextStyle(
  //                   fontFamily: 'geometric sans-serif',
  //                   color: Colors.black,
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //     Divider(
  //       thickness: 1,
  //       color: Color(0xFFDFE1E7),
  //     ),
  //     Padding(
  //       padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0,),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           Text(
  //             'Service Listing',
  //             style: TextStyle(
  //               fontFamily: 'geometric sans-serif',
  //               color: Colors.black,
  //               fontSize: 16,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     SizedBox(height: 20,),
  //     if (empty == true)
  //       Padding(
  //           padding:
  //               EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
  //           child: Column(children: [
  //             ColorLoader(),
  //             SizedBox(
  //               height: 50,
  //             ),
  //             Text(
  //               "Service is Empty",
  //               style: tt.TrymdTheme.of(context).bodyText1.override(
  //                     fontFamily: 'geometric sans-serif',
  //                     color: Colors.grey[300],
  //                     fontSize: SizeConfig.blockSizeVertical * 2,
  //                     fontWeight: FontWeight.bold,
  //                     useGoogleFonts: false,
  //                   ),
  //             ),
  //           ],),),
  //     ListView.builder(
  //       shrinkWrap: true,
  //       physics: ClampingScrollPhysics(),
  //       itemCount: servicesList.length,
  //       itemBuilder: (context, index) {
  //         return accord(context, servicesList[index],);
  //       },
  //     ),
  //   ],),);
  // }

  // Widget secondTab() {
  //   return SingleChildScrollView(
  //       child: Column(children: [
  //     Padding(
  //       padding: EdgeInsetsDirectional.fromSTEB(10, 11, 0, 0,),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           Padding(
  //             padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0,),
  //             child: Text(
  //               'Add Bank Details',
  //               style: TextStyle(
  //                 fontFamily: 'geometric sans-serif',
  //                 color: Colors.black,
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     Divider(
  //       thickness: 1,
  //       color: Color(0xFFDFE1E7),
  //     ),
  //     // Row(
  //     //   mainAxisAlignment: MainAxisAlignment.end,
  //     //   children: [],
  //     // ),
  //     // SizedBox(
  //     //   height: 20,
  //     // ),
  //     bankDet(0,),
  //     // ListView.builder(
  //     //   shrinkWrap: true,
  //     //   scrollDirection: Axis.vertical,
  //     //   physics: ClampingScrollPhysics(),
  //     //   itemCount: bankDetailsWidget.length,
  //     //   itemBuilder: (context, index) {
  //     //     return bankDet(index);
  //     //   },
  //     // ),
  //     SizedBox(
  //       height: 20,
  //     )
  //   ],),);
  // }

  // Widget thirdTab() {
  //   return SingleChildScrollView(
  //       child: Column(children: [
  //     Padding(
  //       padding: EdgeInsetsDirectional.fromSTEB(10, 11, 0, 0,),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           Padding(
  //             padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0,),
  //             child: Text('Cancellation Details',
  //                 style: TextStyle(
  //                   fontFamily: 'geometric sans-serif',
  //                   color: Colors.black,
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.bold,
  //                 ),),
  //           ),
  //         ],
  //       ),
  //     ),
  //     Divider(
  //       thickness: 1,
  //       color: Color(0xFFDFE1E7),
  //     ),
  //     Align(
  //         alignment: Alignment.topRight,
  //         child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
  //           IconButton(
  //             onPressed: () {
  //               setState(() {
  //                 countList.insert(0, "0");
  //                 // cancellationWidget.add(
  //                 //     cancellationDynamic(context, cancellationWidget.length),);
  //               });
  //             },
  //             icon: Icon(Icons.add_circle),
  //             color: Colors.blue,
  //             iconSize: 32,
  //           ),
  //           Text(
  //             "ADD DETAILS",
  //             style: TextStyle(
  //               fontFamily: 'geometric sans-serif',
  //               color: Color(0xFF0B2F45),
  //               fontSize: SizeConfig.blockSizeVertical * 2,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           SizedBox(width: 5)
  //         ],),),

  //     SizedBox(
  //       height: 20,
  //     ),

  //     cancellationSetOne(context, 0,),
  //     if (countList.length >= 2) cancellationSetTwo(context, 1),
  //     if (countList.length >= 3) cancellationSetThree(context, 2),
  //     if (countList.length >= 4) cancellationSetFour(context, 3),
  //     if (countList.length >= 5) cancellationSetFive(context, 4),
  //     if (countList.length >= 6) cancellationSetSix(context, 5),

  //     // ListView.builder(
  //     //   shrinkWrap: true,
  //     //   scrollDirection: Axis.vertical,
  //     //   physics: ClampingScrollPhysics(),
  //     //   itemCount: cancellationWidget.length,
  //     //   itemBuilder: (context, index) {
  //     //     return cancellationWidget[index];
  //     //   },
  //     // ),

  //     // ..._dynamicSetTimeWidget(),

  //     if (warning == true)
  //       Padding(
  //           padding: EdgeInsetsDirectional.fromSTEB(
  //               SizeConfig.blockSizeVertical * 4,
  //               SizeConfig.blockSizeVertical * 3,
  //               0,
  //               0,),
  //           child: Column(children: [
  //             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
  //                 style: tt.TrymdTheme.of(context).bodyText1.override(
  //                       fontFamily: 'Nunito Sans',
  //                       color: Color.fromRGBO(255, 102, 102, 1),
  //                       fontSize: SizeConfig.blockSizeVertical * 2.2,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //               ),
  //             ]),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
  //               Text(
  //                 "Please fill the time properly",
  //                 textAlign: TextAlign.left,
  //                 style: tt.TrymdTheme.of(context).bodyText1.override(
  //                       fontFamily: 'Nunito Sans',
  //                       color: Color.fromRGBO(255, 102, 102, 1),
  //                       fontSize: SizeConfig.blockSizeVertical * 2,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //               ),
  //             ])
  //           ],),),

  //     InkWell(
  //       onTap: () {
  //         FocusScopeNode currentFocus = FocusScope.of(context);
  //         if (!currentFocus.hasPrimaryFocus) {
  //           currentFocus.unfocus();
  //         }
  //         updateCancelDetailsFun();
  //       },
  //       child: Padding(
  //           padding: EdgeInsetsDirectional.fromSTEB(
  //               SizeConfig.blockSizeHorizontal * 3,
  //               SizeConfig.blockSizeVertical * 3,
  //               SizeConfig.blockSizeHorizontal * 3,
  //               0,),
  //           child: Container(
  //             width: 250,
  //             height: 50,
  //             decoration: BoxDecoration(
  //               gradient: LinearGradient(
  //                 colors: [Color(0xFF3F8BFD), Color(0xFF07D0F2)],
  //                 stops: [0, 1],
  //                 begin: AlignmentDirectional(0.94, -1),
  //                 end: AlignmentDirectional(-0.94, 1),
  //               ),
  //               borderRadius: BorderRadius.circular(10,),
  //             ),
  //             child: Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0,),
  //               child: Text(
  //                 'Save',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   fontFamily: 'geometric sans-serif',
  //                   color: tt.TrymdTheme.of(context).tertiaryColor,
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //           ),),
  //     ),

  //     Padding(
  //         padding: EdgeInsetsDirectional.fromSTEB(
  //             SizeConfig.blockSizeHorizontal * 75,
  //             SizeConfig.blockSizeVertical * 5,
  //             0,
  //             0,),
  //         child: TextButton(
  //             onPressed: () {
  //               Navigator.pushReplacement(
  //                 context,
  //                 PageRouteBuilder(
  //                   pageBuilder: (context, animation1, animation2) =>
  //                       AcceptWidget(
  //                     vendorType: widget.vendorType,
  //                   ),
  //                   transitionDuration: Duration(seconds: 0,),
  //                 ),
  //               );
  //             },
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 Text(
  //                   'NEXT',
  //                   style: tt.TrymdTheme.of(context).bodyText1.override(
  //                         fontFamily: 'geometric sans-serif',
  //                         color: Color(0xFF000000,),
  //                         fontSize: SizeConfig.blockSizeVertical * 2.5,
  //                         fontWeight: FontWeight.w700,
  //                         useGoogleFonts: false,
  //                       ),
  //                 ),
  //                 SizedBox(width: 10,),
  //                 FaIcon(
  //                   FontAwesomeIcons.longArrowAltRight,
  //                   color: Color(0xFF000000,),
  //                   size: SizeConfig.blockSizeVertical * 2.5,
  //                 ),
  //               ],
  //             ),),),

  //     //      Align(
  //     //         alignment: Alignment.bottomRight,
  //     //         child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
  //     //           TextButton(
  //     //               onPressed: () {
  //     //                 Navigator.pushReplacement(
  //     //                   context,
  //     //                   PageRouteBuilder(
  //     //                     pageBuilder: (context, animation1, animation2) =>
  //     //                         AcceptWidget(
  //     //                       vendorType: widget.vendorType,
  //     //                     ),
  //     //                     transitionDuration: Duration(seconds: 0,),
  //     //                   ),
  //     //                 );
  //     //               },
  //     //               child: Text(
  //     //                 "NEXT",
  //     //                 style: TextStyle(
  //     //                   fontFamily: 'geometric sans-serif',
  //     //                   color: Color(0xFF000000,),
  //     //                   fontSize: SizeConfig.blockSizeVertical * 2,
  //     //                   fontWeight: FontWeight.bold,
  //     //                 ),
  //     //               ),),
  //     //           SizedBox(width: 5),
  //     //           FaIcon(
  //     //             FontAwesomeIcons.longArrowAltRight,
  //     //             color: Color(0xFF000000,),
  //     //             size: SizeConfig.blockSizeVertical * 2.5,
  //     //           ),
  //     //           SizedBox(width: 10,),
  //     //         ]),),),

  //     SizedBox(
  //       height: 20,
  //     ),

  //     Row(mainAxisAlignment: MainAxisAlignment.start, children: [
  //       Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 15),
  //           child: RichText(
  //             text: TextSpan(
  //               text: 'Note : ',
  //               style: TextStyle(
  //                   fontSize: SizeConfig.blockSizeVertical * 2,
  //                   height: 1.55,
  //                   color: Colors.grey,
  //                   fontFamily: 'geometric sans-serif',
  //                   fontWeight: FontWeight.bold),
  //               children: <TextSpan>[
  //                 TextSpan(text: " "),
  //                 TextSpan(
  //                     text:
  //                         "You can not remove Cancellation details \nonce added",
  //                     style: TextStyle(
  //                       height: 1.5,
  //                       fontSize: SizeConfig.blockSizeVertical * 1.8,
  //                       letterSpacing: 0.1,
  //                       color: Colors.grey,
  //                       fontFamily: 'geometric sans-serif',
  //                     ),),
  //               ],
  //             ),
  //           ),),
  //     ]),

  //     SizedBox(
  //       height: 50,
  //     ),
  //   ],),);
  // }

  // Widget accord(context, data) {}

  // Widget bankDet(index) {
  //   return Form(
  //       key: _form,
  //       child: Column(children: [
  //         Container(
  //             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
  //             margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0,),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(10,),
  //               ),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.white.withOpacity(0.1),
  //                   blurRadius: 10,
  //                   offset: Offset(0, 5),
  //                 ),
  //               ],
  //               border: Border.all(
  //                 color: Colors.white.withOpacity(0.05),
  //               ),
  //               // gradient: gradient,
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Container(
  //                     child: Row(children: [
  //                   Image.asset("assets/images/Card-Flags.png"),
  //                   SizedBox(
  //                     width: 10,
  //                   ),
  //                   Text(
  //                     "Bank Details",
  //                     style: TextStyle(
  //                       fontFamily: 'geometric sans-serif',
  //                       color: Colors.black,
  //                       fontSize: SizeConfig.blockSizeVertical * 2.2,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ],),),
  //                 // IconButton(
  //                 //   onPressed: () {
  //                 //     setState(() {
  //                 //       forbank = !forbank;
  //                 //     });
  //                 //   },
  //                 //   icon: forbank == true
  //                 //       ? Icon(Icons.keyboard_arrow_up)
  //                 //       : Icon(Icons.keyboard_arrow_down),
  //                 //   color: Colors.black,
  //                 // )
  //               ],
  //             ),),
  //         // if (forbank == true)
  //         Container(
  //             padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
  //             margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(10,),
  //               ),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.white.withOpacity(0.1),
  //                   blurRadius: 10,
  //                   offset: Offset(0, 5),
  //                 ),
  //               ],
  //               border: Border.all(
  //                 color: Colors.white.withOpacity(0.05),
  //               ),
  //               // gradient: gradient,
  //             ),
  //             child: Column(
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsetsDirectional.fromSTEB(
  //                       SizeConfig.blockSizeHorizontal * 3,
  //                       SizeConfig.blockSizeVertical * 4,
  //                       SizeConfig.blockSizeHorizontal * 3,
  //                       0,),
  //                   child: TextFormField(
  //                     obscureText: false,
  //                     controller: profName,
  //                     validator: (val) {
  //                       if (val == null || val.length == 0) {
  //                         return "please enter name";
  //                       } else {
  //                         return null;
  //                       }
  //                     },
  //                     decoration: InputDecoration(
  //                       labelText: 'Professional Name*',
  //                       labelStyle: TextStyle(
  //                           color: Color(0xFF000000,),
  //                           fontFamily: 'geometric sans-serif'),
  //                       enabledBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Color(0xFFE5E5E5),
  //                           width: 1,
  //                         ),
  //                         borderRadius: BorderRadius.circular(10,),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Color(0xFFE5E5E5),
  //                           width: 1,
  //                         ),
  //                         borderRadius: BorderRadius.circular(10,),
  //                       ),
  //                     ),
  //                     style: TextStyle(
  //                       fontFamily: 'geometric sans-serif',
  //                       color: Color(0xFF000000,),
  //                       fontSize: SizeConfig.blockSizeVertical * 1.8,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsetsDirectional.fromSTEB(
  //                       SizeConfig.blockSizeHorizontal * 3,
  //                       SizeConfig.blockSizeVertical * 3,
  //                       SizeConfig.blockSizeHorizontal * 3,
  //                       0,),
  //                   child: TextFormField(
  //                     obscureText: false,
  //                     controller: accName,
  //                     validator: (val) {
  //                       if (val == null || val.length == 0) {
  //                         return "please enter Account holder name";
  //                       } else {
  //                         return null;
  //                       }
  //                     },
  //                     decoration: InputDecoration(
  //                       labelText: 'Account Name*',
  //                       labelStyle: TextStyle(
  //                           color: Color(0xFF000000,),
  //                           fontFamily: 'geometric sans-serif'),
  //                       enabledBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Color(0xFFE5E5E5),
  //                           width: 1,
  //                         ),
  //                         borderRadius: BorderRadius.circular(10,),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Color(0xFFE5E5E5),
  //                           width: 1,
  //                         ),
  //                         borderRadius: BorderRadius.circular(10,),
  //                       ),
  //                     ),
  //                     style: TextStyle(
  //                       fontFamily: 'geometric sans-serif',
  //                       color: Color(0xFF000000,),
  //                       fontSize: SizeConfig.blockSizeVertical * 1.8,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsetsDirectional.fromSTEB(
  //                       SizeConfig.blockSizeHorizontal * 3,
  //                       SizeConfig.blockSizeVertical * 3,
  //                       SizeConfig.blockSizeHorizontal * 3,
  //                       0,),
  //                   child: TextFormField(
  //                     obscureText: false,
  //                     controller: accNumber,
  //                     validator: (val) {
  //                       if (val == null || val.length == 0) {
  //                         return "please enter Account number";
  //                       } else if (val.length != 16) {
  //                         return null;
  //                       }
  //                     },
  //                     keyboardType: TextInputType.number,
  //                     inputFormatters: [
  //                       FilteringTextInputFormatter.digitsOnly,
  //                       new LengthLimitingTextInputFormatter(16),
  //                     ],
  //                     decoration: InputDecoration(
  //                       labelText: 'Account Number*',
  //                       labelStyle: TextStyle(
  //                           color: Color(0xFF000000,),
  //                           fontFamily: 'geometric sans-serif'),
  //                       enabledBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Color(0xFFE5E5E5),
  //                           width: 1,
  //                         ),
  //                         borderRadius: BorderRadius.circular(10,),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Color(0xFFE5E5E5),
  //                           width: 1,
  //                         ),
  //                         borderRadius: BorderRadius.circular(10,),
  //                       ),
  //                     ),
  //                     style: TextStyle(
  //                       fontFamily: 'geometric sans-serif',
  //                       color: Color(0xFF000000,),
  //                       fontSize: SizeConfig.blockSizeVertical * 1.8,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsetsDirectional.fromSTEB(
  //                       SizeConfig.blockSizeHorizontal * 3,
  //                       SizeConfig.blockSizeVertical * 3,
  //                       SizeConfig.blockSizeHorizontal * 3,
  //                       0,),
  //                   child: TextFormField(
  //                     obscureText: false,
  //                     controller: ifscCode,
  //                     validator: (val) {
  //                       if (val == null || val.length == 0) {
  //                         return "please enter IFSC Code";
  //                       } else if (val.length != 16) {
  //                         return null;
  //                       }
  //                     },
  //                     decoration: InputDecoration(
  //                       labelText: 'IFSC Code*',
  //                       labelStyle: TextStyle(
  //                           color: Color(0xFF000000,),
  //                           fontFamily: 'geometric sans-serif'),
  //                       enabledBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Color(0xFFE5E5E5),
  //                           width: 1,
  //                         ),
  //                         borderRadius: BorderRadius.circular(10,),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Color(0xFFE5E5E5),
  //                           width: 1,
  //                         ),
  //                         borderRadius: BorderRadius.circular(10,),
  //                       ),
  //                     ),
  //                     style: TextStyle(
  //                       fontFamily: 'geometric sans-serif',
  //                       color: Color(0xFF000000,),
  //                       fontSize: SizeConfig.blockSizeVertical * 1.8,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsetsDirectional.fromSTEB(
  //                       SizeConfig.blockSizeHorizontal * 3,
  //                       SizeConfig.blockSizeVertical * 3,
  //                       SizeConfig.blockSizeHorizontal * 3,
  //                       0,),
  //                   child: TextFormField(
  //                     obscureText: false,
  //                     controller: accType,
  //                     decoration: InputDecoration(
  //                       labelText: 'Account Type*',
  //                       labelStyle: TextStyle(
  //                           color: Color(0xFF000000,),
  //                           fontFamily: 'geometric sans-serif'),
  //                       enabledBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Color(0xFFE5E5E5),
  //                           width: 1,
  //                         ),
  //                         borderRadius: BorderRadius.circular(10,),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Color(0xFFE5E5E5),
  //                           width: 1,
  //                         ),
  //                         borderRadius: BorderRadius.circular(10,),
  //                       ),
  //                     ),
  //                     style: TextStyle(
  //                       fontFamily: 'geometric sans-serif',
  //                       color: Color(0xFF000000,),
  //                       fontSize: SizeConfig.blockSizeVertical * 1.8,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                     padding: EdgeInsetsDirectional.fromSTEB(
  //                         SizeConfig.blockSizeHorizontal * 3,
  //                         SizeConfig.blockSizeVertical * 3,
  //                         SizeConfig.blockSizeHorizontal * 3,
  //                         0,),
  //                     child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(10,),
  //                       child: Stack(
  //                         children: <Widget>[
  //                           Positioned.fill(
  //                             child: Container(
  //                               width: SizeConfig.blockSizeHorizontal * 85,
  //                               height: SizeConfig.blockSizeVertical * 6,
  //                               decoration: const BoxDecoration(
  //                                 gradient: LinearGradient(
  //                                   colors: <Color>[
  //                                     Color(0xFF07D0F2),
  //                                     Color(0xFF95EBF9),
  //                                   ],
  //                                   stops: [0, 1],
  //                                   begin: AlignmentDirectional(1, 1),
  //                                   end: AlignmentDirectional(0, 0,),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           TextButton(
  //                             style: TextButton.styleFrom(
  //                               padding: const EdgeInsets.symmetric(
  //                                   horizontal: 95, vertical: 18),
  //                               primary: Colors.white,
  //                               textStyle: const TextStyle(fontSize: 20,),
  //                             ),
  //                             onPressed: () {
  //                               FocusScopeNode currentFocus =
  //                                   FocusScope.of(context);
  //                               if (!currentFocus.hasPrimaryFocus) {
  //                                 currentFocus.unfocus();
  //                               }
  //                               if (_form.currentState.validate()) {
  //                                 var vendorId = storage.getItem("vendor_id");
  //                                 var json = jsonEncode({
  //                                   "professional_id": vendorId,
  //                                   "professional_name": profName.text,
  //                                   "account_name": accName.text,
  //                                   "account_number": accNumber.text,
  //                                   "ifsc_code": ifscCode.text,
  //                                   "account_type": accType.text
  //                                 });

  //                                 updateBankDetailsFun(json);
  //                               }
  //                             },
  //                             child: Text(
  //                               'Save',
  //                               textAlign: TextAlign.center,
  //                               style: tt.TrymdTheme.of(context)
  //                                   .bodyText1
  //                                   .override(
  //                                     fontFamily: 'geometric sans-serif',
  //                                     color: Color(0xFFFFFFFF),
  //                                     fontSize:
  //                                         SizeConfig.blockSizeVertical * 2,
  //                                     fontWeight: FontWeight.w700,
  //                                     useGoogleFonts: false,
  //                                   ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),),
  //               ],
  //             ))
  //       ],),);
  // }

// cancellation one
  // Widget cancellationSetOne(context, index) {
  //   bool col = false;
  //   return StatefulBuilder(// You need this, notice the parameters below:
  //       builder: (BuildContext context, StateSetter setState) {
  //     return Row(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   SizeConfig.blockSizeHorizontal * 6,
  //                   SizeConfig.blockSizeVertical * 1.7,
  //                   0,
  //                   0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 8,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               10, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6.5,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 // cancelLisst[index].add(val);
  //                                 beforeSetOne = val;
  //                               },
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                               ],
  //                               decoration: InputDecoration(
  //                                   enabledBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   focusedBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   contentPadding:
  //                                       EdgeInsets.symmetric(horizontal: 10,),),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 5,
  //                               SizeConfig.blockSizeVertical * 0.2,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 10,
  //                             height: SizeConfig.blockSizeVertical * 2,
  //                             decoration:
  //                                 BoxDecoration(color: Colors.transparent),
  //                             child: Text(
  //                               'Before',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         Padding(
  //           padding: EdgeInsetsDirectional.fromSTEB(
  //               SizeConfig.blockSizeHorizontal * 2.6,
  //               SizeConfig.blockSizeVertical * 2,
  //               0,
  //               0,),
  //           child: TrymdPartnerDropDown(
  //             options: ['Hours', 'Mins'].toList(),
  //             onChanged: (val) {
  //               setState(() {
  //                 timeSetOne = val;
  //               });
  //               // cancelLisst[index].add(selectedHours);
  //             },
  //             width: SizeConfig.blockSizeHorizontal * 25,
  //             height: SizeConfig.blockSizeVertical * 6.5,
  //             textStyle: TextStyle(
  //               fontFamily: 'geometric sans-serif',
  //               color: Color(0xFF0B2F45),
  //             ),
  //             icon: Icon(
  //               Icons.arrow_drop_down,
  //               color: Color(0xFF0B2F45),
  //               size: SizeConfig.blockSizeVertical * 3,
  //             ),
  //             fillColor: Colors.white,
  //             elevation: 2,
  //             borderColor: Color(0xFFE5E5E5),
  //             borderWidth: 1,
  //             borderRadius: 10,
  //             margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
  //             hidesUnderline: true,
  //           ),
  //         ),
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   0, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 8,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 2.6,
  //                               SizeConfig.blockSizeVertical * 1.5,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6,
  //                             padding: EdgeInsets.symmetric(horizontal: 10,),
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: col == true
  //                                     ? Colors.red
  //                                     : Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                                 new LengthLimitingTextInputFormatter(3),
  //                               ],
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 // cancelLisst[index].add(val);
  //                                 deductedSetOne = val;
  //                                 if (int.parse(val) > 100) {
  //                                   setState(() {
  //                                     col = true;
  //                                   });
  //                                 } else {
  //                                   setState(() {
  //                                     col = false;
  //                                   });
  //                                 }
  //                               },
  //                               decoration: InputDecoration(
  //                                 contentPadding:
  //                                     EdgeInsets.symmetric(horizontal: 10,),
  //                                 enabledBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                                 focusedBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                               ),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 3,
  //                               SizeConfig.blockSizeVertical * 0,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             // width: SizeConfig.blockSizeHorizontal * 19,
  //                             // height: SizeConfig.blockSizeVertical * 2,
  //                             decoration: BoxDecoration(
  //                               color: Colors.transparent,
  //                             ),
  //                             child: Text(
  //                               '% Deducted',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color:
  //                                     col == true ? Colors.red : Colors.black,
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );
  //   });
  // }

// cancellation Two
  // Widget cancellationSetTwo(context, index) {
  //   bool col = false;
  //   return StatefulBuilder(// You need this, notice the parameters below:
  //       builder: (BuildContext context, StateSetter setState) {
  //     return Row(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   SizeConfig.blockSizeHorizontal * 6,
  //                   SizeConfig.blockSizeVertical * 1.7,
  //                   0,
  //                   0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 8,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               10, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6.5,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 // cancelLisst[index].add(val);
  //                                 beforeSetTwo = val;
  //                               },
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                               ],
  //                               decoration: InputDecoration(
  //                                   enabledBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   focusedBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   contentPadding:
  //                                       EdgeInsets.symmetric(horizontal: 10,),),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Colors.black,
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 5,
  //                               SizeConfig.blockSizeVertical * 0.2,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 10,
  //                             height: SizeConfig.blockSizeVertical * 2,
  //                             decoration:
  //                                 BoxDecoration(color: Colors.transparent),
  //                             child: Text(
  //                               'Before',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Colors.black,
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         Padding(
  //           padding: EdgeInsetsDirectional.fromSTEB(
  //               SizeConfig.blockSizeHorizontal * 2.6,
  //               SizeConfig.blockSizeVertical * 2,
  //               0,
  //               0,),
  //           child: TrymdPartnerDropDown(
  //             options: ['Hours', 'Mins'].toList(),
  //             onChanged: (val) {
  //               setState(() {
  //                 timeSetTwo = val;
  //               });
  //               // cancelLisst[index].add(selectedHours);
  //             },
  //             width: SizeConfig.blockSizeHorizontal * 25,
  //             height: SizeConfig.blockSizeVertical * 6.5,
  //             textStyle: TextStyle(
  //               fontFamily: 'geometric sans-serif',
  //               color: Color(0xFF0B2F45),
  //             ),
  //             icon: Icon(
  //               Icons.arrow_drop_down,
  //               color: Color(0xFF0B2F45),
  //               size: SizeConfig.blockSizeVertical * 3,
  //             ),
  //             fillColor: Colors.white,
  //             elevation: 2,
  //             borderColor: Color(0xFFE5E5E5),
  //             borderWidth: 1,
  //             borderRadius: 10,
  //             margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
  //             hidesUnderline: true,
  //           ),
  //         ),
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   0, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 7,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 2.6,
  //                               SizeConfig.blockSizeVertical * 1,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6.5,
  //                             padding: EdgeInsets.symmetric(horizontal: 10,),
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                               ],
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 deductedSetTwo = val;
  //                                 if (int.parse(val) > 100) {
  //                                   setState(() {
  //                                     col = true;
  //                                   });
  //                                 } else {
  //                                   setState(() {
  //                                     col = false;
  //                                   });
  //                                 }
  //                                 // cancelLisst[index].add(val);
  //                               },
  //                               decoration: InputDecoration(
  //                                 contentPadding:
  //                                     EdgeInsets.symmetric(horizontal: 10,),
  //                                 enabledBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                                 focusedBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                               ),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 5,
  //                               SizeConfig.blockSizeVertical * 0.2,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 19,
  //                             height: SizeConfig.blockSizeVertical * 2,
  //                             decoration: BoxDecoration(
  //                               color: Colors.transparent,
  //                             ),
  //                             child: Text(
  //                               '% Deducted',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Colors.black,
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );
  //   });
  // }

// cancellation Three
  // Widget cancellationSetThree(context, index) {
  //   bool col = false;
  //   return StatefulBuilder(// You need this, notice the parameters below:
  //       builder: (BuildContext context, StateSetter setState) {
  //     return Row(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   SizeConfig.blockSizeHorizontal * 6,
  //                   SizeConfig.blockSizeVertical * 1.7,
  //                   0,
  //                   0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 8,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               10, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6.5,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 // cancelLisst[index].add(val);
  //                                 beforeSetThree = val;
  //                               },
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                               ],
  //                               decoration: InputDecoration(
  //                                   enabledBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   focusedBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   contentPadding:
  //                                       EdgeInsets.symmetric(horizontal: 10,),),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 5,
  //                               SizeConfig.blockSizeVertical * 0.2,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 10,
  //                             height: SizeConfig.blockSizeVertical * 2,
  //                             decoration:
  //                                 BoxDecoration(color: Colors.transparent),
  //                             child: Text(
  //                               'Before',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         Padding(
  //           padding: EdgeInsetsDirectional.fromSTEB(
  //               SizeConfig.blockSizeHorizontal * 2.6,
  //               SizeConfig.blockSizeVertical * 2,
  //               0,
  //               0,),
  //           child: TrymdPartnerDropDown(
  //             options: ['Hours', 'Mins'].toList(),
  //             onChanged: (val) {
  //               setState(() {
  //                 timeSetThree = val;
  //               });
  //               // cancelLisst[index].add(selectedHours);
  //             },
  //             width: SizeConfig.blockSizeHorizontal * 25,
  //             height: SizeConfig.blockSizeVertical * 6.5,
  //             textStyle: TextStyle(
  //               fontFamily: 'geometric sans-serif',
  //               color: Color(0xFF0B2F45),
  //             ),
  //             icon: Icon(
  //               Icons.arrow_drop_down,
  //               color: Color(0xFF0B2F45),
  //               size: SizeConfig.blockSizeVertical * 3,
  //             ),
  //             fillColor: Colors.white,
  //             elevation: 2,
  //             borderColor: Color(0xFFE5E5E5),
  //             borderWidth: 1,
  //             borderRadius: 10,
  //             margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
  //             hidesUnderline: true,
  //           ),
  //         ),
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   0, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 7,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 2.6,
  //                               SizeConfig.blockSizeVertical * 1,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6.5,
  //                             padding: EdgeInsets.symmetric(horizontal: 10,),
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                               ],
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 deductedSetThree = val;
  //                                 if (int.parse(val) > 100) {
  //                                   setState(() {
  //                                     col = true;
  //                                   });
  //                                 } else {
  //                                   setState(() {
  //                                     col = false;
  //                                   });
  //                                 }
  //                                 // cancelLisst[index].add(val);
  //                               },
  //                               decoration: InputDecoration(
  //                                 contentPadding:
  //                                     EdgeInsets.symmetric(horizontal: 10,),
  //                                 enabledBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                                 focusedBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                               ),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 5,
  //                               SizeConfig.blockSizeVertical * 0.2,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 19,
  //                             height: SizeConfig.blockSizeVertical * 2,
  //                             decoration: BoxDecoration(
  //                               color: Colors.transparent,
  //                             ),
  //                             child: Text(
  //                               '% Deducted',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Colors.black,
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );
  //   });
  // }

// cancellation Four
  // Widget cancellationSetFour(context, index) {
  //   bool col = false;
  //   return StatefulBuilder(// You need this, notice the parameters below:
  //       builder: (BuildContext context, StateSetter setState) {
  //     return Row(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   SizeConfig.blockSizeHorizontal * 6,
  //                   SizeConfig.blockSizeVertical * 1.7,
  //                   0,
  //                   0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 8,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               10, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6.5,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 // cancelLisst[index].add(val);
  //                                 beforeSetFour = val;
  //                               },
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                               ],
  //                               decoration: InputDecoration(
  //                                   enabledBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   focusedBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   contentPadding:
  //                                       EdgeInsets.symmetric(horizontal: 10,),),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 5,
  //                               SizeConfig.blockSizeVertical * 0.2,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 10,
  //                             height: SizeConfig.blockSizeVertical * 2,
  //                             decoration:
  //                                 BoxDecoration(color: Colors.transparent),
  //                             child: Text(
  //                               'Before',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         Padding(
  //           padding: EdgeInsetsDirectional.fromSTEB(
  //               SizeConfig.blockSizeHorizontal * 2.6,
  //               SizeConfig.blockSizeVertical * 2,
  //               0,
  //               0,),
  //           child: TrymdPartnerDropDown(
  //             options: ['Hours', 'Mins'].toList(),
  //             onChanged: (val) {
  //               setState(() {
  //                 timeSetFour = val;
  //               });
  //               // cancelLisst[index].add(selectedHours);
  //             },
  //             width: SizeConfig.blockSizeHorizontal * 25,
  //             height: SizeConfig.blockSizeVertical * 6.5,
  //             textStyle: TextStyle(
  //               fontFamily: 'geometric sans-serif',
  //               color: Color(0xFF0B2F45),
  //             ),
  //             icon: Icon(
  //               Icons.arrow_drop_down,
  //               color: Color(0xFF0B2F45),
  //               size: SizeConfig.blockSizeVertical * 3,
  //             ),
  //             fillColor: Colors.white,
  //             elevation: 2,
  //             borderColor: Color(0xFFE5E5E5),
  //             borderWidth: 1,
  //             borderRadius: 10,
  //             margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
  //             hidesUnderline: true,
  //           ),
  //         ),
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   0, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 7,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 2.6,
  //                               SizeConfig.blockSizeVertical * 1,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6.5,
  //                             padding: EdgeInsets.symmetric(horizontal: 10,),
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                               ],
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 deductedSetFour = val;
  //                                 if (int.parse(val) > 100) {
  //                                   setState(() {
  //                                     col = true;
  //                                   });
  //                                 } else {
  //                                   setState(() {
  //                                     col = false;
  //                                   });
  //                                 }
  //                                 // cancelLisst[index].add(val);
  //                               },
  //                               decoration: InputDecoration(
  //                                 contentPadding:
  //                                     EdgeInsets.symmetric(horizontal: 10,),
  //                                 enabledBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                                 focusedBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                               ),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 5,
  //                               SizeConfig.blockSizeVertical * 0.2,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 19,
  //                             height: SizeConfig.blockSizeVertical * 2,
  //                             decoration: BoxDecoration(
  //                               color: Colors.transparent,
  //                             ),
  //                             child: Text(
  //                               '% Deducted',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Colors.black,
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );
  //   });
  // }

// cancellation Five
  // Widget cancellationSetFive(context, index) {
  //   bool col = false;
  //   return StatefulBuilder(// You need this, notice the parameters below:
  //       builder: (BuildContext context, StateSetter setState) {
  //     return Row(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   SizeConfig.blockSizeHorizontal * 6,
  //                   SizeConfig.blockSizeVertical * 1.7,
  //                   0,
  //                   0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 8,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               10, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6.5,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 // cancelLisst[index].add(val);
  //                                 beforeSetFive = val;
  //                               },
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                               ],
  //                               decoration: InputDecoration(
  //                                   enabledBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   focusedBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   contentPadding:
  //                                       EdgeInsets.symmetric(horizontal: 10,),),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 5,
  //                               SizeConfig.blockSizeVertical * 0.2,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 10,
  //                             height: SizeConfig.blockSizeVertical * 2,
  //                             decoration:
  //                                 BoxDecoration(color: Colors.transparent),
  //                             child: Text(
  //                               'Before',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         Padding(
  //           padding: EdgeInsetsDirectional.fromSTEB(
  //               SizeConfig.blockSizeHorizontal * 2.6,
  //               SizeConfig.blockSizeVertical * 2,
  //               0,
  //               0,),
  //           child: TrymdPartnerDropDown(
  //             options: ['Hours', 'Mins'].toList(),
  //             onChanged: (val) {
  //               setState(() {
  //                 timeSetFive = val;
  //               });
  //               // cancelLisst[index].add(selectedHours);
  //             },
  //             width: SizeConfig.blockSizeHorizontal * 25,
  //             height: SizeConfig.blockSizeVertical * 6.5,
  //             textStyle: TextStyle(
  //               fontFamily: 'geometric sans-serif',
  //               color: Color(0xFF0B2F45),
  //             ),
  //             icon: Icon(
  //               Icons.arrow_drop_down,
  //               color: Color(0xFF0B2F45),
  //               size: SizeConfig.blockSizeVertical * 3,
  //             ),
  //             fillColor: Colors.white,
  //             elevation: 2,
  //             borderColor: Color(0xFFE5E5E5),
  //             borderWidth: 1,
  //             borderRadius: 10,
  //             margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
  //             hidesUnderline: true,
  //           ),
  //         ),
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   0, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 7,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 2.6,
  //                               SizeConfig.blockSizeVertical * 1,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6.5,
  //                             padding: EdgeInsets.symmetric(horizontal: 10,),
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                               ],
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 deductedSetFive = val;
  //                                 if (int.parse(val) > 100) {
  //                                   setState(() {
  //                                     col = true;
  //                                   });
  //                                 } else {
  //                                   setState(() {
  //                                     col = false;
  //                                   });
  //                                 }
  //                                 // cancelLisst[index].add(val);
  //                               },
  //                               decoration: InputDecoration(
  //                                 contentPadding:
  //                                     EdgeInsets.symmetric(horizontal: 10,),
  //                                 enabledBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                                 focusedBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                               ),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 5,
  //                               SizeConfig.blockSizeVertical * 0.2,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 19,
  //                             height: SizeConfig.blockSizeVertical * 2,
  //                             decoration: BoxDecoration(
  //                               color: Colors.transparent,
  //                             ),
  //                             child: Text(
  //                               '% Deducted',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Colors.black,
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );
  //   });
  // }

// cancellation Six
  // Widget cancellationSetSix(context, index) {
  //   bool col = false;
  //   return StatefulBuilder(// You need this, notice the parameters below:
  //       builder: (BuildContext context, StateSetter setState) {
  //     return Row(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   SizeConfig.blockSizeHorizontal * 6,
  //                   SizeConfig.blockSizeVertical * 1.7,
  //                   0,
  //                   0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 8,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               10, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6.5,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 // cancelLisst[index].add(val);
  //                                 beforeSetSix = val;
  //                               },
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                               ],
  //                               decoration: InputDecoration(
  //                                   enabledBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   focusedBorder: UnderlineInputBorder(
  //                                     borderSide: BorderSide(
  //                                       color: Color(0x00000000,),
  //                                       width: 1,
  //                                     ),
  //                                     borderRadius: const BorderRadius.only(
  //                                       topLeft: Radius.circular(4.0,),
  //                                       topRight: Radius.circular(4.0,),
  //                                     ),
  //                                   ),
  //                                   contentPadding:
  //                                       EdgeInsets.symmetric(horizontal: 10,),),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 5,
  //                               SizeConfig.blockSizeVertical * 0.2,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 10,
  //                             height: SizeConfig.blockSizeVertical * 2,
  //                             decoration:
  //                                 BoxDecoration(color: Colors.transparent),
  //                             child: Text(
  //                               'Before',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         Padding(
  //           padding: EdgeInsetsDirectional.fromSTEB(
  //               SizeConfig.blockSizeHorizontal * 2.6,
  //               SizeConfig.blockSizeVertical * 2,
  //               0,
  //               0,),
  //           child: TrymdPartnerDropDown(
  //             options: ['Hours', 'Mins'].toList(),
  //             onChanged: (val) {
  //               setState(() {
  //                 timeSetSix = val;
  //               });
  //               // cancelLisst[index].add(selectedHours);
  //             },
  //             width: SizeConfig.blockSizeHorizontal * 25,
  //             height: SizeConfig.blockSizeVertical * 6.5,
  //             textStyle: TextStyle(
  //               fontFamily: 'geometric sans-serif',
  //               color: Color(0xFF0B2F45),
  //             ),
  //             icon: Icon(
  //               Icons.arrow_drop_down,
  //               color: Color(0xFF0B2F45),
  //               size: SizeConfig.blockSizeVertical * 3,
  //             ),
  //             fillColor: Colors.white,
  //             elevation: 2,
  //             borderColor: Color(0xFFE5E5E5),
  //             borderWidth: 1,
  //             borderRadius: 10,
  //             margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
  //             hidesUnderline: true,
  //           ),
  //         ),
  //         Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(
  //                   0, SizeConfig.blockSizeVertical * 1, 0, 0,),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Container(
  //                     height: SizeConfig.blockSizeVertical * 7,
  //                     child: Stack(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 2.6,
  //                               SizeConfig.blockSizeVertical * 1,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 25,
  //                             height: SizeConfig.blockSizeVertical * 6.5,
  //                             padding: EdgeInsets.symmetric(horizontal: 10,),
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10,),
  //                               border: Border.all(
  //                                 color: Color(0xFFE5E5E5),
  //                                 width: 1,
  //                               ),
  //                             ),
  //                             child: TextFormField(
  //                               keyboardType: TextInputType.number,
  //                               inputFormatters: [
  //                                 FilteringTextInputFormatter.digitsOnly,
  //                               ],
  //                               obscureText: false,
  //                               onChanged: (val) {
  //                                 deductedSetSix = val;
  //                                 if (int.parse(val) > 100) {
  //                                   setState(() {
  //                                     col = true;
  //                                   });
  //                                 } else {
  //                                   setState(() {
  //                                     col = false;
  //                                   });
  //                                 }
  //                                 // cancelLisst[index].add(val);
  //                               },
  //                               decoration: InputDecoration(
  //                                 contentPadding:
  //                                     EdgeInsets.symmetric(horizontal: 10,),
  //                                 enabledBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                                 focusedBorder: UnderlineInputBorder(
  //                                   borderSide: BorderSide(
  //                                     color: Color(0x00000000,),
  //                                     width: 1,
  //                                   ),
  //                                   borderRadius: const BorderRadius.only(
  //                                     topLeft: Radius.circular(4.0,),
  //                                     topRight: Radius.circular(4.0,),
  //                                   ),
  //                                 ),
  //                               ),
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Color(0xFF0B2F45),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(
  //                               SizeConfig.blockSizeHorizontal * 5,
  //                               SizeConfig.blockSizeVertical * 0.2,
  //                               0,
  //                               0,),
  //                           child: Container(
  //                             width: SizeConfig.blockSizeHorizontal * 19,
  //                             height: SizeConfig.blockSizeVertical * 2,
  //                             decoration: BoxDecoration(
  //                               color: Colors.transparent,
  //                             ),
  //                             child: Text(
  //                               '% Deducted',
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontFamily: 'geometric sans-serif',
  //                                 color: Colors.black,
  //                                 fontSize: SizeConfig.blockSizeVertical * 1.5,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );
  //   });
  // }

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
    setState(() {});
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

  updateslots(serviceid, slot, duration, fee, tax, total) async {
    var vendorId = storage.getItem("vendor_id");
    var jsonBody = jsonEncode({
      "professional_id": vendorId,
      "data": [
        {
          "service_id": serviceid,
          "slot": slot,
          "duration": duration,
          "time": "mins",
          "fee": fee,
          "tax": tax,
          "total ": total
        }
      ]
    });

    var response =
        await UpdateBankDetails().updateSlotsDetailsResponse(jsonBody);
    if (response['status'] == 1) {
      _globalWidget.toastMessage('Bank Details Updated Successfully');
    } else {
      _globalWidget.toastMessage('Could not update Bank Details');
    }
  }

  // updateBankDetailsFun(jsondata) async {
  //   var jsond = jsonDecode(jsondata);
  //   print(jsond);
  //   var response = await UpdateBankDetails().updateBankDetailsResponse(jsond);
  //   if (response['status'] == 1) {
  //     Fluttertoast.showToast(
  //         msg: "Slot details updated",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.SNACKBAR,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.black54,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: "Could not update slot details",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.SNACKBAR,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.black54,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }
  // }

  // updateCancelDetailsFun() async {
  //   data = [
  //     [beforeSetOne, timeSetOne, deductedSetOne],
  //     [beforeSetTwo, timeSetTwo, deductedSetTwo],
  //     [beforeSetThree, timeSetThree, deductedSetThree],
  //     [beforeSetFour, timeSetFour, deductedSetFour],
  //     [beforeSetFive, timeSetFive, deductedSetFive],
  //     [beforeSetSix, timeSetSix, deductedSetSix]
  //   ];
  //   List datum = [];
  //   for (int i = 0; i < data.length; i++) {
  //     if (data[i].length != 0) {
  //       if (data[i][0] != "" || data[i][1] != "" || data[i][2] != "") {
  //         datum.add(data[i],);
  //       }
  //     }
  //   }

  //   if (datum.length == 0) {
  //     setState(() {
  //       warning = true;
  //     });
  //   } else {
  //     setState(() {
  //       warning = false;
  //     });
  //     var id = storage.getItem("vendor_id");
  //     var json = jsonEncode({"professional_id": id, "data": datum});
  //     var response =
  //         await UpdateBankDetails().updateCancellationDetailsResponse(json);
  //     if (response['status'] == 1) {
  //       Fluttertoast.showToast(
  //           msg: "Details updated successfully",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.SNACKBAR,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.black54,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: "Something went wrong",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.SNACKBAR,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.black54,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     }
  //   }
  // }
}
