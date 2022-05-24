// import 'package:date_field/date_field.dart';
// import 'dart:convert';

// import 'package:intl/number_symbols.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:trymd_partner/dashboard/dashboard.dart';
// import 'package:trymd_partner/fda_screens/fdahome.dart';
import 'package:trymd_partner/fda_screens/fda_repository/auth.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_util.dart';
import 'package:trymd_partner/fda_screens/screens/fda_dashboard.dart';
// import 'package:trymd_partner/fda_screens/repository.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
// import 'package:trymd_partner/repository/auth.dart';
// import 'package:trymd_partner/repository.dart';
import 'package:trymd_partner/sizer.dart';
import 'package:intl/intl.dart';
import '../components/bookingslot_widget.dart';
import '../components/slotsoverview_widget.dart';

// import 'package:trymd_partner/fda_screens/global_widgets/flutter_flow_drop_down.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
// import 'package:trymd_partner/fda_screens/global_widgets/flutter_flow_widgets.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';

class BookingScreenWidget extends StatefulWidget {
  const BookingScreenWidget({Key key}) : super(key: key);

  @override
  _BookingScreenWidgetState createState() => _BookingScreenWidgetState();
}

class _BookingScreenWidgetState extends State<BookingScreenWidget> {
  final LocalStorage storage = new LocalStorage('localstorage_app');
  final _globalWidget = GlobalWidget();
  bool selected = false;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;

  TextEditingController mobileNumber = TextEditingController();

  String showAvailableContent = "";
  String showAvailableContentone = "";
  String showAvailableContentTwo = "";
  List<Widget> filterChips = [];
  List<dynamic> services = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List selectedService = [];
  List selectedServiceName = [];
  List selectedServiceAllData = [];
  List slotList = [];

  final _form = GlobalKey<FormState>();

