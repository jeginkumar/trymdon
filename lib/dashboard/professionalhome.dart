// import 'dart:html';

// import 'package:fdacompleted/local.dart';
// import 'package:fdacompleted/repository/repository.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:trymd_partner/dashboard/dashboard.dart';
// import 'package:trymd_partner/fda_screens/attendance_widget.dart';
import 'package:trymd_partner/fda_screens/booking_widget.dart';
import 'package:trymd_partner/fda_screens/booking_status.dart';
// import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_choice_chips.dart';
// import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_icon_button.dart';
import 'package:trymd_partner/fda_screens/repository/local_repository.dart';
import 'package:trymd_partner/fda_screens/revenue_widget.dart';
// import 'package:trymd_partner/fda_screens/screens/booking_screen_widget.dart';
// import 'package:trymd_partner/fda_screens/screens/bookingid_widget.dart';
import 'package:trymd_partner/sizer.dart';

import '../global_widget/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
// import 'package:fl_chart/fl_chart.dart';

class ProfessionalDashBoardPage extends StatefulWidget {
  ProfessionalDashBoardPage({Key key}) : super(key: key);

  @override
  _ProfessionalDashBoardPageState createState() =>
      _ProfessionalDashBoardPageState();
}

class _ProfessionalDashBoardPageState extends State<ProfessionalDashBoardPage> {
  final LocalStorage storage = new LocalStorage('localstorage_app');
  String choiceChipsValue;
  double pvalue = 0.8;
  dynamic curdate = "";
  dynamic curtime = "";
  List<dynamic> stackchart = [
    SalesData(
      'Jan',
      25,
      20,
    ),
    SalesData(
      'Feb',
      28,
      30,
    ),
    SalesData('Mar', 34, 25),
  ];
  Map<String, double> todaychart = {};
  List<Color> colorList = [];
  List<List<Color>> gradientList = [];
  Map<String, double> dataMap1 = {};
  List<Color> colorList1 = [];
  List<List<Color>> gradientList1 = [];
  List<dynamic> upcome = [];
  dynamic trymdbook = 0.0;
  dynamic walkin = 0.0;
  dynamic available = 0.0;
  dynamic cancelation = 0.0;
  dynamic trymdrevenue = 0.0;
  dynamic walkinrevenue = 0.0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    homeDashboard();
    upcomingAppoint();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: scaffoldKey,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      15,
                      0,
                      0,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Container(
                        width: 360,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            10,
                            10,
                            0,
                            0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booking Status',
                                style: TrymdPartnerTheme.of(context).bodyText1,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  5,
                                  0,
                                  0,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookingStatusWidget(),
                                      ),
                                    );
                                  },
                                  child: LinearPercentIndicator(
                                    percent: pvalue,
                                    width: 340,
                                    lineHeight: 25,
                                    animation: true,
                                    progressColor: percentindicate(),
                                    // TrymdPartnerTheme.of(context)
                                    // .primaryColor,
                                    backgroundColor: Color(0xFFF1F4F8),
                                    barRadius: Radius.circular(26),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      10,
                                      15,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width: 20,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF1834),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      5,
                                      15,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Booked (60%)',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            color: Color(0xFF0B2F45),
                                            fontSize: 10,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      15,
                                      15,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width: 20,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFE418A),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      5,
                                      15,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Available (40%)',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            color: Color(0xFF0B2F45),
                                            fontSize: 10,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      15,
                                      15,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width: 20,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFDFDFDF),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      5,
                                      15,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Cancel (10%)',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            color: Color(0xFF0B2F45),
                                            fontSize: 10,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          15,
                          0,
                          0,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Container(
                            width: 170,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    5,
                                    0,
                                    0,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BookingWidget(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Today  Booking',
                                          style: TrymdPartnerTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    'Harmonia Sans W01 bold',
                                                color: Color(0xFF0B2F45),
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BookingWidget(),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      5,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width: 135,
                                      child: PieChart(
                                        chartLegendSpacing: 5,
                                        dataMap: (todaychart == null)
                                            ? 0
                                            : todaychart,
                                        colorList: colorList,
                                        chartRadius:
                                            MediaQuery.of(context).size.width /
                                                0,
                                        centerText: "70 bookings",
                                        chartType: ChartType.ring,
                                        ringStrokeWidth: 20,
                                        animationDuration:
                                            const Duration(seconds: 2),
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                                showChartValues: false,
                                                showChartValuesOutside: true,
                                                showChartValuesInPercentage:
                                                    true,
                                                showChartValueBackground:
                                                    false),
                                        legendOptions: const LegendOptions(
                                            showLegends: false,
                                            legendShape: BoxShape.circle,
                                            legendTextStyle:
                                                TextStyle(fontSize: 15),
                                            // legendPosition: LegendPosition.bottom,
                                            showLegendsInRow: true),
                                        gradientList: gradientList,
                                      ),
                                    )

                                    //                                SfCartesianChart(
                                    //                                  primaryXAxis: CategoryAxis(),
                                    // title:
                                    //     ChartTitle(text: ''),
                                    // // legend:
                                    //     // Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                                    // // tooltipBehavior: _tooltipBehavior,
                                    // series: [
                                    //   StackedColumn100Series<dynamic, String>(
                                    //     dataSource: stackchart,
                                    //     // innerRadius:"20%",
                                    //     //  cornerStyle: CornerStyle.bothCurve,
                                    //     xValueMapper: ( stackchart, _) => stackchart.x,
                                    //     yValueMapper: ( stackchart, _) => stackchart.y,
                                    //     width:0.8,
                                    //     spacing:0.2,
                                    //     dataLabelSettings: DataLabelSettings(isVisible: true),
                                    //     enableTooltip: true,
                                    //   ),
                                    //    StackedColumn100Series<dynamic, String>(
                                    //     dataSource: stackchart,
                                    //     // innerRadius:"20%",
                                    //     //  cornerStyle: CornerStyle.bothCurve,
                                    //     xValueMapper: ( stackchart, _) => stackchart.x,
                                    //     yValueMapper: ( stackchart, _) => stackchart.y1,
                                    //     width:0.8,
                                    //     spacing:0.2,
                                    //     dataLabelSettings: DataLabelSettings(isVisible: true),
                                    //     enableTooltip: true,
                                    //   )
                                    // ]
                                    //                                )
                                    // CircularPercentIndicator(
                                    //   percent: 0.5,
                                    //   radius: 60,
                                    //   lineWidth: 24,
                                    //   animation: true,
                                    //   progressColor:
                                    //       TrymdPartnerTheme.of(context)
                                    //           .primaryColor,
                                    //   backgroundColor: Color(0xFFF1F4F8),
                                    //   center: Text(
                                    //     '50\nbookings',
                                    //     textAlign: TextAlign.center,
                                    //     style: TrymdPartnerTheme.of(context)
                                    //         .bodyText1
                                    //         .override(
                                    //           fontFamily:
                                    //               'Harmonia Sans W01 bold',
                                    //           color: Color(0xFF0B2F45),
                                    //           fontWeight: FontWeight.bold,
                                    //           useGoogleFonts: false,
                                    //         ),
                                    //   ),
                                    // ),
                                    ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    10,
                                    0,
                                    0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Container(
                                          width: 20,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF7B0D),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Trym’d \n60% (42)',
                                          style: TrymdPartnerTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    'Harmonia Sans W01 bold',
                                                color: Color(0xFF0B2F45),
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Container(
                                          width: 20,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFE418A),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Walk-In \n40% (28)',
                                          style: TrymdPartnerTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    'Harmonia Sans W01 bold',
                                                color: Color(0xFF0B2F45),
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Container(
                                        width: 20,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFE418A),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Available \n10% (10)',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 bold',
                                              color: Color(0xFF0B2F45),
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Container(
                                        width: 20,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFCCD2E3),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Cancellation \n10% (10)',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 bold',
                                              color: Color(0xFF0B2F45),
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          15,
                          5,
                          0,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Container(
                            width: 170,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    5,
                                    0,
                                    0,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RevenueWidget(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Today  Revenue',
                                          style: TrymdPartnerTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    'Harmonia Sans W01 bold',
                                                color: Color(0xFF0B2F45),
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RevenueWidget(),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      5,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width: 135,
                                      child: PieChart(
                                        chartLegendSpacing: 5,
                                        dataMap: dataMap1,
                                        colorList: colorList1,
                                        chartRadius:
                                            MediaQuery.of(context).size.width /
                                                0,
                                        centerText: "100,000 \nRevenue",
                                        chartType: ChartType.ring,
                                        ringStrokeWidth: 20,
                                        animationDuration:
                                            const Duration(seconds: 2),
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                                showChartValues: false,
                                                showChartValuesOutside: true,
                                                showChartValuesInPercentage:
                                                    true,
                                                showChartValueBackground:
                                                    false),
                                        legendOptions: const LegendOptions(
                                            showLegends: false,
                                            legendShape: BoxShape.rectangle,
                                            legendTextStyle:
                                                TextStyle(fontSize: 15),
                                            // legendPosition: LegendPosition.bottom,
                                            showLegendsInRow: true),
                                        gradientList: gradientList1,
                                      ),
                                    )
                                    // CircularPercentIndicator(
                                    //   percent: 0.5,
                                    //   radius: 60,
                                    //   lineWidth: 24,
                                    //   animation: true,
                                    //   progressColor:
                                    //       TrymdPartnerTheme.of(context)
                                    //           .primaryColor,
                                    //   backgroundColor: Color(0xFFF1F4F8),
                                    //   center: Text(
                                    //     '100,000\nRevenue',
                                    //     textAlign: TextAlign.center,
                                    //     style: TrymdPartnerTheme.of(context)
                                    //         .bodyText1
                                    //         .override(
                                    //           fontFamily:
                                    //               'Harmonia Sans W01 bold',
                                    //           color: Color(0xFF0B2F45),
                                    //           fontWeight: FontWeight.bold,
                                    //           useGoogleFonts: false,
                                    //         ),
                                    //   ),
                                    // ),
                                    ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        3,
                                        0,
                                        0,
                                      ),
                                      child: Container(
                                        width: 20,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF477FFF),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        5,
                                        15,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'trym’d Revenue\n40% (28)',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 bold',
                                              color: Color(0xFF0B2F45),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        3,
                                        0,
                                        0,
                                      ),
                                      child: Container(
                                        width: 20,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF7459D9),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        5,
                                        15,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'Walk-In Revenue\n40% (28)',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 bold',
                                              color: Color(0xFF0B2F45),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      15,
                      175,
                      0,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Slot Bookings/',
                        style: TrymdPartnerTheme.of(context).bodyText1.override(
                              fontFamily: 'Harmonia Sans W01 bold',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                        children: [
                          TextSpan(
                            text: 'Today',
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Harmonia Sans W01 bold',
                                  color: Color(0xFF477FFF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          )
                        ],
                      ),
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
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(36, 20, 0, 0),
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
                                            color: Color(0xFFFF7B0D),
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
                                            color: Color(0xFFFF7B0D),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7B0D),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7B0D),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7B0D),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7B0D),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7B0D),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 21,
                                          height: 29,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF7B0D),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7B0D),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFE418A),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7B0D),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 21,
                                          height: 29,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFE418A),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFE418A),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7B0D),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFE418A),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 21,
                                          height: 29,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFE418A),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7B0D),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7B0D),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Container(
                                            width: 21,
                                            height: 29,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7B0D),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                            Divider(
                              height: 20,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                              color: Color(0xFFF1F4F7),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      3,
                                      0,
                                      0,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          17, 0, 0, 0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: Color(0xFFFF7B0D),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      5,
                                      5,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'trym’d booking',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      52,
                                      3,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Color(0xFFFE418A),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      5,
                                      5,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Walk-in booking',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.5,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                  // InkWell(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => BookingScreenWidget(),
                  //         ),
                  //       );
                  //     },
                  //     child: Padding(
                  //       padding: EdgeInsetsDirectional.fromSTEB(
                  //         0,
                  //         15,
                  //         0,
                  //         0,
                  //       ),
                  //       child: Container(
                  //         width: 360,
                  //         height: 60,
                  //         decoration: BoxDecoration(
                  //           color: Color(0xFFE6EEFE),
                  //           borderRadius: BorderRadius.circular(16),
                  //           border: Border.all(
                  //             color: Color(0xFF477FFF),
                  //             width: 2,
                  //           ),
                  //         ),
                  //         child: Row(
                  //           mainAxisSize: MainAxisSize.max,
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Icon(
                  //               Icons.post_add_rounded,
                  //               color: Color(0xFF477FFF),
                  //               size: 24,
                  //             ),
                  //             Text(
                  //               'GENERATE BOOKINGS',
                  //               style: TrymdPartnerTheme.of(context)
                  //                   .bodyText1
                  //                   .override(
                  //                     fontFamily: 'Harmonia Sans W01 bold',
                  //                     color: Color(0xFF477FFF),
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.bold,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      15,
                      175,
                      0,
                    ),
                    child: Text(
                      'Current Appointment',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      15,
                      0,
                      0,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Container(
                        width: 360,
                        height: 125,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                15,
                                0,
                                0,
                                0,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gowtham',
                                    style:
                                        TrymdPartnerTheme.of(context).bodyText1,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      5,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Text(
                                        'Consultation',
                                        textAlign: TextAlign.start,
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 bold',
                                              color: Color(0xFF0B2F45),
                                              fontSize: 12,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      5,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      '12:10 AM - 12:20 PM',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            color: Color(0xFF0B2F45),
                                            fontSize: 18,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      5,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Delayed by 5 mins',
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 bold',
                                            color: Color(0xFFFF7B0D),
                                            fontSize: 12,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    60,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/Rectangle_1465.png',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          5,
                                          2,
                                          0,
                                          0,
                                        ),
                                        child: Image.asset(
                                          'assets/images/Rectangle_1466.png',
                                          width: 80,
                                          height: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          10,
                                          25,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Add\nAppointment\nHistory',
                                          textAlign: TextAlign.center,
                                          style: TrymdPartnerTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    'Harmonia Sans W01 bold',
                                                color: Colors.white,
                                                fontSize: 12,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      15,
                      175,
                      0,
                    ),
                    child: Text(
                      'Upcoming Appointment',
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'Harmonia Sans W01 bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: upcome.length,
                        itemBuilder: (BuildContext context, int index) {
                          return upcomeappoint(
                            context,
                            upcome[index],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget upcomeappoint(context, data) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        0,
        15,
        0,
        0,
      ),
      child: Material(
        color: Colors.transparent,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Container(
          width: 360,
          height: 125,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  15,
                  10,
                  0,
                  0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["name"],
                      style: TrymdPartnerTheme.of(context).bodyText1,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        5,
                        0,
                        0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F4F7),
                        ),
                        child: Text(
                          data["service"],
                          textAlign: TextAlign.start,
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    color: Color(0xFF0B2F45),
                                    fontSize: 12,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        5,
                        0,
                        0,
                      ),
                      child: Text(
                        data["appoint_time"],
                        style: TrymdPartnerTheme.of(context).bodyText1.override(
                              fontFamily: 'Harmonia Sans W01 bold',
                              color: Color(0xFF0B2F45),
                              fontSize: 18,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        5,
                        0,
                        0,
                      ),
                      child: Text(
                        data["note"],
                        style: TrymdPartnerTheme.of(context).bodyText1.override(
                              fontFamily: 'Harmonia Sans W01 bold',
                              color: Color(0xFFFF7B0D),
                              fontSize: 12,
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
    );
  }

  percentindicate() {
    if (pvalue == 0.5) {
      return Colors.amber;
    }
    if (pvalue == 0.8) {
      return Colors.green;
    } else {
      return Colors.black;
    }
  }

  homeDashboard() {
    // curdate = Homedash().date;
    // curtime = Homedash().time;
    print(curdate);
    print(curtime);
  }

  upcomingAppoint() async {
    var response = await Dashboard().home();
    upcome = response["data"]["upcoming_appointment"];
    // upcome = response["data"]["current_appointment"]["name"];
    curdate = response["data"]["daily_attendence"]["date"];
    curtime = response["data"]["daily_attendence"]["time"];
    trymdbook = response["data"]["today_booking"]["trym'd_book"];
    walkin = response["data"]["today_booking"]["Walkin"];
    available = response["data"]["today_booking"]["Available"];
    cancelation = response["data"]["today_booking"]["cancelation"];
    trymdrevenue = response["data"]["today_revenue"]["trym'd_revenue"];
    walkinrevenue = response["data"]["today_revenue"]["Walkin_revnue"];
    if (mounted) setState(() {});

    todaychart = {
      "Trym’d": trymdbook,
      "Walk-In ": walkin,
      "Available ": available,
      "Cancellation ": cancelation,
    };
    colorList = [
      const Color(0xffD95AF3),
      const Color(0xff3EE094),
      const Color(0xff3398F6),
      const Color(0xffFA4A42),
      const Color(0xffFE9539)
    ];

    gradientList = <List<Color>>[
      [
        Color.fromRGBO(255, 123, 13, 1),
        Color.fromRGBO(255, 115, 132, 1),
      ],
      [
        Color.fromRGBO(254, 65, 138, 1),
        Color.fromRGBO(255, 212, 243, 1),
      ],
      [
        Color.fromRGBO(1, 173, 136, 1),
        Color.fromRGBO(13, 212, 57, 1),
      ],
      [
        Color.fromRGBO(241, 244, 247, 1),
        Color.fromRGBO(241, 244, 247, 1),
      ],
    ];

    dataMap1 = {
      "trym’d Revenue": trymdrevenue,
      "Walk-In Revenue ": walkinrevenue,
    };

    colorList1 = [
      const Color(0xffD95AF3),
      const Color(0xff3EE094),
      const Color(0xff3398F6),
      const Color(0xffFA4A42),
      const Color(0xffFE9539)
    ];

    gradientList1 = <List<Color>>[
      [
        Color.fromRGBO(71, 127, 255, 1),
        Color.fromRGBO(7, 208, 242, 1),
      ],
      [
        Color.fromRGBO(116, 89, 217, 1),
        Color.fromRGBO(185, 171, 235, 1),
      ],
    ];
  }
}

class SalesData {
  SalesData(this.x, this.y, this.y1);

  final String x;
  final double y;
  final double y1;
}
