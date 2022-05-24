import 'dart:convert';
// import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:trymd_partner/accountsetup/accountcancel.dart';
import 'package:trymd_partner/accountsetup/accountsetbank.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_drop_down.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/trymd_partner_drop_down.dart';
import 'package:trymd_partner/operation_details/operational_details.dart';
// import 'package:dotted_line/dotted_line.dart';
// import '../trymd_flow/trymd_theme.dart' as tt;
import 'package:flutter/material.dart';
// import 'package:trymd_partner/trymd_flow/flutter_flow_drop_down.dart';
import '../repository/selections.dart';
import '../repository/updatebankdetails.dart';
import '../sizer.dart';
// import 'accept_widget.dart';
import 'colorLoader.dart';
// import 'package:line_icons/line_icons.dart';

class AccountSetupWidget extends StatefulWidget {
  final vendorType;
  AccountSetupWidget({this.vendorType});

  @override
  _AccountSetupWidgetState createState() => _AccountSetupWidgetState();
}

class _AccountSetupWidgetState extends State<AccountSetupWidget>
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
  bool bigShow = false;

  TextEditingController slots = TextEditingController();
  bool showLable = false;
  bool showLable2 = false;
  int duro = 0;

  List listVariable = [];
  List completedList = [];

  Future<bool> _onBackButtonPressed() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            OperationalDetailsWidget(
          vendorType: widget.vendorType,
        ),
        transitionDuration: Duration(seconds: 0),
      ),
    );
    return false;
  }

  @override
  void initState() {
    super.initState();
    getSelectedServices();
    getSlotsDurations();
    List d = storage.getItem("completedList");
    if (d != null) {
      completedList = d;
    }
    // bankDetailsWidget.add(bankDet(context, 0));
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
                          OperationalDetailsWidget(
                              vendorType: widget.vendorType),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black,
                  size: SizeConfig.blockSizeVertical * 5,
                )),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 11, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
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
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xFFDFE1E7),
                ),

                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 11, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time Slot',
                          style: TextStyle(
                            fontFamily: 'geometric sans-serif',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (bigShow == true)
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: TrymdPartnerDropDownOne(
                                options: slotDurations,
                                onChanged: (val) {
                                  setState(() {
                                    duration = val;
                                    completedList = [];
                                    storage.getItem("completedList");
                                  });
                                },
                                height: SizeConfig.blockSizeVertical * 5,
                                width: SizeConfig.blockSizeHorizontal * 24,
                                textStyle: TextStyle(
                                  fontFamily: "geometric sans-serif",
                                  color: Colors.black54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 22,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.grey[350],
                                elevation: 0,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 5,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              )),
                        if (bigShow == false)
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              height: SizeConfig.blockSizeVertical * 5,
                              width: SizeConfig.blockSizeHorizontal * 24,
                              decoration: BoxDecoration(
                                color: Colors.grey[350],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ))
                      ],
                    )),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(height: 20),
                if (empty == true)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.15,
                        vertical: MediaQuery.of(context).size.height * 0.2),
                    child: Column(
                      children: [
                        ColorLoader(),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Service is Empty",
                          style: TextStyle(
                            fontFamily: 'geometric sans-serif',
                            color: Colors.grey[300],
                            fontSize: SizeConfig.blockSizeVertical * 2,
                            fontWeight: FontWeight.bold,
                            // useGoogleFonts: false,
                          ),
                        ),
                      ],
                    ),
                  ),

                SizedBox(
                  height: 10,
                ),

                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: servicesList.length,
                  itemBuilder: (context, index1) {
                    return containerServiceName(
                      servicesList[index1],
                    );
                  },
                ),

                SizedBox(height: 20),

                if (completedList.length != 0)
                  Column(children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          SizeConfig.blockSizeHorizontal * 4,
                          SizeConfig.blockSizeVertical * 5,
                          1,
                          0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Service Details",
                            style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                fontSize: SizeConfig.blockSizeVertical * 2,
                                height: 1.55,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              if (completedList.length != servicesList.length) {
                                _globalWidget.toastMessage(
                                    'Kindly fill all the service details');
                              } else if (completedList.length ==
                                  servicesList.length) {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            BankAccountSetupWidget(
                                                vendorType: widget.vendorType),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                );
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
                                        color: Color(0xFF000000),
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2.5,
                                        fontWeight: FontWeight.w700,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                SizedBox(width: 10),
                                FaIcon(
                                  FontAwesomeIcons.longArrowAltRight,
                                  color: Color(0xFF000000),
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: completedList.length,
                      itemBuilder: (context, index1) {
                        print(index1);
                        return containerCompletedWidget(
                          completedList[index1],
                        );
                      },
                    )),
                  ]),

                SizedBox(height: 40)

                // for (int i = 0; i < servicesList.length; i++)
                //     accord(context, servicesList[i])

                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: ClampingScrollPhysics(),
                //   itemCount: servicesList[i]['labeltags'].length,
                //   itemBuilder: (context, index) {
                //     return accord(
                //         context, servicesList[i]['labeltags'][index],);
                //   },
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget accord(context, data) {
    TextEditingController slots = TextEditingController();
    int duro = 0;
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
      return Form(
          key: _form2,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data['sp_name'],
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeVertical * 2.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Time Slot',
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: TrymdPartnerDropDownOne(
                                options: slotDurations,
                                onChanged: (val) =>
                                    setState(() => duration = val),
                                height: SizeConfig.blockSizeVertical * 5,
                                width: SizeConfig.blockSizeHorizontal * 24,
                                textStyle: TextStyle(
                                  fontFamily: "geometric sans-serif",
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
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              )),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (forAccordion == data["speciality_id"]) {
                              forAccordion = "";
                              slot = 0;
                              fee = 0;
                              tax = 0;
                              total = 0;
                              // duration = "";
                            } else if (forAccordion != data["speciality_id"]) {
                              forAccordion = data["speciality_id"];
                            }
                          });
                        },
                        icon: forAccordion == data["speciality_id"]
                            ? Icon(Icons.keyboard_arrow_up)
                            : Icon(Icons.keyboard_arrow_down),
                        color: Colors.black,
                      )
                    ],
                  )),
              if (forAccordion == data["speciality_id"])
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0, SizeConfig.blockSizeVertical * 2, 0, 0),
                      child: Row(mainAxisSize: MainAxisSize.max, children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 2, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '# Slots',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: TextFormField(
                                      controller: slots,
                                      keyboardType: TextInputType.number,
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
                                          slot = int.parse(val);
                                          duro = slot * int.parse(duration);
                                        });
                                      },
                                      // validator: (val) {
                                      //   if (val.length == 0 || val == null) {
                                      //     return "!";
                                      //   } else {
                                      //     return null;
                                      //   }
                                      // },
                                      decoration: InputDecoration(
                                        hintText: '1',
                                        hintStyle:
                                            TextStyle(color: Colors.black54),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'geometric sans-serif',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Duration',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                width: 55,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                margin: EdgeInsets.only(top: 10),
                                child: Center(
                                    child: Text(
                                  duro.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontFamily: 'geometric sans-serif',
                                  ),
                                )),

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
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Fee',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width: 55,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: TextFormField(
                                      // controller: fee,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        new LengthLimitingTextInputFormatter(4),
                                      ],
                                      obscureText: false,
                                      onChanged: (val) {
                                        setState(() {
                                          fee = double.parse(val);
                                          tax = (tax / 100) * fee;
                                          total = fee + tax;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: '100',
                                        hintStyle: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'geometric sans-serif'),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Tax',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: TrymdPartnerDropDown(
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
                                      height: SizeConfig.blockSizeVertical * 5,
                                      width:
                                          SizeConfig.blockSizeHorizontal * 20,
                                      textStyle: TextStyle(
                                        fontFamily: "geometric sans-serif",
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
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width: 55,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: Text(total.toString(),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                            fontFamily:
                                                'geometric sans-serif')),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          if (_form2.currentState.validate()) {
                            if (duration.length == 0) {
                              _globalWidget
                                  .toastMessage('Please select duration hours');
                            } else {
                              updateslots(data['speciality_id'], slot, duration,
                                  fee, tax, total, "", "");
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.81,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF3F8BFD), Color(0xFF07D0F2)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0.94, -1),
                              end: AlignmentDirectional(-0.94, 1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Text(
                              'SAVE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    SizeConfig.blockSizeHorizontal * 70, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BankAccountSetupWidget(),
                          ),
                        );

                        // FocusScopeNode currentFocus = FocusScope.of(context);
                        // if (!currentFocus.hasPrimaryFocus) {
                        //   currentFocus.unfocus();
                        // }
                        // if (_form2.currentState.validate()) {
                        //   if (duration.length == 0) {
                        //     Fluttertoast.showToast(
                        //         msg: "Please select Duration hours",
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.SNACKBAR,
                        //         timeInSecForIosWeb: 1,
                        //         backgroundColor: Colors.black54,
                        //         textColor: Colors.white,
                        //         fontSize: 16.0);
                        //   } else {
                        //     updateslots(data['speciality_id'], slot, duration,
                        //         fee, tax, total);
                        //   }
                        // }
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                          fontFamily: 'Harmonia Sans W01 Bold',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // useGoogleFonts: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          if (_form2.currentState.validate()) {
                            if (duration.length == 0) {
                              _globalWidget
                                  .toastMessage('Please select duration hours');
                            } else {
                              updateslots(data['speciality_id'], slot, duration,
                                  fee, tax, total, "", "");
                            }
                          }
                        },
                        child: FaIcon(
                          FontAwesomeIcons.longArrowAltRight,
                          color: Color(0xFF0B2F45),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
    });
  }

  Widget acorTwo(data, index) {
    listVariable.insert(index, 10);
    // double tot = total;
    return StatefulBuilder(// You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            ExpansionTile(
              backgroundColor: Colors.grey[200],
              collapsedBackgroundColor: Colors.grey[200],
              iconColor: Colors.black,
              collapsedIconColor: Colors.black,
              title: Text(
                data['servicename'],
                style: TextStyle(
                  fontFamily: 'geometric sans-serif',
                  letterSpacing: 0.2,
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeVertical * 2,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0, SizeConfig.blockSizeVertical * 2, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisSize: MainAxisSize.max, children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 2, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '# Slots',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'geometric sans-serif',
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.7,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: 45,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[350],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: TextFormField(
                                        // controller: slots,
                                        keyboardType: TextInputType.number,
                                        // keyboardType: TextInputType.number,
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
                                            slot = int.parse(val);
                                            duro = slot * int.parse(duration);
                                            print(duro);
                                          });
                                        },
                                        // validator: (val) {
                                        //   if (val.length == 0 ||
                                        //       val == null ) {
                                        //     setState(() {
                                        //       showLable = true;
                                        //     });
                                        //     return "";
                                        //   } else if(int.parse(val) > 10){
                                        //      setState(() {
                                        //       showLable2 = true;
                                        //     });
                                        //     return "";
                                        //   }
                                        //    else {
                                        //     return null;
                                        //   }
                                        // },
                                        decoration: InputDecoration(
                                          hintText: '1',
                                          hintStyle:
                                              TextStyle(color: Colors.black54),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'geometric sans-serif',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Duration',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'geometric sans-serif',
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.7,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Container(
                                  width: 55,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  margin: EdgeInsets.only(top: 10),
                                  child: Center(
                                      child: Text(
                                    duro.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontFamily: 'geometric sans-serif',
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Fee',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'geometric sans-serif',
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.7,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: 55,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[350],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: TextFormField(
                                        // controller: fee,
                                        // keyboardType: TextInputType.number,
                                        // inputFormatters: [
                                        //   FilteringTextInputFormatter.digitsOnly,
                                        //   new LengthLimitingTextInputFormatter(4),
                                        // ],
                                        obscureText: false,
                                        onChanged: (val) {
                                          setState(() {
                                            fee = double.parse(val);
                                            tax = (tax / 100) * fee;
                                            listVariable[index] = fee + tax;
                                            listVariable[index] = double.parse(
                                                total.toStringAsFixed(2));
                                            print(fee);
                                            print(tax);
                                            print(
                                              listVariable[index],
                                            );
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: '100',
                                          hintStyle: TextStyle(
                                              color: Colors.black54,
                                              fontFamily:
                                                  'geometric sans-serif'),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Tax',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'geometric sans-serif',
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.7,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: TrymdPartnerDropDown(
                                      options: taxList,
                                      onChanged: (val) {
                                        print(slot);
                                        // setState(() {
                                        fee = fee;
                                        tax = (double.parse(val) / 100) * fee;
                                        listVariable[index] = fee + tax;
                                        listVariable[index] = double.parse(
                                            listVariable[index]
                                                .toStringAsFixed(2));
                                        // });
                                      },
                                      // setState(() => duration = val),
                                      height: SizeConfig.blockSizeVertical * 5,
                                      width:
                                          SizeConfig.blockSizeHorizontal * 20,
                                      textStyle: TextStyle(
                                        fontFamily: "geometric sans-serif",
                                        color: Colors.black54,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 22,
                                        color: Colors.black,
                                      ),
                                      fillColor: Colors.grey[350],
                                      elevation: 0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0,
                                      borderRadius: 5,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'geometric sans-serif',
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.7,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.17,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[350],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                          listVariable[index].toString(),
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                              fontFamily:
                                                  'geometric sans-serif')),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        if (showLable == true)
                          Text("Please enter slot details",
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'geometric sans-serif',
                              )),
                        if (showLable2 == true)
                          Text("Please enter slots between 0-10",
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'geometric sans-serif',
                              )),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
                              SizeConfig.blockSizeVertical * 3,
                              SizeConfig.blockSizeHorizontal * 3,
                              0),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 85,
                                      height: SizeConfig.blockSizeVertical * 6,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: <Color>[
                                            Color(0xFF2BA4F9),
                                            Color(0xFF07D0F2),
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(1, 1),
                                          end: AlignmentDirectional(0, 0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 95, vertical: 15),
                                      primary: Colors.white,
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      // if (_form2.currentState.validate()) {
                                      if (slot <= 10 && slot > 0) {
                                        if (duration.length == 0) {
                                          _globalWidget.toastMessage(
                                              'Please select duration hours');
                                        } else {
                                          updateslots(
                                              data['speciality_id'],
                                              slot,
                                              duration,
                                              fee,
                                              tax,
                                              total,
                                              "",
                                              "");
                                        }
                                        // }
                                      } else {
                                        if (slot == 0) {
                                          showLable = true;
                                        } else {
                                          showLable2 = true;
                                        }

                                        setState(() {});
                                      }
                                    },
                                    child: Text(
                                      'Save',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Color(0xFFFFFFFF),
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        fontWeight: FontWeight.w700,
                                        // useGoogleFonts:
                                        //     false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    });
  }

  Widget containerServiceName(data) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) =>
              addServiceDetails(data['sid'], data['servicename']),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Specialty : " + data['speciality_name'],
                  style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    letterSpacing: 0.2,
                    color: Colors.grey,
                    fontSize: SizeConfig.blockSizeVertical * 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Service : " + data['servicename'],
                  style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    letterSpacing: 0.2,
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeVertical * 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black, size: 22),
          ],
        ),
      ),
    );
  }

  Widget addServiceDetails(serviceId, name) {
    var ta;
    return AlertDialog(
        backgroundColor: Colors.transparent,
        content: StatefulBuilder(// You need this, notice the parameters below:
            builder: (BuildContext context, StateSetter setState) {
          // content: Container(

          return Container(
            height: SizeConfig.blockSizeVertical * 50,
            width: SizeConfig.blockSizeHorizontal * 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '# Slots',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: TextFormField(
                                    // controller: slots,
                                    keyboardType: TextInputType.number,
                                    onChanged: (val) {
                                      setState(() {
                                        slot = int.parse(val);
                                        duro = slot * int.parse(duration);
                                        print(duro);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: '1',
                                      hintStyle:
                                          TextStyle(color: Colors.black54),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 0,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'geometric sans-serif',
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Duration',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(top: 12, left: 10),
                            child: Text(duro.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 17,
                                  fontFamily: 'geometric sans-serif',
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fee',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.62,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: TextFormField(
                                  // controller: fee,
                                  keyboardType: TextInputType.number,
                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.digitsOnly,
                                  //   new LengthLimitingTextInputFormatter(4),
                                  // ],
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(() {
                                      fee = double.parse(val);
                                      tax = (tax / 100) * fee;
                                      total = fee + tax;
                                      total = double.parse(
                                          total.toStringAsFixed(2));
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: '100',
                                    hintStyle: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'geometric sans-serif'),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tax',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: TrymdPartnerDropDown(
                                      options: taxList,
                                      onChanged: (val) {
                                        setState(() {
                                          ta = val;
                                          fee = fee;
                                          tax = (double.parse(val) / 100) * fee;
                                          total = fee + tax;
                                          total = double.parse(
                                              total.toStringAsFixed(2));
                                        });
                                      },
                                      // setState(() => duration = val),
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      textStyle: TextStyle(
                                        fontFamily: "geometric sans-serif",
                                        color: Colors.black54,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 22,
                                        color: Colors.black,
                                      ),
                                      fillColor: Colors.grey[350],
                                      elevation: 0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0,
                                      borderRadius: 5,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: Text(total.toString(),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontFamily:
                                                'geometric sans-serif')),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 2,
                      SizeConfig.blockSizeVertical * 3,
                      SizeConfig.blockSizeHorizontal * 3,
                      0),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 85,
                              height: SizeConfig.blockSizeVertical * 6,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF2BA4F9),
                                    Color(0xFF07D0F2),
                                  ],
                                  stops: [0, 1],
                                  begin: AlignmentDirectional(1, 1),
                                  end: AlignmentDirectional(0, 0),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 95, vertical: 15),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }

                              // if (_form2.currentState.validate()) {
                              if (slot <= 10 && slot > 0) {
                                if (duration.length == 0) {
                                  _globalWidget.toastMessage(
                                      'Please select duration hours');
                                } else {
                                  updateslots(serviceId, slot, duro, duration,
                                      fee, ta, total, name);
                                }
                                // }
                              } else {
                                if (slot == 0) {
                                  showLable = true;
                                } else {
                                  showLable2 = true;
                                }

                                setState(() {});
                              }
                            },
                            child: Text(
                              'Save',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                color: Color(0xFFFFFFFF),
                                fontSize: SizeConfig.blockSizeVertical * 2,
                                fontWeight: FontWeight.w700,
                                // useGoogleFonts:
                                //     false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  Widget containerCompletedWidget(data) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  data['serviceName'],
                  style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    fontSize: SizeConfig.blockSizeVertical * 2.5,
                    height: 1.55,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    SizeConfig.blockSizeHorizontal * 3,
                    0,
                    SizeConfig.blockSizeHorizontal * 3,
                    0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          SizeConfig.blockSizeHorizontal * 1, 10, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '# Slots',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 15,
                              height: SizeConfig.blockSizeVertical * 6,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  data['slots'].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'geometric sans-serif',
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
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
                          SizeConfig.blockSizeHorizontal * 1, 10, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Duration',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 15,
                              height: SizeConfig.blockSizeVertical * 6,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  data['durations'].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'geometric sans-serif',
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.7,
                                    fontWeight: FontWeight.bold,
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
                          SizeConfig.blockSizeHorizontal * 2, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Fee',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 25,
                              height: SizeConfig.blockSizeVertical * 6,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  data['fees'].toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'geometric sans-serif',
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.7,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    SizeConfig.blockSizeHorizontal * 12,
                    0,
                    SizeConfig.blockSizeHorizontal * 12,
                    0),
                child: Row(children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        SizeConfig.blockSizeHorizontal * 3, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Tax',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'geometric sans-serif',
                            fontSize: SizeConfig.blockSizeVertical * 1.7,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 25,
                            height: SizeConfig.blockSizeVertical * 6,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                data['taxes'].toString() + '%',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.6,
                                  fontWeight: FontWeight.bold,
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
                        SizeConfig.blockSizeHorizontal * 8, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'geometric sans-serif',
                            fontSize: SizeConfig.blockSizeVertical * 1.7,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 30,
                            height: SizeConfig.blockSizeVertical * 6,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                data['total'].toString(),
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
                  ),
                ]))
          ],
        ));
  }

  // Function ****************************************************************************************
  getSelectedServices() async {
    var vendorId = storage.getItem("vendor_id");
    print(vendorId);
    var response =
        await VendorSelectedCategories().getSelectedServices(vendorId);
    if (response['status'] == 1) {
      List dataList1 = response['service_master'][0]['servicetags'];
      List dataL = [];
      dataList1.forEach((element) {
        element['service'].forEach((ele) {
          if (ele['service_status'] == true) {
            ele['speciality_id'] = element['speciality_id'];
            ele['speciality_name'] = element['speciality_name'];
            dataL.add(ele);
          }
        });
      });
      servicesList = dataL;
      print(servicesList);
      if (servicesList.length != 0) {
        empty = false;
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

    duration = slotDurations[0];
    bigShow = true;
    var response1 = await UpdateBankDetails().getTaxDetailsResponse();
    if (response1['status'] == 1) {
      var data = response1['result'];
      data.forEach((ele) {
        taxList.add(
          ele['value'],
        );
      });
    }
    tax = double.parse(
      taxList[0],
    );
    setState(() {});
  }

  updateslots(
      serviceid, slot1, du, duration1, fee1, tax1, total1, name1) async {
    Navigator.pop(context);

    var vendorId = storage.getItem("vendor_id");
    var jsonBody = jsonEncode({
      "professional_id": vendorId,
      "service_id": serviceid,
      "slot": slot1,
      "duration": du,
      "time": "mins",
      "fee": fee1,
      "tax": tax1,
      "total ": total1,
      "default_time": duration1,
      "service_name": name1
    });

    print(jsonBody);

    var response =
        await UpdateBankDetails().updateSlotsDetailsResponse(jsonBody);

    if (response['status'] == 1) {
      if (completedList.length != 0) {
        List d1 = [];
        completedList.forEach((element) {
          d1.add(
            element['sid'],
          );
        });
        if (d1.contains(serviceid)) {
          for (int i = 0; i < completedList.length; i++) {
            if (completedList[i]['sid'] == serviceid) {
              completedList[i]['slots'] = slot1;
              completedList[i]['fees'] = fee1;
              completedList[i]['taxes'] = tax1;
              completedList[i]['total'] = total1;
              completedList[i]['durations'] = du;
            }
          }
          // completedList.forEach((element) {
          //   if (element['sid'] == name1) {
          //     element['slots'] = slot1;
          //     element['fees'] = fee1;
          //     element['taxes'] = tax1;
          //     element['total'] = total1;
          //     element['durations'] = du;
          //   }
          // });

          storage.setItem("completedList", completedList);
        } else {
          completedList.add({
            "serviceName": name1,
            "slots": slot,
            "fees": fee,
            "taxes": tax,
            "total": total,
            "durations": duro,
            "sid": serviceid
          });

          storage.setItem("completedList", completedList);
        }
      } else {
        completedList.add({
          "serviceName": name1,
          "slots": slot,
          "fees": fee,
          "taxes": tax,
          "total": total,
          "durations": duro,
          "sid": serviceid
        });
        storage.setItem("completedList", completedList);
      }

      setState(() {});

      slot = 0;
      // duration = 0;
      fee = 0;
      tax = 0;
      total = 0;
      duro = 0;

      setState(() {});
      _globalWidget.toastMessage('Slot details updated successfully');
    } else {
      _globalWidget.toastMessage('Could not update slot details');
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