  Future<bool> _onBackButtonPressed() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => FDADashboardWidget(),
        transitionDuration: Duration(seconds: 0),
      ),
    );

    return false;
  }

  @override
  void initState() {
    bookingslot();

    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    // if (storage.getItem('pro_name') != null) {
    //   textController1.text = storage.getItem('pro_name');
    // }
    // if (storage.getItem('pro_service') != null) {
    //   filterChips = storage.getItem('pro_service');
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    this.filterChips = services.map<Widget>((dynamic name) {
      return FilterChip(
        // elevation: 0,
        // backgroundColor: Color(0XFFF1F4F7),
        // key: ValueKey<String>(name),
        // label: Text(
        //   name,
        //   style: TextStyle(color: Colors.black),
        // ),
        // selected: selected,
        // onSelected: (bool name) {
        //   selected = name;
        //   setState(() {});
        // },
        // selectedColor: Colors.orange,
        // showCheckmark: false,
        backgroundColor: selectedService.contains(name['service_id'])
            ? Color(0XFFE6EEFE)
            : Colors.grey[300],
        key: ValueKey<String>(name['service_name']),
        label: Text(
          name['service_name'],
          style: TextStyle(
            color: selectedService.contains(name['service_id'])
                ? Color(0xFF3F8BFD)
                : Colors.black,
            fontFamily: 'geometric sans-serif',
            letterSpacing: 0.2,
            fontSize: SizeConfig.blockSizeVertical * 2,
          ),
        ),
        onSelected: (bool value) {
          setState(() {
            if (selectedService.contains(name['service_id']) == true) {
              selectedServiceName.remove(
                name['service_name'],
              );
              selectedServiceAllData.remove(name);
              selectedService.remove(
                name['service_id'],
              );
            } else if (selectedService.contains(name['service_id']) == false) {
              selectedServiceName.add(
                name['service_name'],
              );
              selectedServiceAllData.add(name);
              selectedService.add(
                name['service_id'],
              );
            }
          });
        },
      );
    }).toList();

    return WillPopScope(
        onWillPop: _onBackButtonPressed,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            leading: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          FDADashboardWidget(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                child: Icon(
                  Icons.chevron_left_sharp,
                  color: Colors.black,
                  size: 24,
                )),
            title: Text(
              'Booking Screen',
              style: TrymdPartnerTheme.of(context).bodyText1.override(
                    fontFamily: 'Harmonia Sans W01 Bold',
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
          backgroundColor: TrymdPartnerTheme.of(context).primaryBackground,
          body: SafeArea(
              child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Form(
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 4,
                            0),
                        child: TextFormField(
                          controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Doctor Name',
                            labelStyle: TextStyle(color: Color(0xFF000000)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF1F4F7),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF1F4F7),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                  fontFamily: 'Harmonia Sans W01 Regular',
                                  color: Color(0xFF000000),
                                  fontSize: SizeConfig.blockSizeVertical * 1.6,
                                  useGoogleFonts: false),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 4,
                            0),
                        child: TextFormField(
                          controller: textController2,
                          obscureText: false,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Please enter customer name";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Customer Name',
                            labelStyle: TextStyle(color: Color(0xFF000000)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF1F4F7),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF1F4F7),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                  fontFamily: 'Harmonia Sans W01 Regular',
                                  color: Color(0xFF000000),
                                  fontSize: SizeConfig.blockSizeVertical * 1.6,
                                  useGoogleFonts: false),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 1, 0, 0, 0),
                              child: Text(
                                'SELECT SERVICE',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                        fontFamily: 'Harmonia Sans W01 Bold',
                                        color: Color(0xFF000000),
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3.5,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 3.5,
                            0),
                        child: Container(
                          height: SizeConfig.blockSizeVertical * 10,
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            children: filterChips.map<Widget>((Widget chip) {
                              return InkWell(
                                  child: Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: chip),
                                  onTap: () {
                                    print('Chip Data: ' + chip.toString());
                                  });
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 3,
                            SizeConfig.blockSizeHorizontal * 4,
                            0),
                        child: TextFormField(
                          controller: mobileNumber,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Please enter customer mobile number";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(color: Color(0xFF000000)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF1F4F7),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF1F4F7),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                  fontFamily: 'Harmonia Sans W01 Regular',
                                  color: Color(0xFF000000),
                                  fontSize: SizeConfig.blockSizeVertical * 1.6,
                                  useGoogleFonts: false),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 1.5,
                            SizeConfig.blockSizeHorizontal * 0,
                            0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 0,
                                    SizeConfig.blockSizeVertical * 0,
                                    SizeConfig.blockSizeHorizontal * 4,
                                    0),
                                child: TextFormField(
                                  controller: textController4,
                                  obscureText: false,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "Please enter customer age";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Date Of Birth',
                                    labelStyle:
                                        TextStyle(color: Color(0xFF000000)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFF1F4F7),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            SizeConfig.blockSizeHorizontal * 3,
                                            SizeConfig.blockSizeVertical * 1.5,
                                            0,
                                            0),
                                        child: FaIcon(
                                          FontAwesomeIcons.calendar,
                                          color: Color(0xFFC1C1C1),
                                          size: 22,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFF1F4F7),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontFamily:
                                              'Harmonia Sans W01 Regular',
                                          color: Color(0xFF000000),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.6,
                                          useGoogleFonts: false),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1000),
                                        lastDate: DateTime(4000));
                                    if (pickedDate != null) {
                                      print(pickedDate);
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy')
                                              .format(pickedDate);
                                      print(formattedDate);

                                      setState(() {
                                        textController4.text = formattedDate;
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 0,
                                    SizeConfig.blockSizeVertical * 0,
                                    SizeConfig.blockSizeHorizontal * 4,
                                    0),
                                child: TextFormField(
                                  controller: textController5,
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "Please enter customer age";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Age',
                                    labelStyle:
                                        TextStyle(color: Color(0xFF000000)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFF1F4F7),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFF1F4F7),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontFamily:
                                              'Harmonia Sans W01 Regular',
                                          color: Color(0xFF000000),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.6,
                                          useGoogleFonts: false),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 1,
                            0,
                            0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 1, 0, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  // await Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           DashboardWidgetForFDA(),
                                  //     ));
                                },
                                child: Text(
                                  'ADDRESS',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontFamily: 'Harmonia Sans W01 Bold',
                                          color: Color(0xFF000000),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 1,
                            SizeConfig.blockSizeHorizontal * 4,
                            0),
                        child: TextFormField(
                          maxLines: 5,
                          controller: textController3,
                          obscureText: false,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Please enter customer name";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF1F4F7),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF1F4F7),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                  fontFamily: 'Harmonia Sans W01 Regular',
                                  color: Color(0xFF000000),
                                  fontSize: SizeConfig.blockSizeVertical * 1.6,
                                  useGoogleFonts: false),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 1,
                            0,
                            0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 1, 0, 0, 0),
                              child: Text(
                                'YOUR GENDER',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                        fontFamily: 'Harmonia Sans W01 Bold',
                                        color: Color(0xFF000000),
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, SizeConfig.blockSizeVertical * 2, 0, 0),
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
                                        0),
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
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      2,
                                                  0,
                                                  0,
                                                  0),
                                          child: Text(
                                            'Male',
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                    fontFamily:
                                                        'Harmonia Sans W01 bold',
                                                    color: Color(0xFF000000),
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
                                )),
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 3,
                                    0,
                                    0,
                                    0),
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
                                      height: SizeConfig.blockSizeVertical * 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(56),
                                        border: Border.all(
                                          color: showAvailableContentTwo ==
                                                  "female"
                                              ? Color(0xFF3F8BFD)
                                              : Color(0xFFE5E5E5),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            SizeConfig.blockSizeHorizontal * 3,
                                            0,
                                            0,
                                            0),
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
                                              height:
                                                  SizeConfig.blockSizeVertical *
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
                                                      0),
                                              child: Text(
                                                'Female',
                                                style: TrymdPartnerTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                        fontFamily:
                                                            'Harmonia Sans W01 bold',
                                                        color:
                                                            Color(0xFF000000),
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
                                                        useGoogleFonts: false),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            if (_form.currentState.validate()) {
                              if (showAvailableContentTwo.isNotEmpty &&
                                  selectedServiceName.length != 0) {
                                generateBooking();
                              } else if (showAvailableContentTwo.isEmpty) {
                                _globalWidget
                                    .toastMessage('Please select gender');
                              } else if (selectedServiceName.length == 0) {
                                _globalWidget
                                    .toastMessage('Please select services');
                              }
                            }

                            // await showDialog(
                            //   // isScrollControlled: true,
                            //   // backgroundColor: Colors.transparent,
                            //   context: context,
                            //   builder: (context) {
                            //     return Padding(
                            //       padding: MediaQuery.of(context).viewInsets,
                            //       child: Container(
                            //         height: 400,
                            //         child: BookingslotWidget(),
                            //       ),
                            //     );
                            //   },
                            // );
                          },
                          child: Container(
                            width: 351,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF3F8BFD), Color(0xFF07D0F2)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0.87, -1),
                                end: AlignmentDirectional(-0.87, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Text(
                                'Create A Booking',
                                textAlign: TextAlign.center,
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 Bold',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            viewSlots();
                          },
                          child: Container(
                            width: 351,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFF3F8BFD),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Text(
                                'View Slots',
                                textAlign: TextAlign.center,
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'geometric sans-serif',
                                      color: Color(0xFF3F8BFD),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
        ));
  }

  Iterable<TimeOfDay> getTimeSlots(
      TimeOfDay startTime, TimeOfDay endTime, Duration interval) sync* {
    var hour = startTime.hour;
    var minute = startTime.minute;

    do {
      yield TimeOfDay(hour: hour, minute: minute);
      minute += interval.inMinutes;
      while (minute >= 60) {
        minute -= 60;
        hour++;
      }
    } while (hour < endTime.hour ||
        (hour == endTime.hour && minute <= endTime.minute));
  }

  Widget selectservice(context) {
    return Container();
  }

  bookingslot() async {
    String fdaId = storage.getItem("fda_id");

    var response = AuthenticationsForFDA();
    var value = await response.getDoctorDetails(fdaId);
    if (value['status'] == 1) {
      storage.setItem(
          "pro_id", value['professional-details'][0]['professional_id']);
      textController1.text = value['professional_name'];
      print(value);
      storage.setItem('pro_name', textController1.text);
      // List dataList1 = value['services-details'][0]['servicetags'];
      // List dataL = [];
      // dataList1.forEach((element) {
      //   element['service'].forEach((ele) {
      //     if (ele['service_status'] == true) {
      //       ele['speciality_id'] = element['speciality_id'];
      //       ele['speciality_name'] = element['speciality_name'];
      //       dataL.add(ele);
      //     }
      //   });
      // });
      services = value['serviceslot'];
      storage.setItem('pro_service', services);
    }

    // services = value["bookingscreen"];

    setState(() {});
  }

  viewSlots() async {
    String proId = storage.getItem("pro_id");

    Map<String, dynamic> json = {"professional_id": proId, "service_name": ""};

    var response = AuthenticationsForFDA();
    var value = await response.getViewSlotsDefault(json);
    List data1 = [];
    slotList = [];
    print(value);
    if (value['status'] == 1) {
      data1 = value['slot'];
      data1.forEach((element) {
        var d1 = element.split(' - ');
        String start = DateFormat.jm().format(DateFormat("hh:mm").parse(d1[0]));
        String end = DateFormat.jm().format(DateFormat("hh:mm").parse(d1[1]));
        String std = start + " - " + end;

        slotList.add(std);
      });
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        // barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: 300,
              child: SlotsoverviewWidget(slotData: slotList),
            ),
          );
        },
      );
    } else {
      _globalWidget.toastMessage('Today slots not available');
    }
  }

  generateBooking() async {
    String proId = storage.getItem("pro_id");
    String speid = selectedServiceName.toString();
    speid = speid.replaceAll('[', '');
    speid = speid.replaceAll(']', '');
    speid = speid.replaceAll(' ', '');
    Map<String, dynamic> bodyJson = {
      "professional_id": proId,
      "customer_name": textController2.text,
      "customer_select_service": speid,
      "customer_mobile_number": mobileNumber.text,
      "customer_dob": textController4.text,
      "customer_age": textController5.text,
      "customer_address": textController3.text,
      "customer_gender": showAvailableContentTwo,
      "user_type": "impromtu",
    };
    print(bodyJson);
    var response = await AuthenticationsForFDA().getUserRegistration(bodyJson);
    print(response);
    if (response['status'] == 1) {
      storage.setItem("booking_id", response['booking-id']);
      await showDialog(
        // isScrollControlled: true,
        // backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: 400,
              child: BookingslotWidget(
                  serviceName: selectedServiceAllData, userData: bodyJson),
            ),
          );
        },
      );
    }
  }

  // bookingfromFDA() async {
  //   var jsonBody = json.encode({
  //     "customer_name": textController2,
  //     "customer_select_service": mobileNumber,
  //     "customer_mobile_number": mobileNumber,
  //     "customer_dob": textController4,
  //     "customer_age": textController5,
  //     "customer_address": textController3,
  //     "customer_gender": showAvailableContentTwo,
  //     "user_type": ""
  //   });
  //   var response = await Authentications().bookingFDA(jsonBody);
  //   if (response['status'] == 1) {
  //     print(response);
  //     Navigator.pushReplacement(
  //       context,
  //       PageRouteBuilder(
  //         pageBuilder: (context, animation1, animation2) => DashboardScreen(),
  //         transitionDuration: Duration(seconds: 0),
  //       ),
  //     );
  //   } else {
  //     _globalWidget.toastMessage(
  //         'Could not update FDA details, please fill all the details');
  //   }
  // }
}
