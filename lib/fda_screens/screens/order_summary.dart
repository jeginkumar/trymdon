// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'package:trymd_partner/dashboard/dashboard.dart';
import 'package:trymd_partner/global_widget/trymd_partner_theme.dart';
import 'package:trymd_partner/sizer.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:new_vendor_two/fda_screens/flutter_flow/flutter_flow_theme.dart';

class OrderSummaryWidget extends StatefulWidget {
  const OrderSummaryWidget({Key key}) : super(key: key);

  @override
  _OrderSummaryWidgetState createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: InkWell(
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ));
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: SizeConfig.blockSizeVertical * 3,
            )),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 3,
                SizeConfig.blockSizeVertical * 1.5,
                0,
                0,
              ),
              child: Container(
                width: SizeConfig.blockSizeHorizontal * 10,
                height: SizeConfig.blockSizeVertical * 4,
                decoration: BoxDecoration(
                  color: Color(0xFF2C9B47),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    0,
                    SizeConfig.blockSizeVertical * 0.8,
                    0,
                    0,
                  ),
                  child: Text(
                    'K',
                    textAlign: TextAlign.center,
                    style: TrymdPartnerTheme.of(context).bodyText1.override(
                          fontFamily: 'geometric sans-serif',
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeVertical * 1.8,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 2,
                SizeConfig.blockSizeVertical * 1,
                0,
                0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      0,
                      SizeConfig.blockSizeHorizontal * 4,
                      0,
                    ),
                    child: Text(
                      'Karthiga Rajendran',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'geometric sans-serif',
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 2,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 0.2,
                      SizeConfig.blockSizeHorizontal * 4,
                      0,
                    ),
                    child: Text(
                      'April 5 , 2020 at 10:33 AM',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'geometric sans-serif',
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 1.6,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              0,
              0,
              SizeConfig.blockSizeHorizontal * 6,
              0,
            ),
            child: Icon(
              Icons.vertical_align_bottom,
              color: Colors.black,
              size: SizeConfig.blockSizeVertical * 3,
            ),
          ),
        ],
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
                      SizeConfig.blockSizeVertical * 2,
                      0,
                      0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: SizeConfig.blockSizeVertical * 1,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4F7),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: SizeConfig.blockSizeVertical * 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 7,
                            0,
                            0,
                            0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 1.8,
                                  SizeConfig.blockSizeHorizontal * 6.5,
                                  0,
                                ),
                                child: Text(
                                  'Karthiga Rajendran',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.7,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 0.5,
                                  0,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Order ID :',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'geometric sans-serif',
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.7,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Text(
                                      ' #TRY6787097',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'geometric sans-serif',
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.7,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 0.5,
                                  SizeConfig.blockSizeHorizontal * 2,
                                  0,
                                ),
                                child: Text(
                                  '134, XXX Street, Salem',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.7,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 0.5,
                                  SizeConfig.blockSizeHorizontal * 4,
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
                                      child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 17,
                                        height:
                                            SizeConfig.blockSizeVertical * 2.7,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFDDBFFE),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            SizeConfig.blockSizeVertical * 0.5,
                                            0,
                                            0,
                                          ),
                                          child: Text(
                                            'Cold',
                                            textAlign: TextAlign.center,
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      'geometric sans-serif',
                                                  color: Colors.black,
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      1.4,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 1.5,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 17,
                                        height:
                                            SizeConfig.blockSizeVertical * 2.7,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFDDBFFE),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            SizeConfig.blockSizeVertical * 0.5,
                                            0,
                                            0,
                                          ),
                                          child: Text(
                                            'Fever',
                                            textAlign: TextAlign.center,
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      'geometric sans-serif',
                                                  color: Colors.black,
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      1.4,
                                                  fontWeight: FontWeight.w600,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 26,
                            0,
                            SizeConfig.blockSizeVertical * 2,
                            0,
                          ),
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 20,
                            height: SizeConfig.blockSizeVertical * 11,
                            decoration: BoxDecoration(
                              color: Color(0xFFED62B2),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/Rectangle_1466.png',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0,
                                SizeConfig.blockSizeVertical * 0.5,
                                0,
                                0,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      SizeConfig.blockSizeVertical * 2,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'View',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'geometric sans-serif',
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.5,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'Appointment',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.5,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Text(
                                    'History',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.5,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
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
                  Container(
                    width: double.infinity,
                    height: SizeConfig.blockSizeVertical * 1,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F7),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 2,
                      0,
                      0,
                    ),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 90,
                      height: SizeConfig.blockSizeVertical * 46,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4F7),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Text(
                              'Order Summary',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.5,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 80,
                              height: SizeConfig.blockSizeVertical * 7,
                              decoration: BoxDecoration(
                                color: Color(0xFFFE4088),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      SizeConfig.blockSizeVertical * 1,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'WEDNESDAY, JANUARY 17, 2022',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'geometric sans-serif',
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.9,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    '09.30 - 09.45 AM',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: SizeConfig.blockSizeVertical * 2,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Color(0xFFD0DEEB),
                          ),
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 3,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    'Consultation',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 41,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    '\$33.89',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 6,
                              SizeConfig.blockSizeVertical * 2,
                              0,
                              0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 2,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    'Vaccination',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 42,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    '\$50.84',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5.5,
                              SizeConfig.blockSizeVertical * 2,
                              0,
                              0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 2,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    'Applicable Taxes',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 34,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    '\$15.27',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 1.5,
                              0,
                              0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 2.5,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    'Vendor Payment',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 38,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    '\$100',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 1.5,
                              0,
                              0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    10,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    'Trym’d Booking Fee',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    126,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    '\$8.47',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 1.5,
                              0,
                              0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    10,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    'Applicable Taxes',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 36,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    '\$1.52',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: SizeConfig.blockSizeVertical * 2,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Color(0xFFD0DEEB),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 5,
                              SizeConfig.blockSizeVertical * 1,
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
                                    'TOTAL',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 55,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    '\$110',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
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
                      SizeConfig.blockSizeVertical * 2,
                      0,
                      0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4F7),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 1,
                      0,
                      0,
                    ),
                    child: Text(
                      'Payment Details',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'geometric sans-serif',
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 2.5,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 7,
                      SizeConfig.blockSizeVertical * 2,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 7,
                            0,
                            0,
                            0,
                          ),
                          child: Text(
                            'Payment Mode',
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 42.5,
                            0,
                            0,
                            0,
                          ),
                          child: Text(
                            'UPI',
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: SizeConfig.blockSizeVertical * 2,
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                    color: Color(0xFFF1F4F7),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      SizeConfig.blockSizeVertical * 1,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 9,
                            0,
                            0,
                            0,
                          ),
                          child: Text(
                            'Payment ID',
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 35,
                            0,
                            0,
                            0,
                          ),
                          child: Text(
                            '#12343557',
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: SizeConfig.blockSizeVertical * 2,
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                    color: Color(0xFFF1F4F7),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 5,
                      SizeConfig.blockSizeVertical * 1,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 9,
                            0,
                            0,
                            0,
                          ),
                          child: Text(
                            'Booking Date\n& Time',
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 29,
                            0,
                            0,
                            0,
                          ),
                          child: Text(
                            'Nov 22, 2021\n    09:00 AM',
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  fontWeight: FontWeight.w600,
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
                      SizeConfig.blockSizeVertical * 1,
                      0,
                      0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: SizeConfig.blockSizeVertical * 1,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4F7),
                      ),
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
                      width: double.infinity,
                      height: SizeConfig.blockSizeVertical * 3,
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
      ),
    );
  }
}
