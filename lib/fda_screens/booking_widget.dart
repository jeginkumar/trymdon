// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
// import 'package:trymd_partner/fda_screens/fdahome.dart';
import 'package:trymd_partner/fda_screens/repository/repository.dart';
import 'package:trymd_partner/fda_screens/screens/fda_dashboard.dart';
import 'package:trymd_partner/global_widget/trymd_partner_theme.dart';

class BookingWidget extends StatefulWidget {
  const BookingWidget({Key key}) : super(key: key);

  @override
  _BookingWidgetState createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  Map<String, double> chartData = {};
  List<Color> colorList = [];
  List<dynamic> gradientList = [];
  TabController _tabController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  dynamic btrymd = 0.0;
  dynamic bavailable = 0.0;
  dynamic bwalkin = 0.0;
  dynamic bcancel = 0.0;
  dynamic bptrymd = "";
  dynamic bpavailable = "";
  dynamic bpwalkin = "";
  dynamic bpcancel = "";
  dynamic dtrymd = "";
  dynamic dwalk = "";
  dynamic davailable = "";
  dynamic dcancel = "";
  dynamic bookingslot = "";
  dynamic weekly = "";
  dynamic today = "";
  dynamic vacper = "";
  dynamic follper = "";
  dynamic consper = "";
  dynamic injeper = "";
  dynamic date = "";
  dynamic boverall = "";
  dynamic vacno = "";
  dynamic follno = "";
  dynamic consno = "";
  dynamic injeno = "";
  // Map<String, double> dataMap = {
  //   "Cancel": 10.0,
  //   "Available": 25,
  //   "Walk-in": 15,
  //   "Trym'd": 50.0,
  // };
  // List<Color> colorList = [
  //   const Color(0xFFFF7B0D),
  //   const Color(0xFFFE418A),
  //   const Color(0xFF01AD88),
  //   const Color(0xFFF1F4F7),
  // ];

  // final gradientList = <List<Color>>[
  //   [
  //     Color.fromRGBO(13, 212, 57, 1),
  //     Color.fromRGBO(1, 173, 136, 1),
  //   ],
  //   [
  //     Color.fromRGBO(255, 212, 243, 1),
  //     Color.fromRGBO(254, 65, 138, 1),
  //   ],
  //   [
  //     Color.fromRGBO(241, 244, 247, 1),
  //     Color.fromRGBO(241, 244, 247, 1),
  //   ],
  //   [
  //     Color.fromRGBO(255, 115, 132, 1),
  //     Color.fromRGBO(255, 123, 13, 1),
  //   ]
  // ];

