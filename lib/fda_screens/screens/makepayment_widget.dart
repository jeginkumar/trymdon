import 'package:trymd_partner/fda_screens/fda_repository/auth.dart';
import 'package:trymd_partner/fda_screens/repository/repository.dart';
// import 'package:trymd_partner/fda_screens/screens/bookingid_widget.dart';
import 'package:trymd_partner/global_widget/trymd_partner_theme.dart';
// import 'package:trymd_partner/repository.dart';

import '../components/bookingsuccessfull_widget.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../trymd_radio_button.dart';

class MakePaymentWidget extends StatefulWidget {
  final jsonBody;
  final userData;
  final start;
  final end;
  final delayS;
  final delayE;
  const MakePaymentWidget(
      {this.jsonBody,
      this.userData,
      this.start,
      this.end,
      this.delayS,
      this.delayE});

  @override
  _MakePaymentWidgetState createState() => _MakePaymentWidgetState();
}

class _MakePaymentWidgetState extends State<MakePaymentWidget> {
  String radioButtonValue1;
  String radioButtonValue2;
  String radioButtonValue3;
  TextEditingController textController;
  TextEditingController textController1;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> modeofpayment = [];
  String mode = "";
  dynamic customeramount = "";

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    modes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: Icon(
          Icons.keyboard_arrow_left,
          color: Colors.black,
          size: 24,
        ),
        title: Text(
          'Make Payment',
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      10,
                      0,
                      0,
                    ),
                    child: Container(
                      width: 356,
                      height: 261,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4F7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              20,
                              20,
                              0,
                              0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Mode of payment',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Harmonia Sans W01 Regular',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //     height: 40,
                          //     child: ListView.builder(
                          //         scrollDirection: Axis.horizontal,
                          //         shrinkWrap: true,
                          //         itemCount: 3,
                          //         itemBuilder: (context, index) {
                          //           return paymentmode(
                          //               context, modeofpayment[index]);
                          //         })),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              15,
                              20,
                              0,
                              0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    20,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: TrymdPartnerRadioButton(
                                    options: ['Card'],
                                    onChanged: (value) {
                                      setState(() => radioButtonValue1 = value);
                                    },
                                    optionHeight: 25,
                                    textStyle: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Harmonia Sans W01 Bold',
                                          color: Colors.black,
                                          useGoogleFonts: false,
                                        ),
                                    selectedTextStyle:
                                        TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 Regular',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                    buttonPosition: RadioButtonPosition.left,
                                    direction: Axis.horizontal,
                                    radioButtonColor: Colors.blue,
                                    inactiveRadioButtonColor: Color(
                                      0x8A000000,
                                    ),
                                    toggleable: true,
                                    horizontalAlignment: WrapAlignment.start,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    100,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: TrymdPartnerRadioButton(
                                    options: ['Online'],
                                    onChanged: (value) {
                                      setState(() => radioButtonValue1 = value);
                                    },
                                    optionHeight: 25,
                                    textStyle: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Harmonia Sans W01 Bold',
                                          color: Colors.black,
                                          useGoogleFonts: false,
                                        ),
                                    selectedTextStyle:
                                        TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 Regular',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                    buttonPosition: RadioButtonPosition.left,
                                    direction: Axis.horizontal,
                                    radioButtonColor: Colors.blue,
                                    inactiveRadioButtonColor: Color(
                                      0x8A000000,
                                    ),
                                    toggleable: true,
                                    horizontalAlignment: WrapAlignment.start,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              25,
                              20,
                              0,
                              0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Enter the total fees',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Harmonia Sans W01 Regular',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    20,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Container(
                                    width: 162,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 8),
                                      child: TextFormField(
                                        controller: textController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: '123',
                                          hintStyle:
                                              TrymdPartnerTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'Harmonia Sans W01 Regular',
                                                    color: Colors.black38,
                                                    useGoogleFonts: false,
                                                  ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(
                                                0x00000000,
                                              ),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
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
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(
                                                4.0,
                                              ),
                                              topRight: Radius.circular(
                                                4.0,
                                              ),
                                            ),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            0,
                                            0,
                                            10,
                                          ),
                                        ),
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 Regular',
                                              color: Colors.black,
                                              useGoogleFonts: false,
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
                              25,
                              10,
                              0,
                              0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Amount given by \nCustomer',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Harmonia Sans W01 Regular',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    30,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Container(
                                    width: 162,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 8),
                                      child: TextFormField(
                                        controller: textController1,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: '123',
                                          hintStyle:
                                              TrymdPartnerTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'Harmonia Sans W01 Regular',
                                                    color: Colors.black38,
                                                    useGoogleFonts: false,
                                                  ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(
                                                0x00000000,
                                              ),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
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
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(
                                                4.0,
                                              ),
                                              topRight: Radius.circular(
                                                4.0,
                                              ),
                                            ),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            0,
                                            0,
                                            10,
                                          ),
                                        ),
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 Regular',
                                              color: Colors.black,
                                              useGoogleFonts: false,
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
                              25,
                              10,
                              0,
                              0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Balance Amount',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Harmonia Sans W01 Regular',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    35,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Container(
                                    width: 162,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 8),
                                      child: TextFormField(
                                        controller: textController2,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: '123',
                                          hintStyle:
                                              TrymdPartnerTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'Harmonia Sans W01 Regular',
                                                    color: Colors.black38,
                                                    useGoogleFonts: false,
                                                  ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(
                                                0x00000000,
                                              ),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
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
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(
                                                4.0,
                                              ),
                                              topRight: Radius.circular(
                                                4.0,
                                              ),
                                            ),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            0,
                                            0,
                                            10,
                                          ),
                                        ),
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 Regular',
                                              color: Colors.black,
                                              useGoogleFonts: false,
                                            ),
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      350,
                      0,
                      0,
                    ),
                    child: InkWell(
                      onTap: () async {
                        bookService();
                        // await showDialog(
                        //   // isScrollControlled: true,
                        //   // backgroundColor: Colors.transparent,
                        //   context: context,
                        //   builder: (context) {
                        //     return Padding(
                        //       padding: MediaQuery.of(context).viewInsets,
                        //       child: Container(
                        //         height: 400,
                        //         child: BookingSuccessWidget(),
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
                            begin: AlignmentDirectional(1, -0.98),
                            end: AlignmentDirectional(-1, 0.98),
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            10,
                            0,
                            0,
                          ),
                          child: Text(
                            'Book Appointment',
                            textAlign: TextAlign.center,
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Harmonia Sans W01 Bold',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      100,
                      0,
                      0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: TrymdPartnerTheme.of(context).tertiaryColor,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  modes() async {
    var response = MakePayment();
    Map<String, dynamic> constvalue = await response.payment();
    customeramount = constvalue["modeofpayment"]["customeramount"];
    if (mounted) setState(() {});
  }

  bookService() async {
    Map<String, dynamic> json = widget.jsonBody;
    json['payment_mode'] = radioButtonValue1;
    json['payment_status'] = "success";
    print(json);
    var response = await AuthenticationsForFDA().getBookService(json);
    print(response);
    if (response['status'] == 1) {
      await showDialog(
        // isScrollControlled: true,
        // backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: 500,
              child: BookingSuccessWidget(
                userData: widget.userData,
                start: widget.start,
                end: widget.end,
                delayS: widget.delayS,
                delayE: widget.delayE,
              ),
            ),
          );
        },
      );
    }
  }
}
