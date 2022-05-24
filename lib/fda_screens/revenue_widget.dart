
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
// import 'package:trymd_partner/fda_screens/fdahome.dart';
import 'package:trymd_partner/fda_screens/repository/repository.dart';
import 'package:trymd_partner/fda_screens/screens/fda_dashboard.dart';
import 'package:trymd_partner/global_widget/trymd_partner_theme.dart';

class RevenueWidget extends StatefulWidget {
  const RevenueWidget({Key key}) : super(key: key);

  @override
  _RevenueWidgetState createState() => _RevenueWidgetState();
}

class _RevenueWidgetState extends State<RevenueWidget> {
  Map<String, double> chartData = {};
  List<Color> colorList = [];
  List<dynamic> gradientList = [];
  TabController _tabController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic rwalkin = 0.0;
  dynamic rtrymd = 0.0;
  dynamic rptrymd = "";
  dynamic rpwalkin = "";
  dynamic servicedetails = "";
  dynamic serrevenue = "";
  dynamic dtrymd = "";
  dynamic dwalk = "";

  dynamic today = "";
  dynamic vacper = "";
  dynamic follper = "";
  dynamic consper = "";
  dynamic injeper = "";
  dynamic date = "";

  dynamic vacno = "";
  dynamic follno = "";
  dynamic consno = "";
  dynamic injeno = "";