  @override
  void initState() {
    super.initState();

    newchart();
    // chartnew();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
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
                    builder: (context) => FDADashboardWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xFF0D0D0D),
                size: 30,
              ),
            ),
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(90, 0, 0, 0),
              child: Text(
                'Booking',
                style: TrymdPartnerTheme.of(context).bodyText1.override(
                      fontFamily: 'Harmonia Sans W01 bold',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: 362,
                        height: 32,
                        decoration: BoxDecoration(
                            color: Color(0xFFEFEFF0),
                            borderRadius: BorderRadius.circular(10)),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              text: 'Today',
                            ),
                            Tab(
                              text: 'Week',
                            ),
                            Tab(
                              text: 'Month',
                            ),
                            Tab(
                              text: 'year',
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      child: TabBarView(
                    controller: _tabController,
                    children: [days(), days(), days(), days()],
                  )),
                  // Expanded(
                  //     child: Container(
                  //         width: double.infinity,
                  //         height: double.infinity,
                  //         decoration: BoxDecoration(
                  //           color: TrymdPartnerTheme.of(context).primaryBtnText,
                  //         ),
                  //         child: SingleChildScrollView(
                  //             child:
                  //                 Column(mainAxisSize: MainAxisSize.max, children: [
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(16, 20, 0, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 FaIcon(
                  //                   FontAwesomeIcons.chevronLeft,
                  //                   color: Color(0xFFCED5DA),
                  //                   size: 24,
                  //                 ),
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       115, 0, 0, 0),
                  //                   child: Text(
                  //                     date,
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 20,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       100, 0, 0, 0),
                  //                   child: FaIcon(
                  //                     FontAwesomeIcons.chevronRight,
                  //                     color: Color(0xFFCED5DA),
                  //                     size: 24,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  //             child: PieChart(
                  //               chartLegendSpacing: 5,
                  //               dataMap: chartData,
                  //               colorList: colorList,
                  //               chartRadius: MediaQuery.of(context).size.width / 2,
                  //               centerText: dtrymd + "\nBookings",
                  //               centerTextStyle: TextStyle(
                  //                   fontFamily: 'geometric sans-serif',
                  //                   color: Colors.black,
                  //                   fontSize: 30,
                  //                   fontWeight: FontWeight.w700),
                  //               chartType: ChartType.ring,
                  //               ringStrokeWidth: 24,
                  //               animationDuration: const Duration(seconds: 2),
                  //               chartValuesOptions: const ChartValuesOptions(
                  //                   showChartValues: false,
                  //                   showChartValuesOutside: false,
                  //                   showChartValuesInPercentage: false,
                  //                   showChartValueBackground: false),
                  //               legendOptions: const LegendOptions(
                  //                   showLegends: false,
                  //                   legendShape: BoxShape.rectangle,
                  //                   legendTextStyle: TextStyle(fontSize: 15),
                  //                   legendPosition: LegendPosition.bottom,
                  //                   showLegendsInRow: true),
                  //               gradientList: gradientList,
                  //             ),
                  //           ),
                  //           // CircularPercentIndicator(
                  //           //     percent: 0.5,
                  //           //     radius: 77.5,
                  //           //     lineWidth: 20,
                  //           //     animation: true,
                  //           //     progressColor: Color(0xFFFF7B0D),
                  //           //     backgroundColor: Color(0xFFF1F4F7),
                  //           //     center: Text(
                  //           //       '     70\nbookings',
                  //           //       textAlign: TextAlign.start,
                  //           //       style:
                  //           //           TrymdPartnerTheme.of(context).bodyText1.override(
                  //           //                 fontFamily: 'Harmonia Sans W01 bold',
                  //           //                 color: Colors.black,
                  //           //                 fontSize: 23,
                  //           //                 fontWeight: FontWeight.bold,
                  //           //                 useGoogleFonts: false,
                  //           //               ),
                  //           //     ),
                  //           //     startAngle: 20),

                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       30, 0, 0, 16),
                  //                   child: Container(
                  //                     width: 30,
                  //                     height: 5,
                  //                     decoration: BoxDecoration(
                  //                       color: Color(0xFFFF7B0D),
                  //                       borderRadius: BorderRadius.circular(90),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Column(
                  //                     mainAxisSize: MainAxisSize.max,
                  //                     children: [
                  //                       Text(
                  //                         'Trym’d Bookings',
                  //                         style: TrymdPartnerTheme.of(context)
                  //                             .bodyText1
                  //                             .override(
                  //                               fontFamily:
                  //                                   'Harmonia Sans W01 bold',
                  //                               fontWeight: FontWeight.bold,
                  //                               useGoogleFonts: false,
                  //                             ),
                  //                       ),
                  //                       Padding(
                  //                         padding: EdgeInsetsDirectional.fromSTEB(
                  //                             0, 0, 50, 0),
                  //                         child: Row(
                  //                           mainAxisSize: MainAxisSize.max,
                  //                           children: [
                  //                             Text(
                  //                               bptrymd + '%',
                  //                               style: TrymdPartnerTheme.of(context)
                  //                                   .bodyText1,
                  //                             ),
                  //                             Padding(
                  //                               padding:
                  //                                   EdgeInsetsDirectional.fromSTEB(
                  //                                       2, 0, 0, 0),
                  //                               child: Text(
                  //                                 dtrymd,
                  //                                 style:
                  //                                     TrymdPartnerTheme.of(context)
                  //                                         .bodyText1
                  //                                         .override(
                  //                                           fontFamily:
                  //                                               'Harmonia Sans W01 bold',
                  //                                           color:
                  //                                               Color(0xFFFF7B0D),
                  //                                           useGoogleFonts: false,
                  //                                         ),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       40, 0, 0, 16),
                  //                   child: Container(
                  //                     width: 30,
                  //                     height: 5,
                  //                     decoration: BoxDecoration(
                  //                       color: Color(0xFFFE418A),
                  //                       borderRadius: BorderRadius.circular(90),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Column(
                  //                     mainAxisSize: MainAxisSize.max,
                  //                     children: [
                  //                       Text(
                  //                         'Walk-In Bookings',
                  //                         style: TrymdPartnerTheme.of(context)
                  //                             .bodyText1
                  //                             .override(
                  //                               fontFamily:
                  //                                   'Harmonia Sans W01 bold',
                  //                               fontWeight: FontWeight.bold,
                  //                               useGoogleFonts: false,
                  //                             ),
                  //                       ),
                  //                       Padding(
                  //                         padding: EdgeInsetsDirectional.fromSTEB(
                  //                             0, 0, 50, 0),
                  //                         child: Row(
                  //                           mainAxisSize: MainAxisSize.max,
                  //                           children: [
                  //                             Text(
                  //                               // bwalkin
                  //                               bpwalkin + '%',
                  //                               style: TrymdPartnerTheme.of(context)
                  //                                   .bodyText1,
                  //                             ),
                  //                             Padding(
                  //                               padding:
                  //                                   EdgeInsetsDirectional.fromSTEB(
                  //                                       2, 0, 0, 0),
                  //                               child: Text(
                  //                                 dwalk,
                  //                                 style:
                  //                                     TrymdPartnerTheme.of(context)
                  //                                         .bodyText1
                  //                                         .override(
                  //                                           fontFamily:
                  //                                               'Harmonia Sans W01 bold',
                  //                                           color:
                  //                                               Color(0xFFFE418A),
                  //                                           useGoogleFonts: false,
                  //                                         ),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       30, 0, 0, 16),
                  //                   child: Container(
                  //                     width: 30,
                  //                     height: 5,
                  //                     decoration: BoxDecoration(
                  //                       color: Color(0xFF01AD88),
                  //                       borderRadius: BorderRadius.circular(90),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Column(
                  //                     mainAxisSize: MainAxisSize.max,
                  //                     children: [
                  //                       Text(
                  //                         'Available Bookings',
                  //                         style: TrymdPartnerTheme.of(context)
                  //                             .bodyText1
                  //                             .override(
                  //                               fontFamily:
                  //                                   'Harmonia Sans W01 bold',
                  //                               fontWeight: FontWeight.bold,
                  //                               useGoogleFonts: false,
                  //                             ),
                  //                       ),
                  //                       Padding(
                  //                         padding: EdgeInsetsDirectional.fromSTEB(
                  //                             0, 0, 50, 0),
                  //                         child: Row(
                  //                           mainAxisSize: MainAxisSize.max,
                  //                           children: [
                  //                             Text(
                  //                               bpavailable + '%',
                  //                               textAlign: TextAlign.start,
                  //                               style: TrymdPartnerTheme.of(context)
                  //                                   .bodyText1
                  //                                   .override(
                  //                                     fontFamily:
                  //                                         'Harmonia Sans W01 bold',
                  //                                     fontWeight: FontWeight.bold,
                  //                                     useGoogleFonts: false,
                  //                                   ),
                  //                             ),
                  //                             Padding(
                  //                               padding:
                  //                                   EdgeInsetsDirectional.fromSTEB(
                  //                                       2, 0, 16, 0),
                  //                               child: Text(
                  //                                 davailable,
                  //                                 style: TrymdPartnerTheme.of(
                  //                                         context)
                  //                                     .bodyText1
                  //                                     .override(
                  //                                       fontFamily:
                  //                                           'Harmonia Sans W01 bold',
                  //                                       color: Color(0xFFDFE3ED),
                  //                                       fontWeight: FontWeight.bold,
                  //                                       useGoogleFonts: false,
                  //                                     ),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       26, 0, 0, 16),
                  //                   child: Container(
                  //                     width: 30,
                  //                     height: 5,
                  //                     decoration: BoxDecoration(
                  //                       color: Color(0xFFF1F4F7),
                  //                       borderRadius: BorderRadius.circular(90),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Column(
                  //                     mainAxisSize: MainAxisSize.max,
                  //                     children: [
                  //                       Text(
                  //                         'Cancel bookings',
                  //                         style: TrymdPartnerTheme.of(context)
                  //                             .bodyText1
                  //                             .override(
                  //                               fontFamily:
                  //                                   'Harmonia Sans W01 bold',
                  //                               fontWeight: FontWeight.bold,
                  //                               useGoogleFonts: false,
                  //                             ),
                  //                       ),
                  //                       Padding(
                  //                         padding: EdgeInsetsDirectional.fromSTEB(
                  //                             0, 0, 50, 0),
                  //                         child: Row(
                  //                           mainAxisSize: MainAxisSize.max,
                  //                           children: [
                  //                             Text(
                  //                               bpcancel + '%',
                  //                               style: TrymdPartnerTheme.of(context)
                  //                                   .bodyText1
                  //                                   .override(
                  //                                     fontFamily:
                  //                                         'Harmonia Sans W01 bold',
                  //                                     fontWeight: FontWeight.bold,
                  //                                     useGoogleFonts: false,
                  //                                   ),
                  //                             ),
                  //                             Padding(
                  //                               padding:
                  //                                   EdgeInsetsDirectional.fromSTEB(
                  //                                       2, 0, 0, 0),
                  //                               child: Text(
                  //                                 dcancel,
                  //                                 style: TrymdPartnerTheme.of(
                  //                                         context)
                  //                                     .bodyText1
                  //                                     .override(
                  //                                       fontFamily:
                  //                                           'Harmonia Sans W01 bold',
                  //                                       color: Color(0xFFDFE3ED),
                  //                                       fontWeight: FontWeight.bold,
                  //                                       useGoogleFonts: false,
                  //                                     ),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Divider(
                  //             height: 30,
                  //             thickness: 1,
                  //             color: Color(0xFFF1F4F7),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Text(
                  //                     'trym\'d booking slot /',
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  //                   child: Text(
                  //                     bookingslot,
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           color: Color(0xFF477FFF),
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  //             child: Material(
                  //               color: Colors.transparent,
                  //               elevation: 1,
                  //               shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(7),
                  //               ),
                  //               child: Container(
                  //                 width: 352,
                  //                 height: 262,
                  //                 decoration: BoxDecoration(
                  //                   color:
                  //                       TrymdPartnerTheme.of(context).primaryBtnText,
                  //                   borderRadius: BorderRadius.circular(7),
                  //                 ),
                  //                 child: Column(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: [
                  //                     Padding(
                  //                       padding: EdgeInsetsDirectional.fromSTEB(
                  //                           10, 26, 0, 0),
                  //                       child: Row(
                  //                         mainAxisSize: MainAxisSize.max,
                  //                         children: [
                  //                           Padding(
                  //                             padding:
                  //                                 EdgeInsetsDirectional.fromSTEB(
                  //                                     10, 0, 0, 0),
                  //                             child: Column(
                  //                               mainAxisSize: MainAxisSize.max,
                  //                               children: [
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 0, 30, 0),
                  //                                   child: Text(
                  //                                     weekly,
                  //                                     style: TrymdPartnerTheme.of(
                  //                                             context)
                  //                                         .bodyText1
                  //                                         .override(
                  //                                           fontFamily:
                  //                                               'Harmonia Sans W01 bold',
                  //                                           fontWeight:
                  //                                               FontWeight.bold,
                  //                                           useGoogleFonts: false,
                  //                                         ),
                  //                                   ),
                  //                                 ),
                  //                                 Text(
                  //                                   'WEEKLY',
                  //                                   style:
                  //                                       TrymdPartnerTheme.of(context)
                  //                                           .bodyText1
                  //                                           .override(
                  //                                             fontFamily:
                  //                                                 'harmonia Sans W01 regular',
                  //                                             fontWeight:
                  //                                                 FontWeight.bold,
                  //                                             useGoogleFonts: false,
                  //                                           ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 EdgeInsetsDirectional.fromSTEB(
                  //                                     10, 26, 0, 0),
                  //                             child: Container(
                  //                               width: 39,
                  //                               height: 3,
                  //                               decoration: BoxDecoration(
                  //                                 color: Color(0x85D8D8D8),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(90),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 EdgeInsetsDirectional.fromSTEB(
                  //                                     110, 26, 0, 0),
                  //                             child: Container(
                  //                               width: 39,
                  //                               height: 3,
                  //                               decoration: BoxDecoration(
                  //                                 color: Color(0xFFFF7B0D),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(90),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 EdgeInsetsDirectional.fromSTEB(
                  //                                     10, 0, 0, 0),
                  //                             child: Column(
                  //                               mainAxisSize: MainAxisSize.max,
                  //                               children: [
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(30, 0, 0, 0),
                  //                                   child: Text(
                  //                                     today,
                  //                                     style: TrymdPartnerTheme.of(
                  //                                             context)
                  //                                         .bodyText1
                  //                                         .override(
                  //                                           fontFamily:
                  //                                               'Harmonia Sans W01 bold',
                  //                                           fontWeight:
                  //                                               FontWeight.bold,
                  //                                           useGoogleFonts: false,
                  //                                         ),
                  //                                   ),
                  //                                 ),
                  //                                 Text(
                  //                                   'TODAY',
                  //                                   style:
                  //                                       TrymdPartnerTheme.of(context)
                  //                                           .bodyText1
                  //                                           .override(
                  //                                             fontFamily:
                  //                                                 'harmonia Sans W01 regular',
                  //                                             color:
                  //                                                 Color(0xFFFF7B0D),
                  //                                             fontWeight:
                  //                                                 FontWeight.bold,
                  //                                             useGoogleFonts: false,
                  //                                           ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                     Divider(
                  //                       height: 20,
                  //                       thickness: 1,
                  //                       indent: 20,
                  //                       endIndent: 20,
                  //                       color: Color(0xFFF1F4F7),
                  //                     ),
                  //                     Padding(
                  //                       padding: EdgeInsetsDirectional.fromSTEB(
                  //                           44, 10, 0, 0),
                  //                       child: Row(
                  //                         mainAxisSize: MainAxisSize.max,
                  //                         children: [
                  //                           Column(
                  //                             mainAxisSize: MainAxisSize.max,
                  //                             children: [
                  //                               Container(
                  //                                 width: 21,
                  //                                 height: 29,
                  //                                 decoration: BoxDecoration(
                  //                                   color: Color(0xFFE1E4EB),
                  //                                 ),
                  //                               ),
                  //                               Padding(
                  //                                 padding: EdgeInsetsDirectional
                  //                                     .fromSTEB(0, 3, 0, 0),
                  //                                 child: Container(
                  //                                   width: 21,
                  //                                   height: 29,
                  //                                   decoration: BoxDecoration(
                  //                                     color: Color(0xFFE1E4EB),
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                               Padding(
                  //                                 padding: EdgeInsetsDirectional
                  //                                     .fromSTEB(0, 3, 0, 0),
                  //                                 child: Container(
                  //                                   width: 21,
                  //                                   height: 29,
                  //                                   decoration: BoxDecoration(
                  //                                     color: Color(0xFFFF7384),
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                               Padding(
                  //                                 padding: EdgeInsetsDirectional
                  //                                     .fromSTEB(0, 3, 0, 0),
                  //                                 child: Container(
                  //                                   width: 21,
                  //                                   height: 29,
                  //                                   decoration: BoxDecoration(
                  //                                     color: Color(0xFFFF7384),
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                               Padding(
                  //                                 padding: EdgeInsetsDirectional
                  //                                     .fromSTEB(0, 8, 0, 0),
                  //                                 child: Text(
                  //                                   '7-8',
                  //                                   style:
                  //                                       TrymdPartnerTheme.of(context)
                  //                                           .bodyText1
                  //                                           .override(
                  //                                             fontFamily:
                  //                                                 'Harmonia Sans W01 bold',
                  //                                             color:
                  //                                                 Color(0xFF9F9FA9),
                  //                                             fontSize: 9,
                  //                                             fontWeight:
                  //                                                 FontWeight.bold,
                  //                                             useGoogleFonts: false,
                  //                                           ),
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 EdgeInsetsDirectional.fromSTEB(
                  //                                     20, 0, 0, 0),
                  //                             child: Column(
                  //                               mainAxisSize: MainAxisSize.max,
                  //                               children: [
                  //                                 Container(
                  //                                   width: 21,
                  //                                   height: 29,
                  //                                   decoration: BoxDecoration(
                  //                                     color: Color(0xFFE1E4EB),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFFF7384),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFE1E4EB),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFFF7384),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 8, 0, 0),
                  //                                   child: Text(
                  //                                     '8-9',
                  //                                     style: TrymdPartnerTheme.of(
                  //                                             context)
                  //                                         .bodyText1
                  //                                         .override(
                  //                                           fontFamily:
                  //                                               'Harmonia Sans W01 bold',
                  //                                           color:
                  //                                               Color(0xFF9F9FA9),
                  //                                           fontSize: 9,
                  //                                           fontWeight:
                  //                                               FontWeight.bold,
                  //                                           useGoogleFonts: false,
                  //                                         ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 EdgeInsetsDirectional.fromSTEB(
                  //                                     20, 0, 0, 0),
                  //                             child: Column(
                  //                               mainAxisSize: MainAxisSize.max,
                  //                               children: [
                  //                                 Container(
                  //                                   width: 21,
                  //                                   height: 29,
                  //                                   decoration: BoxDecoration(
                  //                                     color: Color(0xFFE1E4EB),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFFF7384),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFE1E4EB),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFFF7384),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 8, 0, 0),
                  //                                   child: Text(
                  //                                     '9-10',
                  //                                     style: TrymdPartnerTheme.of(
                  //                                             context)
                  //                                         .bodyText1
                  //                                         .override(
                  //                                           fontFamily:
                  //                                               'Harmonia Sans W01 bold',
                  //                                           color:
                  //                                               Color(0xFF9F9FA9),
                  //                                           fontSize: 9,
                  //                                           fontWeight:
                  //                                               FontWeight.bold,
                  //                                           useGoogleFonts: false,
                  //                                         ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 EdgeInsetsDirectional.fromSTEB(
                  //                                     20, 0, 0, 0),
                  //                             child: Column(
                  //                               mainAxisSize: MainAxisSize.max,
                  //                               children: [
                  //                                 Container(
                  //                                   width: 21,
                  //                                   height: 29,
                  //                                   decoration: BoxDecoration(
                  //                                     color: Color(0xFFE1E4EB),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFE1E4EB),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFFF7384),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFE1E4EB),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 8, 0, 0),
                  //                                   child: Text(
                  //                                     '10-11',
                  //                                     style: TrymdPartnerTheme.of(
                  //                                             context)
                  //                                         .bodyText1
                  //                                         .override(
                  //                                           fontFamily:
                  //                                               'Harmonia Sans W01 bold',
                  //                                           color:
                  //                                               Color(0xFF9F9FA9),
                  //                                           fontSize: 9,
                  //                                           fontWeight:
                  //                                               FontWeight.bold,
                  //                                           useGoogleFonts: false,
                  //                                         ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 EdgeInsetsDirectional.fromSTEB(
                  //                                     20, 0, 0, 0),
                  //                             child: Column(
                  //                               mainAxisSize: MainAxisSize.max,
                  //                               children: [
                  //                                 Container(
                  //                                   width: 21,
                  //                                   height: 29,
                  //                                   decoration: BoxDecoration(
                  //                                     color: Color(0xFFFF7384),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFFF7384),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFF01AD88),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFFF7384),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 8, 0, 0),
                  //                                   child: Text(
                  //                                     '11-12',
                  //                                     style: TrymdPartnerTheme.of(
                  //                                             context)
                  //                                         .bodyText1
                  //                                         .override(
                  //                                           fontFamily:
                  //                                               'Harmonia Sans W01 bold',
                  //                                           color:
                  //                                               Color(0xFF9F9FA9),
                  //                                           fontSize: 9,
                  //                                           fontWeight:
                  //                                               FontWeight.bold,
                  //                                           useGoogleFonts: false,
                  //                                         ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 EdgeInsetsDirectional.fromSTEB(
                  //                                     20, 0, 0, 0),
                  //                             child: Column(
                  //                               mainAxisSize: MainAxisSize.max,
                  //                               children: [
                  //                                 Container(
                  //                                   width: 21,
                  //                                   height: 29,
                  //                                   decoration: BoxDecoration(
                  //                                     color: Color(0xFF01AD88),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFF01AD88),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFFF7384),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFF01AD88),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 8, 0, 0),
                  //                                   child: Text(
                  //                                     '1-2',
                  //                                     style: TrymdPartnerTheme.of(
                  //                                             context)
                  //                                         .bodyText1
                  //                                         .override(
                  //                                           fontFamily:
                  //                                               'Harmonia Sans W01 bold',
                  //                                           color:
                  //                                               Color(0xFF9F9FA9),
                  //                                           fontSize: 9,
                  //                                           fontWeight:
                  //                                               FontWeight.bold,
                  //                                           useGoogleFonts: false,
                  //                                         ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 EdgeInsetsDirectional.fromSTEB(
                  //                                     20, 0, 0, 0),
                  //                             child: Column(
                  //                               mainAxisSize: MainAxisSize.max,
                  //                               children: [
                  //                                 Container(
                  //                                   width: 21,
                  //                                   height: 29,
                  //                                   decoration: BoxDecoration(
                  //                                     color: Color(0xFF01AD88),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFFF7384),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFFF7384),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 3, 0, 0),
                  //                                   child: Container(
                  //                                     width: 21,
                  //                                     height: 29,
                  //                                     decoration: BoxDecoration(
                  //                                       color: Color(0xFFFF7384),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(0, 8, 0, 0),
                  //                                   child: Text(
                  //                                     '1-3',
                  //                                     style: TrymdPartnerTheme.of(
                  //                                             context)
                  //                                         .bodyText1
                  //                                         .override(
                  //                                           fontFamily:
                  //                                               'Harmonia Sans W01 bold',
                  //                                           color:
                  //                                               Color(0xFF9F9FA9),
                  //                                           fontSize: 9,
                  //                                           fontWeight:
                  //                                               FontWeight.bold,
                  //                                           useGoogleFonts: false,
                  //                                         ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(30, 3, 0, 0),
                  //                   child: Container(
                  //                     width: 20,
                  //                     height: 20,
                  //                     decoration: BoxDecoration(
                  //                       color: Color(0xFFFF7384),
                  //                       borderRadius: BorderRadius.circular(3),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Text(
                  //                     'BOOKED',
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(30, 3, 0, 0),
                  //                   child: Container(
                  //                     width: 20,
                  //                     height: 20,
                  //                     decoration: BoxDecoration(
                  //                       color: Color(0xFF01AD88),
                  //                       borderRadius: BorderRadius.circular(3),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Text(
                  //                     'AVAILABLE',
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(30, 3, 0, 0),
                  //                   child: Container(
                  //                     width: 20,
                  //                     height: 20,
                  //                     decoration: BoxDecoration(
                  //                       color: Color(0xFFE1E4EB),
                  //                       borderRadius: BorderRadius.circular(3),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Text(
                  //                     'EXPIRED',
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Divider(
                  //             height: 30,
                  //             thickness: 1,
                  //             color: Color(0xFFF1F4F7),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Text(
                  //                     'Service Details /',
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  //                   child: Text(
                  //                     bookingslot,
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           color: Color(0xFF477FFF),
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(90, 0, 0, 0),
                  //                   child: Text(
                  //                     'Bookings',
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 12,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  //                   child: Text(
                  //                     "(" + today + ")",
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 12,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Text(
                  //                     'Vaccination',
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       230, 0, 0, 0),
                  //                   child: Text(
                  //                     vacno,
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 12,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                  //             child: LinearPercentIndicator(
                  //                 percent: vacper,
                  //                 width: 360,
                  //                 lineHeight: 10,
                  //                 animation: true,
                  //                 progressColor: Color(0xFF477FFF),
                  //                 backgroundColor: Color(0xFFF1F4F8),
                  //                 barRadius: Radius.circular(5)),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Text(
                  //                     'Follow-Up',
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       242, 0, 0, 0),
                  //                   child: Text(
                  //                     follno,
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 12,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                  //             child: LinearPercentIndicator(
                  //                 percent: follper,
                  //                 width: 360,
                  //                 lineHeight: 10,
                  //                 animation: true,
                  //                 progressColor: Color(0xFF477FFF),
                  //                 backgroundColor: Color(0xFFF1F4F8),
                  //                 barRadius: Radius.circular(5)),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Text(
                  //                     'Consultation',
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       222, 0, 0, 0),
                  //                   child: Text(
                  //                     consno,
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 12,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                  //             child: LinearPercentIndicator(
                  //                 percent: consper,
                  //                 width: 360,
                  //                 lineHeight: 10,
                  //                 animation: true,
                  //                 progressColor: Color(0xFF477FFF),
                  //                 backgroundColor: Color(0xFFF1F4F8),
                  //                 barRadius: Radius.circular(5)),
                  //           ),
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  //                   child: Text(
                  //                     'Injection',
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       252, 0, 0, 0),
                  //                   child: Text(
                  //                     injeno,
                  //                     style: TrymdPartnerTheme.of(context)
                  //                         .bodyText1
                  //                         .override(
                  //                           fontFamily: 'Harmonia Sans W01 bold',
                  //                           fontSize: 12,
                  //                           fontWeight: FontWeight.bold,
                  //                           useGoogleFonts: false,
                  //                         ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding:
                  //                 EdgeInsetsDirectional.fromSTEB(16, 10, 0, 40),
                  //             child: LinearPercentIndicator(
                  //                 percent: injeper,
                  //                 width: 360,
                  //                 lineHeight: 10,
                  //                 animation: true,
                  //                 progressColor: Color(0xFF477FFF),
                  //                 backgroundColor: Color(0xFFF1F4F8),
                  //                 barRadius: Radius.circular(5)),
                  //           ),
                  //         ])),),),
                ],
              ),
            ),
          ),
        ));
  }

  newchart() async {
    var response = Trymdbooking();
    Map<String, dynamic> value = await response.trymdbooking();
    btrymd = value["bookingtrymd"]["chartData"]["btrymd"];
    bavailable = value["bookingtrymd"]["chartData"]["bavailable"];
    bwalkin = value["bookingtrymd"]["chartData"]["bwalkin"];
    bcancel = value["bookingtrymd"]["chartData"]["bcancel"];
    dtrymd = value["bookingtrymd"]["dtrymd"];
    dwalk = value["bookingtrymd"]["dwalk"];
    davailable = value["bookingtrymd"]["davailable"];
    dcancel = value["bookingtrymd"]["dcancel"];
    bookingslot = value["bookingtrymd"]["bookingslot"];
    weekly = value["bookingtrymd"]["weekly"];
    today = value["bookingtrymd"]["today"];
    vacper = value["bookingtrymd"]["vacper"];
    follper = value["bookingtrymd"]["follper"];
    consper = value["bookingtrymd"]["consper"];
    injeper = value["bookingtrymd"]["injeper"];
    vacno = value["bookingtrymd"]["vacno"];
    follno = value["bookingtrymd"]["follno"];
    consno = value["bookingtrymd"]["consno"];
    injeno = value["bookingtrymd"]["injeno"];
    date = value["bookingtrymd"]["date"];
    bptrymd = value["bookingtrymd"]["bptrymd"];
    bpavailable = value["bookingtrymd"]["bpavailable"];
    bpwalkin = value["bookingtrymd"]["bpwalkin"];
    bpcancel = value["bookingtrymd"]["bpcancel"];
    // boverall = value["bookingtrymd"]["boverall"];
    // bavailable = value["bookingtrymd"]["chartData"]["btrymd"];
    print(bavailable);

    chartData = {
      "Cancel": bcancel,
      "Available": bavailable,
      "Walk-in": bwalkin,
      "Trym'd": btrymd,
    };

    colorList = [
      const Color(0xFFFF7B0D),
      const Color(0xFFFE418A),
      const Color(0xFF01AD88),
      const Color(0xFFF1F4F7),
    ];
    gradientList = <List<Color>>[
      [
        Color.fromRGBO(13, 212, 57, 1),
        Color.fromRGBO(1, 173, 136, 1),
      ],
      [
        Color.fromRGBO(255, 212, 243, 1),
        Color.fromRGBO(254, 65, 138, 1),
      ],
      [
        Color.fromRGBO(241, 244, 247, 1),
        Color.fromRGBO(241, 244, 247, 1),
      ],
      [
        Color.fromRGBO(255, 115, 132, 1),
        Color.fromRGBO(255, 123, 13, 1),
      ]
    ];
    setState(() {});
  }

  Widget days() {
    return Container(
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
              padding: EdgeInsetsDirectional.fromSTEB(16, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: Color(0xFFCED5DA),
                    size: 24,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(115, 0, 0, 0),
                    child: Text(
                      date,
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                    child: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Color(0xFFCED5DA),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: PieChart(
                chartLegendSpacing: 5,
                dataMap: chartData,
                colorList: colorList,
                chartRadius: MediaQuery.of(context).size.width / 2,
                centerText: dtrymd + "\nBookings",
                centerTextStyle: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
                chartType: ChartType.ring,
                ringStrokeWidth: 24,
                animationDuration: const Duration(seconds: 2),
                chartValuesOptions: const ChartValuesOptions(
                    showChartValues: false,
                    showChartValuesOutside: false,
                    showChartValuesInPercentage: false,
                    showChartValueBackground: false),
                legendOptions: const LegendOptions(
                    showLegends: false,
                    legendShape: BoxShape.rectangle,
                    legendTextStyle: TextStyle(fontSize: 15),
                    legendPosition: LegendPosition.bottom,
                    showLegendsInRow: true),
                gradientList: gradientList,
              ),
            ),
            // CircularPercentIndicator(
            //     percent: 0.5,
            //     radius: 77.5,
            //     lineWidth: 20,
            //     animation: true,
            //     progressColor: Color(0xFFFF7B0D),
            //     backgroundColor: Color(0xFFF1F4F7),
            //     center: Text(
            //       '     70\nbookings',
            //       textAlign: TextAlign.start,
            //       style:
            //           TrymdPartnerTheme.of(context).bodyText1.override(
            //                 fontFamily: 'Harmonia Sans W01 bold',
            //                 color: Colors.black,
            //                 fontSize: 23,
            //                 fontWeight: FontWeight.bold,
            //                 useGoogleFonts: false,
            //               ),
            //     ),
            //     startAngle: 20),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 16),
                    child: Container(
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF7B0D),
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Trym’d Bookings',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                bptrymd + '%',
                                style: TrymdPartnerTheme.of(context).bodyText1,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                child: Text(
                                  dtrymd,
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Harmonia Sans W01 bold',
                                        color: Color(0xFFFF7B0D),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 16),
                    child: Container(
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Color(0xFFFE418A),
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Walk-In Bookings',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                // bwalkin
                                bpwalkin + '%',
                                style: TrymdPartnerTheme.of(context).bodyText1,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                child: Text(
                                  dwalk,
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Harmonia Sans W01 bold',
                                        color: Color(0xFFFE418A),
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 16),
                    child: Container(
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Color(0xFF01AD88),
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Available Bookings',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                bpavailable + '%',
                                textAlign: TextAlign.start,
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 bold',
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 16, 0),
                                child: Text(
                                  davailable,
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Harmonia Sans W01 bold',
                                        color: Color(0xFFDFE3ED),
                                        fontWeight: FontWeight.bold,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(26, 0, 0, 16),
                    child: Container(
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4F7),
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Cancel bookings',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                bpcancel + '%',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 bold',
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                child: Text(
                                  dcancel,
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Harmonia Sans W01 bold',
                                        color: Color(0xFFDFE3ED),
                                        fontWeight: FontWeight.bold,
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
                ],
              ),
            ),
            Divider(
              height: 30,
              thickness: 1,
              color: Color(0xFFF1F4F7),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'trym\'d booking slot /',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                    child: Text(
                      bookingslot,
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            color: Color(0xFF477FFF),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Material(
                color: Colors.transparent,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Container(
                  width: 352,
                  height: 262,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 26, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 30, 0),
                                    child: Text(
                                      weekly,
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'WEEKLY',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              'harmonia Sans W01 regular',
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 26, 0, 0),
                              child: Container(
                                width: 39,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: Color(0x85D8D8D8),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(110, 26, 0, 0),
                              child: Container(
                                width: 39,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF7B0D),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30, 0, 0, 0),
                                    child: Text(
                                      today,
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'TODAY',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              'harmonia Sans W01 regular',
                                          color: Color(0xFFFF7B0D),
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xFFF1F4F7),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(44, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 21,
                                  height: 29,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE1E4EB),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 3, 0, 0),
                                  child: Container(
                                    width: 21,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1E4EB),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 3, 0, 0),
                                  child: Container(
                                    width: 21,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF7384),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 3, 0, 0),
                                  child: Container(
                                    width: 21,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF7384),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    '7-8',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Harmonia Sans W01 bold',
                                          color: Color(0xFF9F9FA9),
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 21,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1E4EB),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF7384),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE1E4EB),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF7384),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      '8-9',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            color: Color(0xFF9F9FA9),
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 21,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1E4EB),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF7384),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE1E4EB),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF7384),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      '9-10',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            color: Color(0xFF9F9FA9),
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 21,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1E4EB),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE1E4EB),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF7384),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE1E4EB),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      '10-11',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            color: Color(0xFF9F9FA9),
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 21,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF7384),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF7384),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF01AD88),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF7384),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      '11-12',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            color: Color(0xFF9F9FA9),
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 21,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF01AD88),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF01AD88),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF7384),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF01AD88),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      '1-2',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            color: Color(0xFF9F9FA9),
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 21,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF01AD88),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF7384),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF7384),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 0),
                                    child: Container(
                                      width: 21,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF7384),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      '1-3',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            color: Color(0xFF9F9FA9),
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
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
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 3, 0, 0),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF7384),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'BOOKED',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 3, 0, 0),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFF01AD88),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'AVAILABLE',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 3, 0, 0),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFFE1E4EB),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'EXPIRED',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 30,
              thickness: 1,
              color: Color(0xFFF1F4F7),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Service Details /',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                    child: Text(
                      bookingslot,
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            color: Color(0xFF477FFF),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(90, 0, 0, 0),
                    child: Text(
                      'Bookings',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Text(
                      "(" + today + ")",
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Vaccination',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(230, 0, 0, 0),
                    child: Text(
                      vacno,
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
              child: LinearPercentIndicator(
                percent: vacper,
                width: 360,
                lineHeight: 10,
                animation: true,
                progressColor: Color(0xFF477FFF),
                backgroundColor: Color(0xFFF1F4F8),
                barRadius: Radius.circular(5),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Follow-Up',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(242, 0, 0, 0),
                    child: Text(
                      follno,
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
              child: LinearPercentIndicator(
                  percent: follper,
                  width: 360,
                  lineHeight: 10,
                  animation: true,
                  progressColor: Color(0xFF477FFF),
                  backgroundColor: Color(0xFFF1F4F8),
                  barRadius: Radius.circular(5)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Consultation',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(222, 0, 0, 0),
                    child: Text(
                      consno,
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
              child: LinearPercentIndicator(
                  percent: consper,
                  width: 360,
                  lineHeight: 10,
                  animation: true,
                  progressColor: Color(0xFF477FFF),
                  backgroundColor: Color(0xFFF1F4F8),
                  barRadius: Radius.circular(5)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Injection',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(252, 0, 0, 0),
                    child: Text(
                      injeno,
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 40),
              child: LinearPercentIndicator(
                  percent: injeper,
                  width: 360,
                  lineHeight: 10,
                  animation: true,
                  progressColor: Color(0xFF477FFF),
                  backgroundColor: Color(0xFFF1F4F8),
                  barRadius: Radius.circular(5)),
            ),
          ],
        ),
      ),
    );
  }
}
