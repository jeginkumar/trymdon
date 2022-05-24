import 'dart:convert';
// import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:trymd_partner/accountsetup/accountcancel.dart';
import 'package:trymd_partner/accountsetup/accountsetup1.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_drop_down.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
// import 'package:trymd_partner/flutter_flow_drop_down.dart';
// import 'package:trymd_partner/operation_details/operational_details_widget.dart';
// import 'package:dotted_line/dotted_line.dart';
// import '../trymd_flow/trymd_theme.dart' as tt;
import 'package:flutter/material.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
// import 'package:trymd_partner/trymd_flow/flutter_flow_drop_down.dart';
// import '../repository/selections.dart';
import '../repository/updatebankdetails.dart';
import '../sizer.dart';
// import 'accept_widget.dart';
// import 'colorLoader.dart';

class BankAccountSetupWidget extends StatefulWidget {
  final vendorType;
  BankAccountSetupWidget({this.vendorType});

  @override
  _BankAccountSetupWidgetState createState() => _BankAccountSetupWidgetState();
}

class _BankAccountSetupWidgetState extends State<BankAccountSetupWidget>
    with SingleTickerProviderStateMixin {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final LocalStorage storage = new LocalStorage('localstorage_app');
  TextEditingController textController = TextEditingController();
  String dropDownValue;
  final _form = GlobalKey<FormState>();
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
  bool next = false;

  Future<bool> _onBackButtonPressed() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => AccountSetupWidget(
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
    if (storage.getItem("profName") != null) {
      profName.text = storage.getItem("profName");
    }
    if (storage.getItem("accName") != null) {
      accName.text = storage.getItem("accName");
    }

    if (storage.getItem("accNumber") != null) {
      accNumber.text = storage.getItem("accNumber");
    }
    if (storage.getItem("ifscCode") != null) {
      ifscCode.text = storage.getItem("ifscCode");
    }
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
                          AccountSetupWidget(vendorType: widget.vendorType),
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
          backgroundColor: Colors.white,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(color: Color(0XFFE5E5E5)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 2,
                      0,
                      0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Form(
                            key: _form,
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
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
                                    Container(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/Card-Flags.png"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DashboardAccountCancelWidget(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "Bank Details",
                                              style: TextStyle(
                                                fontFamily:
                                                    'geometric sans-serif',
                                                color: Colors.black,
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    2.2,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    // IconButton(
                                    //   onPressed: () {
                                    //     setState(() {
                                    //       forbank = !forbank;
                                    //     });
                                    //   },
                                    //   icon: forbank == true
                                    //       ? Icon(Icons.keyboard_arrow_up)
                                    //       : Icon(Icons.keyboard_arrow_down),
                                    //   color: Colors.black,
                                    // )
                                  ],
                                ),
                              ),
                              // if (forbank == true)
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
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 3,
                                        SizeConfig.blockSizeVertical * 4,
                                        SizeConfig.blockSizeHorizontal * 3,
                                        0,
                                      ),
                                      child: TextFormField(
                                        obscureText: false,
                                        controller: profName,
                                        validator: (val) {
                                          if (val == null || val.length == 0) {
                                            return "please enter name";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Professional Name*',
                                          labelStyle: TextStyle(
                                              color: Color(
                                                0xFF000000,
                                              ),
                                              fontFamily:
                                                  'geometric sans-serif'),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE5E5E5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE5E5E5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 3,
                                        SizeConfig.blockSizeVertical * 3,
                                        SizeConfig.blockSizeHorizontal * 3,
                                        0,
                                      ),
                                      child: TextFormField(
                                        obscureText: false,
                                        controller: accName,
                                        validator: (val) {
                                          if (val == null || val.length == 0) {
                                            return "please enter Account holder name";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Account Name*',
                                          labelStyle: TextStyle(
                                              color: Color(
                                                0xFF000000,
                                              ),
                                              fontFamily:
                                                  'geometric sans-serif'),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE5E5E5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE5E5E5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 3,
                                        SizeConfig.blockSizeVertical * 3,
                                        SizeConfig.blockSizeHorizontal * 3,
                                        0,
                                      ),
                                      child: TextFormField(
                                        obscureText: false,
                                        controller: accNumber,
                                        validator: (val) {
                                          if (val == null || val.length == 0) {
                                            return "please enter Account number";
                                          } else if (val.length != 16) {
                                            return null;
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          new LengthLimitingTextInputFormatter(
                                              16),
                                        ],
                                        decoration: InputDecoration(
                                          labelText: 'Account Number*',
                                          labelStyle: TextStyle(
                                              color: Color(
                                                0xFF000000,
                                              ),
                                              fontFamily:
                                                  'geometric sans-serif'),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE5E5E5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE5E5E5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 3,
                                        SizeConfig.blockSizeVertical * 3,
                                        SizeConfig.blockSizeHorizontal * 3,
                                        0,
                                      ),
                                      child: TextFormField(
                                        obscureText: false,
                                        controller: ifscCode,
                                        validator: (val) {
                                          if (val == null || val.length == 0) {
                                            return "please enter IFSC Code";
                                          } else if (val.length != 16) {
                                            return null;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'IFSC Code*',
                                          labelStyle: TextStyle(
                                              color: Color(
                                                0xFF000000,
                                              ),
                                              fontFamily:
                                                  'geometric sans-serif'),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE5E5E5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE5E5E5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 3,
                                        SizeConfig.blockSizeVertical * 3,
                                        SizeConfig.blockSizeHorizontal * 3,
                                        0,
                                      ),
                                      child: TrymdPartnerDropDown(
                                        options: [
                                          'Current',
                                          'Savings',
                                        ].toList(),
                                        onChanged: (val) =>
                                            setState(() => dropDownValue = val),
                                        hintText: 'Account Type*',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 82,
                                        height:
                                            SizeConfig.blockSizeVertical * 7,
                                        textStyle: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        icon: Icon(
                                          Icons.arrow_drop_down_sharp,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                        fillColor: Colors.white,
                                        elevation: 2,
                                        borderColor: Color(0xFFE5E5E5),
                                        borderWidth: 1,
                                        borderRadius: 10,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
                                      ),
                                    ),

                                    // TextFormField(
                                    //   obscureText: false,
                                    //   controller: accType,
                                    //   decoration:
                                    //       InputDecoration(
                                    //     labelText:
                                    //         'Account Type*',
                                    //     labelStyle: TextStyle(
                                    //         color: Color(
                                    //             0xFF000000,),
                                    //         fontFamily:
                                    //             'geometric sans-serif'),
                                    //     enabledBorder:
                                    //         OutlineInputBorder(
                                    //       borderSide:
                                    //           BorderSide(
                                    //         color: Color(
                                    //             0xFFE5E5E5),
                                    //         width: 1,
                                    //       ),
                                    //       borderRadius:
                                    //           BorderRadius
                                    //               .circular(
                                    //                   10,),
                                    //     ),
                                    //     focusedBorder:
                                    //         OutlineInputBorder(
                                    //       borderSide:
                                    //           BorderSide(
                                    //         color: Color(
                                    //             0xFFE5E5E5),
                                    //         width: 1,
                                    //       ),
                                    //       borderRadius:
                                    //           BorderRadius
                                    //               .circular(
                                    //                   10,),
                                    //     ),
                                    //   ),
                                    //   style: TextStyle(
                                    //     fontFamily:
                                    //         'geometric sans-serif',
                                    //     color:
                                    //         Color(0xFF000000,),
                                    //     fontSize: SizeConfig
                                    //             .blockSizeVertical *
                                    //         1.8,
                                    //     fontWeight:
                                    //         FontWeight.bold,
                                    //   ),
                                    // ),

                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 3,
                                        SizeConfig.blockSizeVertical * 3,
                                        SizeConfig.blockSizeHorizontal * 3,
                                        0,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned.fill(
                                              child: Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    85,
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    6,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: <Color>[
                                                      Color(0xFF2BA4F9),
                                                      Color(0xFF07D0F2),
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        1, 1),
                                                    end: AlignmentDirectional(
                                                      0,
                                                      0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 95,
                                                        vertical: 18),
                                                primary: Colors.white,
                                                textStyle: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              onPressed: () {
                                                FocusScopeNode currentFocus =
                                                    FocusScope.of(context);
                                                if (!currentFocus
                                                    .hasPrimaryFocus) {
                                                  currentFocus.unfocus();
                                                }
                                                if (_form.currentState
                                                    .validate()) {
                                                  var vendorId = storage
                                                      .getItem("vendor_id");
                                                  var json = jsonEncode({
                                                    "professional_id": vendorId,
                                                    "professional_name":
                                                        profName.text,
                                                    "account_name":
                                                        accName.text,
                                                    "account_number":
                                                        accNumber.text,
                                                    "ifsc_code": ifscCode.text,
                                                    "account_type":
                                                        dropDownValue.toString()
                                                  });

                                                  updateBankDetailsFun(json);
                                                }
                                              },
                                              child: Text(
                                                'Save',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      'geometric sans-serif',
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      2,
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
                                  ],
                                ),
                              ),

                              // Generated code for this Row Widget...

                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 75,
                                  SizeConfig.blockSizeVertical * 5,
                                  0,
                                  0,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (next == true) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DashboardAccountCancelWidget(),
                                        ),
                                      );
                                    } else {
                                      _globalWidget.toastMessage(
                                          'Please fill the bank details');
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
                                              fontFamily:
                                                  'geometric sans-serif',
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
                                        size:
                                            SizeConfig.blockSizeVertical * 2.5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]))
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

  updateBankDetailsFun(jsondata) async {
    var jsond = jsonDecode(jsondata);

    var response = await UpdateBankDetails().updateBankDetailsResponse(jsond);
    print(response);
    if (response['status'] == 1) {
      storage.setItem("profName", profName.text);
      storage.setItem("accName", accName.text);
      storage.setItem("accNumber", accNumber.text);
      storage.setItem("ifscCode", ifscCode.text);

      next = true;
      _globalWidget.toastMessage('Bank details updated successfully');
    } else if (response['message'] == "Bank Details Already Created...!") {
      next = true;
    } else {
      _globalWidget.toastMessage('Could not update bank details');
    }
  }
}