  @override
  void initState() {
    super.initState();
    newrevenue();
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
                  'Revenue',
                  style:TrymdPartnerTheme.of(context).bodyText1.override(
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
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
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
                    )
                        // child: Container(
                        //   width: double.infinity,
                        //   height: double.infinity,
                        //   decoration: BoxDecoration(
                        //     color:TrymdPartnerTheme.of(context).primaryBtnText,
                        //   ),
                        //   child: SingleChildScrollView(
                        //     child: Column(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: [
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        //           child: Container(
                        //             width: 360,
                        //             height: 32,
                        //             decoration: BoxDecoration(
                        //               color: Color(0xFFEFEFF0),
                        //             ),
                        //             child: Row(
                        //               mainAxisSize: MainAxisSize.max,
                        //               children: [
                        //                 Padding(
                        //                   padding: EdgeInsetsDirectional.fromSTEB(
                        //                       4, 0, 0, 0),
                        //                   child: Material(
                        //                     color: Colors.transparent,
                        //                     elevation: 2,
                        //                     shape: RoundedRectangleBorder(
                        //                       borderRadius: BorderRadius.circular(6),
                        //                     ),
                        //                     child: Container(
                        //                       width: 88,
                        //                       height: 28,
                        //                       decoration: BoxDecoration(
                        //                         color:TrymdPartnerTheme.of(context)
                        //                             .primaryBtnText,
                        //                         borderRadius:
                        //                             BorderRadius.circular(6),
                        //                       ),
                        //                       child: Padding(
                        //                         padding:
                        //                             EdgeInsetsDirectional.fromSTEB(
                        //                                 0, 4, 0, 0),
                        //                         child: Text(
                        //                           'Today',
                        //                           textAlign: TextAlign.center,
                        //                           style:TrymdPartnerTheme.of(context)
                        //                               .bodyText1
                        //                               .override(
                        //                                 fontFamily:
                        //                                     'Harmonia Sans W01 bold',
                        //                                 color: Color(0xFF477FFF),
                        //                                 useGoogleFonts: false,
                        //                               ),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: EdgeInsetsDirectional.fromSTEB(
                        //                       30, 0, 0, 0),
                        //                   child: Text(
                        //                     'Week',
                        //                     style:TrymdPartnerTheme.of(context)
                        //                         .bodyText1
                        //                         .override(
                        //                           fontFamily:
                        //                               'Harmonia Sans W01 bold',
                        //                           fontWeight: FontWeight.bold,
                        //                           useGoogleFonts: false,
                        //                         ),
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: EdgeInsetsDirectional.fromSTEB(
                        //                       25, 0, 0, 0),
                        //                   child: Container(
                        //                     width: 2,
                        //                     height: 20,
                        //                     decoration: BoxDecoration(
                        //                       color: Color(0x2E3C3C43),
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: EdgeInsetsDirectional.fromSTEB(
                        //                       25, 0, 0, 0),
                        //                   child: Text(
                        //                     'Month',
                        //                     style:TrymdPartnerTheme.of(context)
                        //                         .bodyText1
                        //                         .override(
                        //                           fontFamily:
                        //                               'Harmonia Sans W01 bold',
                        //                           fontWeight: FontWeight.bold,
                        //                           useGoogleFonts: false,
                        //                         ),
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: EdgeInsetsDirectional.fromSTEB(
                        //                       25, 0, 0, 0),
                        //                   child: Container(
                        //                     width: 2,
                        //                     height: 20,
                        //                     decoration: BoxDecoration(
                        //                       color: Color(0x2E3C3C43),
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: EdgeInsetsDirectional.fromSTEB(
                        //                       20, 0, 0, 0),
                        //                   child: Text(
                        //                     'Year',
                        //                     style:TrymdPartnerTheme.of(context)
                        //                         .bodyText1
                        //                         .override(
                        //                           fontFamily:
                        //                               'Harmonia Sans W01 bold',
                        //                           fontSize: 14,
                        //                           fontWeight: FontWeight.bold,
                        //                           useGoogleFonts: false,
                        //                         ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 20, 0, 0),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.max,
                        //             children: [
                        //               FaIcon(
                        //                 FontAwesomeIcons.chevronLeft,
                        //                 color: Color(0xFFCED5DA),
                        //                 size: 24,
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     115, 0, 0, 0),
                        //                 child: Text(
                        //                   date,
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 20,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     100, 0, 0, 0),
                        //                 child: FaIcon(
                        //                   FontAwesomeIcons.chevronRight,
                        //                   color: Color(0xFFCED5DA),
                        //                   size: 24,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        //           child: PieChart(
                        //             chartLegendSpacing: 5,
                        //             dataMap: chartData,
                        //             colorList: colorList,
                        //             chartRadius:
                        //                 MediaQuery.of(context).size.width / 2,
                        //             centerText: dtrymd + "\nRevenue",
                        //             centerTextStyle: TextStyle(
                        //                 fontFamily: 'geometric sans-serif',
                        //                 color: Colors.black,
                        //                 fontSize: 30,
                        //                 fontWeight: FontWeight.w700),
                        //             chartType: ChartType.ring,
                        //             ringStrokeWidth: 24,
                        //             animationDuration: const Duration(seconds: 2),
                        //             chartValuesOptions: const ChartValuesOptions(
                        //                 showChartValues: false,
                        //                 showChartValuesOutside: false,
                        //                 showChartValuesInPercentage: false,
                        //                 showChartValueBackground: false),
                        //             legendOptions: const LegendOptions(
                        //                 showLegends: false,
                        //                 legendShape: BoxShape.rectangle,
                        //                 legendTextStyle: TextStyle(fontSize: 15),
                        //                 legendPosition: LegendPosition.bottom,
                        //                 showLegendsInRow: true),
                        //             gradientList: gradientList,
                        //           ),
                        //         ),
                        //         // CircularPercentIndicator(
                        //         //     percent: 0.5,
                        //         //     radius: 77.5,
                        //         //     lineWidth: 20,
                        //         //     animation: true,
                        //         //     progressColor: Color(0xFFFF7B0D),
                        //         //     backgroundColor: Color(0xFFF1F4F7),
                        //         //     center: Text(
                        //         //       '     70\nbookings',
                        //         //       textAlign: TextAlign.start,
                        //         //       style:
                        //         //          TrymdPartnerTheme.of(context).bodyText1.override(
                        //         //                 fontFamily: 'Harmonia Sans W01 bold',
                        //         //                 color: Colors.black,
                        //         //                 fontSize: 23,
                        //         //                 fontWeight: FontWeight.bold,
                        //         //                 useGoogleFonts: false,
                        //         //               ),
                        //         //     ),
                        //         //     startAngle: 20),

                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.max,
                        //             children: [
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     30, 0, 0, 16),
                        //                 child: Container(
                        //                   width: 30,
                        //                   height: 5,
                        //                   decoration: BoxDecoration(
                        //                     color: Color(0XFF477FFF),
                        //                     borderRadius: BorderRadius.circular(90),
                        //                   ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     0, 0, 2, 0),
                        //                 child: Column(
                        //                   mainAxisSize: MainAxisSize.max,
                        //                   children: [
                        //                     Text(
                        //                       'Trym’d Revenue',
                        //                       style:TrymdPartnerTheme.of(context)
                        //                           .bodyText1
                        //                           .override(
                        //                             fontFamily:
                        //                                 'Harmonia Sans W01 bold',
                        //                             fontWeight: FontWeight.bold,
                        //                             useGoogleFonts: false,
                        //                           ),
                        //                     ),
                        //                     Padding(
                        //                       padding: EdgeInsetsDirectional.fromSTEB(
                        //                           10, 0, 50, 0),
                        //                       child: Row(
                        //                         mainAxisSize: MainAxisSize.max,
                        //                         children: [
                        //                           Text(
                        //                             rptrymd + '%',
                        //                             style:
                        //                                TrymdPartnerTheme.of(context)
                        //                                     .bodyText1,
                        //                           ),
                        //                           Padding(
                        //                             padding: EdgeInsetsDirectional
                        //                                 .fromSTEB(2, 0, 0, 0),
                        //                             child: Text(
                        //                               dtrymd,
                        //                               style:
                        //                                  TrymdPartnerTheme.of(context)
                        //                                       .bodyText1
                        //                                       .override(
                        //                                         fontFamily:
                        //                                             'Harmonia Sans W01 bold',
                        //                                         color:
                        //                                             Color(0xFFFF7B0D),
                        //                                         useGoogleFonts: false,
                        //                                       ),
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     40, 0, 0, 16),
                        //                 child: Container(
                        //                   width: 30,
                        //                   height: 5,
                        //                   decoration: BoxDecoration(
                        //                     color: Color(0xFF7459D9),
                        //                     borderRadius: BorderRadius.circular(90),
                        //                   ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     10, 0, 0, 0),
                        //                 child: Column(
                        //                   mainAxisSize: MainAxisSize.max,
                        //                   children: [
                        //                     Text(
                        //                       'Walk-In Revenue',
                        //                       style:TrymdPartnerTheme.of(context)
                        //                           .bodyText1
                        //                           .override(
                        //                             fontFamily:
                        //                                 'Harmonia Sans W01 bold',
                        //                             fontWeight: FontWeight.bold,
                        //                             useGoogleFonts: false,
                        //                           ),
                        //                     ),
                        //                     Padding(
                        //                       padding: EdgeInsetsDirectional.fromSTEB(
                        //                           0, 0, 50, 0),
                        //                       child: Row(
                        //                         mainAxisSize: MainAxisSize.max,
                        //                         children: [
                        //                           Text(
                        //                             rpwalkin + '%',
                        //                             style:
                        //                                TrymdPartnerTheme.of(context)
                        //                                     .bodyText1,
                        //                           ),
                        //                           Padding(
                        //                             padding: EdgeInsetsDirectional
                        //                                 .fromSTEB(2, 0, 0, 0),
                        //                             child: Text(
                        //                               dwalk,
                        //                               style:
                        //                                  TrymdPartnerTheme.of(context)
                        //                                       .bodyText1
                        //                                       .override(
                        //                                         fontFamily:
                        //                                             'Harmonia Sans W01 bold',
                        //                                         color:
                        //                                             Color(0xFFFE418A),
                        //                                         useGoogleFonts: false,
                        //                                       ),
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         // Padding(
                        //         //   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        //         //   child: Row(
                        //         //     mainAxisSize: MainAxisSize.max,
                        //         //     children: [
                        //         //       Padding(
                        //         //         padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 16),
                        //         //         child: Container(
                        //         //           width: 30,
                        //         //           height: 5,
                        //         //           decoration: BoxDecoration(
                        //         //             color: Color(0xFF01AD88),
                        //         //             borderRadius: BorderRadius.circular(90),
                        //         //           ),
                        //         //         ),
                        //         //       ),
                        //         //       Padding(
                        //         //         padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        //         //         child: Column(
                        //         //           mainAxisSize: MainAxisSize.max,
                        //         //           children: [
                        //         //             Text(
                        //         //               'Available Bookings',
                        //         //               style:TrymdPartnerTheme.of(context)
                        //         //                   .bodyText1
                        //         //                   .override(
                        //         //                     fontFamily: 'Harmonia Sans W01 bold',
                        //         //                     fontWeight: FontWeight.bold,
                        //         //                     useGoogleFonts: false,
                        //         //                   ),
                        //         //             ),
                        //         //             Padding(
                        //         //               padding:
                        //         //                   EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                        //         //               child: Row(
                        //         //                 mainAxisSize: MainAxisSize.max,
                        //         //                 children: [
                        //         //                   Text(
                        //         //                     '%',
                        //         //                     textAlign: TextAlign.start,
                        //         //                     style:TrymdPartnerTheme.of(context)
                        //         //                         .bodyText1
                        //         //                         .override(
                        //         //                           fontFamily:
                        //         //                               'Harmonia Sans W01 bold',
                        //         //                           fontWeight: FontWeight.bold,
                        //         //                           useGoogleFonts: false,
                        //         //                         ),
                        //         //                   ),
                        //         //                   Padding(
                        //         //                     padding: EdgeInsetsDirectional.fromSTEB(
                        //         //                         2, 0, 16, 0),
                        //         //                     child: Text(
                        //         //                       "10",
                        //         //                       // davailable,
                        //         //                       style:TrymdPartnerTheme.of(context)
                        //         //                           .bodyText1
                        //         //                           .override(
                        //         //                             fontFamily:
                        //         //                                 'Harmonia Sans W01 bold',
                        //         //                             color: Color(0xFFDFE3ED),
                        //         //                             fontWeight: FontWeight.bold,
                        //         //                             useGoogleFonts: false,
                        //         //                           ),
                        //         //                     ),
                        //         //                   ),
                        //         //                 ],
                        //         //               ),
                        //         //             ),
                        //         //           ],
                        //         //         ),
                        //         //       ),
                        //         //       Padding(
                        //         //         padding: EdgeInsetsDirectional.fromSTEB(26, 0, 0, 16),
                        //         //         child: Container(
                        //         //           width: 30,
                        //         //           height: 5,
                        //         //           decoration: BoxDecoration(
                        //         //             color: Color(0xFFF1F4F7),
                        //         //             borderRadius: BorderRadius.circular(90),
                        //         //           ),
                        //         //         ),
                        //         //       ),
                        //         //       Padding(
                        //         //         padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        //         //         child: Column(
                        //         //           mainAxisSize: MainAxisSize.max,
                        //         //           children: [
                        //         //             Text(
                        //         //               'Cancel bookings',
                        //         //               style:TrymdPartnerTheme.of(context)
                        //         //                   .bodyText1
                        //         //                   .override(
                        //         //                     fontFamily: 'Harmonia Sans W01 bold',
                        //         //                     fontWeight: FontWeight.bold,
                        //         //                     useGoogleFonts: false,
                        //         //                   ),
                        //         //             ),
                        //         //             Padding(
                        //         //               padding:
                        //         //                   EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                        //         //               child: Row(
                        //         //                 mainAxisSize: MainAxisSize.max,
                        //         //                 children: [
                        //         //                   Text(
                        //         //                     rptrymd + '%',
                        //         //                     style:TrymdPartnerTheme.of(context)
                        //         //                         .bodyText1
                        //         //                         .override(
                        //         //                           fontFamily:
                        //         //                               'Harmonia Sans W01 bold',
                        //         //                           fontWeight: FontWeight.bold,
                        //         //                           useGoogleFonts: false,
                        //         //                         ),
                        //         //                   ),
                        //         //                   Padding(
                        //         //                     padding: EdgeInsetsDirectional.fromSTEB(
                        //         //                         2, 0, 0, 0),
                        //         //                     child: Text(
                        //         //                       // dcancel,
                        //         //                       "10",
                        //         //                       style:TrymdPartnerTheme.of(context)
                        //         //                           .bodyText1
                        //         //                           .override(
                        //         //                             fontFamily:
                        //         //                                 'Harmonia Sans W01 bold',
                        //         //                             color: Color(0xFFDFE3ED),
                        //         //                             fontWeight: FontWeight.bold,
                        //         //                             useGoogleFonts: false,
                        //         //                           ),
                        //         //                     ),
                        //         //                   ),
                        //         //                 ],
                        //         //               ),
                        //         //             ),
                        //         //           ],
                        //         //         ),
                        //         //       ),
                        //         //     ],
                        //         //   ),
                        //         // ),
                        //         Divider(
                        //           height: 30,
                        //           thickness: 1,
                        //           color: Color(0xFFF1F4F7),
                        //         ),

                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.max,
                        //             children: [
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     10, 0, 0, 0),
                        //                 child: Text(
                        //                   'Service Details /',
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 16,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     2, 0, 0, 0),
                        //                 child: Text(
                        //                   servicedetails,
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         color: Color(0xFF477FFF),
                        //                         fontSize: 16,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     50, 0, 0, 0),
                        //                 child: Text(
                        //                   'REVENUE',
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 12,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     0, 0, 0, 0),
                        //                 child: Text(
                        //                   "(" + serrevenue + ")",
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 12,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.max,
                        //             children: [
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     10, 0, 0, 0),
                        //                 child: Text(
                        //                   'Vaccination',
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 16,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     210, 0, 0, 0),
                        //                 child: Text(
                        //                   vacno,
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 12,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                        //           child: LinearPercentIndicator(
                        //               percent: vacper,
                        //               width: 360,
                        //               lineHeight: 10,
                        //               animation: true,
                        //               progressColor: Color(0xFF477FFF),
                        //               backgroundColor: Color(0xFFF1F4F8),
                        //               barRadius: Radius.circular(5)),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.max,
                        //             children: [
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     10, 0, 0, 0),
                        //                 child: Text(
                        //                   'Follow-Up',
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 16,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     224, 0, 0, 0),
                        //                 child: Text(
                        //                   follno,
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 12,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                        //           child: LinearPercentIndicator(
                        //               percent: follper,
                        //               width: 360,
                        //               lineHeight: 10,
                        //               animation: true,
                        //               progressColor: Color(0xFF477FFF),
                        //               backgroundColor: Color(0xFFF1F4F8),
                        //               barRadius: Radius.circular(5)),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.max,
                        //             children: [
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     10, 0, 0, 0),
                        //                 child: Text(
                        //                   'Consultation',
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 16,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     210, 0, 0, 0),
                        //                 child: Text(
                        //                   consno,
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 12,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                        //           child: LinearPercentIndicator(
                        //               percent: consper,
                        //               width: 360,
                        //               lineHeight: 10,
                        //               animation: true,
                        //               progressColor: Color(0xFF477FFF),
                        //               backgroundColor: Color(0xFFF1F4F8),
                        //               barRadius: Radius.circular(5)),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.max,
                        //             children: [
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     10, 0, 0, 0),
                        //                 child: Text(
                        //                   'Injection',
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 16,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     232, 0, 0, 0),
                        //                 child: Text(
                        //                   injeno,
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 12,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                        //           child: LinearPercentIndicator(
                        //               percent: injeper,
                        //               width: 360,
                        //               lineHeight: 10,
                        //               animation: true,
                        //               progressColor: Color(0xFF477FFF),
                        //               backgroundColor: Color(0xFFF1F4F8),
                        //               barRadius: Radius.circular(5)),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.max,
                        //             children: [
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     10, 0, 0, 0),
                        //                 child: Text(
                        //                   'Vaccination',
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 16,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     210, 0, 0, 0),
                        //                 child: Text(
                        //                   vacno,
                        //                   style:TrymdPartnerTheme.of(context)
                        //                       .bodyText1
                        //                       .override(
                        //                         fontFamily: 'Harmonia Sans W01 bold',
                        //                         fontSize: 12,
                        //                         fontWeight: FontWeight.bold,
                        //                         useGoogleFonts: false,
                        //                       ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsetsDirectional.fromSTEB(16, 10, 0, 40),
                        //           child: LinearPercentIndicator(
                        //               percent: vacper,
                        //               width: 360,
                        //               lineHeight: 10,
                        //               animation: true,
                        //               progressColor: Color(0xFF477FFF),
                        //               backgroundColor: Color(0xFFF1F4F8),
                        //               barRadius: Radius.circular(5)),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        ),
                  ])),
        ),
      ),
    );
  }

  newrevenue() async {
    var response = Revenue();
    Map<String, dynamic> mustdo = await response.revenue();
    rtrymd = mustdo["bookingtrymd"]["chartData"]["rtrymd"];

    rwalkin = mustdo["bookingtrymd"]["chartData"]["rwalkin"];

    rptrymd = mustdo["bookingtrymd"]["rptrymd"];
    rpwalkin = mustdo["bookingtrymd"]["rpwalkin"];
    dtrymd = mustdo["bookingtrymd"]["dtrymd"];
    dwalk = mustdo["bookingtrymd"]["dwalk"];
    servicedetails = mustdo["bookingtrymd"]["servicedetails"];
    serrevenue = mustdo["bookingtrymd"]["serrevenue"];
    today = mustdo["bookingtrymd"]["today"];
    vacper = mustdo["bookingtrymd"]["vacper"];
    follper = mustdo["bookingtrymd"]["follper"];
    consper = mustdo["bookingtrymd"]["consper"];
    injeper = mustdo["bookingtrymd"]["injeper"];
    vacno = mustdo["bookingtrymd"]["vacno"];
    follno = mustdo["bookingtrymd"]["follno"];
    consno = mustdo["bookingtrymd"]["consno"];
    injeno = mustdo["bookingtrymd"]["injeno"];
    date = mustdo["bookingtrymd"]["date"];

    chartData = {
      "Walk-in": rtrymd,
      "Trym'd": rwalkin,
    };

    colorList = [
      const Color(0xFF477FFF),
      const Color(0xFF7459D9),
    ];
    gradientList = <List<Color>>[
      [
        Color.fromRGBO(71, 127, 255, 1),
        Color.fromRGBO(7, 208, 242, 1),
      ],
      [
        Color.fromRGBO(116, 89, 217, 1),
        Color.fromRGBO(185, 171, 235, 1),
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
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            //   child: Container(
            //     width: 360,
            //     height: 32,
            //     decoration: BoxDecoration(
            //       color: Color(0xFFEFEFF0),
            //     ),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.max,
            //       children: [
            //         Padding(
            //           padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
            //           child: Material(
            //             color: Colors.transparent,
            //             elevation: 2,
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(6),
            //             ),
            //             child: Container(
            //               width: 88,
            //               height: 28,
            //               decoration: BoxDecoration(
            //                 color:TrymdPartnerTheme.of(context).primaryBtnText,
            //                 borderRadius: BorderRadius.circular(6),
            //               ),
            //               child: Padding(
            //                 padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            //                 child: Text(
            //                   'Today',
            //                   textAlign: TextAlign.center,
            //                   style:TrymdPartnerTheme.of(context)
            //                       .bodyText1
            //                       .override(
            //                         fontFamily: 'Harmonia Sans W01 bold',
            //                         color: Color(0xFF477FFF),
            //                         useGoogleFonts: false,
            //                       ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
            //           child: Text(
            //             'Week',
            //             style:TrymdPartnerTheme.of(context).bodyText1.override(
            //                   fontFamily: 'Harmonia Sans W01 bold',
            //                   fontWeight: FontWeight.bold,
            //                   useGoogleFonts: false,
            //                 ),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
            //           child: Container(
            //             width: 2,
            //             height: 20,
            //             decoration: BoxDecoration(
            //               color: Color(0x2E3C3C43),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
            //           child: Text(
            //             'Month',
            //             style:TrymdPartnerTheme.of(context).bodyText1.override(
            //                   fontFamily: 'Harmonia Sans W01 bold',
            //                   fontWeight: FontWeight.bold,
            //                   useGoogleFonts: false,
            //                 ),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
            //           child: Container(
            //             width: 2,
            //             height: 20,
            //             decoration: BoxDecoration(
            //               color: Color(0x2E3C3C43),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            //           child: Text(
            //             'Year',
            //             style:TrymdPartnerTheme.of(context).bodyText1.override(
            //                   fontFamily: 'Harmonia Sans W01 bold',
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold,
            //                   useGoogleFonts: false,
            //                 ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
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
                centerText: dtrymd + "\nRevenue",
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
            //          TrymdPartnerTheme.of(context).bodyText1.override(
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
                        color: Color(0XFF477FFF),
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 2, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Trym’d Revenue',
                          style:
                             TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 50, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                rptrymd + '%',
                                style:TrymdPartnerTheme.of(context).bodyText1,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                child: Text(
                                  dtrymd,
                                  style:TrymdPartnerTheme.of(context)
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
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 16),
                    child: Container(
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Color(0xFF7459D9),
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
                          'Walk-In Revenue',
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
                                rpwalkin + '%',
                                style:TrymdPartnerTheme.of(context).bodyText1,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                child: Text(
                                  dwalk,
                                  style:TrymdPartnerTheme.of(context)
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
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.max,
            //     children: [
            //       Padding(
            //         padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 16),
            //         child: Container(
            //           width: 30,
            //           height: 5,
            //           decoration: BoxDecoration(
            //             color: Color(0xFF01AD88),
            //             borderRadius: BorderRadius.circular(90),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            //         child: Column(
            //           mainAxisSize: MainAxisSize.max,
            //           children: [
            //             Text(
            //               'Available Bookings',
            //               style:TrymdPartnerTheme.of(context)
            //                   .bodyText1
            //                   .override(
            //                     fontFamily: 'Harmonia Sans W01 bold',
            //                     fontWeight: FontWeight.bold,
            //                     useGoogleFonts: false,
            //                   ),
            //             ),
            //             Padding(
            //               padding:
            //                   EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
            //               child: Row(
            //                 mainAxisSize: MainAxisSize.max,
            //                 children: [
            //                   Text(
            //                     '%',
            //                     textAlign: TextAlign.start,
            //                     style:TrymdPartnerTheme.of(context)
            //                         .bodyText1
            //                         .override(
            //                           fontFamily:
            //                               'Harmonia Sans W01 bold',
            //                           fontWeight: FontWeight.bold,
            //                           useGoogleFonts: false,
            //                         ),
            //                   ),
            //                   Padding(
            //                     padding: EdgeInsetsDirectional.fromSTEB(
            //                         2, 0, 16, 0),
            //                     child: Text(
            //                       "10",
            //                       // davailable,
            //                       style:TrymdPartnerTheme.of(context)
            //                           .bodyText1
            //                           .override(
            //                             fontFamily:
            //                                 'Harmonia Sans W01 bold',
            //                             color: Color(0xFFDFE3ED),
            //                             fontWeight: FontWeight.bold,
            //                             useGoogleFonts: false,
            //                           ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsetsDirectional.fromSTEB(26, 0, 0, 16),
            //         child: Container(
            //           width: 30,
            //           height: 5,
            //           decoration: BoxDecoration(
            //             color: Color(0xFFF1F4F7),
            //             borderRadius: BorderRadius.circular(90),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            //         child: Column(
            //           mainAxisSize: MainAxisSize.max,
            //           children: [
            //             Text(
            //               'Cancel bookings',
            //               style:TrymdPartnerTheme.of(context)
            //                   .bodyText1
            //                   .override(
            //                     fontFamily: 'Harmonia Sans W01 bold',
            //                     fontWeight: FontWeight.bold,
            //                     useGoogleFonts: false,
            //                   ),
            //             ),
            //             Padding(
            //               padding:
            //                   EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
            //               child: Row(
            //                 mainAxisSize: MainAxisSize.max,
            //                 children: [
            //                   Text(
            //                     rptrymd + '%',
            //                     style:TrymdPartnerTheme.of(context)
            //                         .bodyText1
            //                         .override(
            //                           fontFamily:
            //                               'Harmonia Sans W01 bold',
            //                           fontWeight: FontWeight.bold,
            //                           useGoogleFonts: false,
            //                         ),
            //                   ),
            //                   Padding(
            //                     padding: EdgeInsetsDirectional.fromSTEB(
            //                         2, 0, 0, 0),
            //                     child: Text(
            //                       // dcancel,
            //                       "10",
            //                       style:TrymdPartnerTheme.of(context)
            //                           .bodyText1
            //                           .override(
            //                             fontFamily:
            //                                 'Harmonia Sans W01 bold',
            //                             color: Color(0xFFDFE3ED),
            //                             fontWeight: FontWeight.bold,
            //                             useGoogleFonts: false,
            //                           ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
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
                      servicedetails,
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            color: Color(0xFF477FFF),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                    child: Text(
                      'REVENUE',
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
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
                      "(" + serrevenue + ")",
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Vaccination',
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(210, 0, 0, 0),
                    child: Text(
                      vacno,
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
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
                  barRadius: Radius.circular(5)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Follow-Up',
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(224, 0, 0, 0),
                    child: Text(
                      follno,
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
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
              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Consultation',
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(210, 0, 0, 0),
                    child: Text(
                      consno,
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
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
              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Injection',
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(232, 0, 0, 0),
                    child: Text(
                      injeno,
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
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
                  percent: injeper,
                  width: 360,
                  lineHeight: 10,
                  animation: true,
                  progressColor: Color(0xFF477FFF),
                  backgroundColor: Color(0xFFF1F4F8),
                  barRadius: Radius.circular(5)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Vaccination',
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(210, 0, 0, 0),
                    child: Text(
                      vacno,
                      style:TrymdPartnerTheme.of(context).bodyText1.override(
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
                  percent: vacper,
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
