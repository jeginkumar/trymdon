// import 'package:trymd_partner/fda_screens/fdahome.dart';
// import 'package:table_calendar/table_calendar.dart';

// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:trymd_partner/fda_screens/screens/fda_dashboard.dart';

class AttendanceWidget extends StatefulWidget {
  const AttendanceWidget({Key key}) : super(key: key);

  @override
  _AttendanceWidgetState createState() => _AttendanceWidgetState();
}

class _AttendanceWidgetState extends State<AttendanceWidget> {
  // DateTimeRange calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime _currentDate = DateTime(2019, 2, 3);

  @override
  void initState() {
    super.initState();
    // calendarSelectedDay = DateTimeRange(
    //   start: DateTime.now().startOfDay,
    //   end: DateTime.now().endOfDay,
    // );
  }

  @override
  Widget build(BuildContext context) {
    // var controller;
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
                builder: (context) => FDADashboardWidget(),
              ),
            );
          },
          child: Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          'Attendance',
          style: TrymdPartnerTheme.of(context).bodyText1.override(
                fontFamily: 'Harmonia Sans W01 bold',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                useGoogleFonts: false,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              0,
              15,
              20,
              0,
            ),
            child: FaIcon(
              FontAwesomeIcons.calendarMinus,
              color: Colors.black,
              size: 24,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // FlutterFlowCalendar(
                //       color: TrymdPartnerTheme.of(context).primaryColor,
                //       weekFormat: false,
                //       weekStartsMonday: false,
                //       onChange: (DateTimeRange newSelectedDate) {
                //         setState(() => calendarSelectedDay = newSelectedDate);
                //       },
                //       titleStyle: TextStyle(),
                //       dayOfWeekStyle: TextStyle(),
                //       dateStyle: TextStyle(),
                //       selectedDateStyle: TextStyle(),
                //       inactiveDateStyle: TextStyle(),
                //     ),

                CalendarCarousel(
                  onDayPressed: (DateTime date, List events) {
                    this.setState(() => _currentDate = date);
                  },
                  weekendTextStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  thisMonthDayBorderColor: Colors.grey,
                  customDayBuilder: (
                    /// you can provide your own build function to make custom day containers
                    bool isSelectable,
                    int index,
                    bool isSelectedDay,
                    bool isToday,
                    bool isPrevMonthDay,
                    TextStyle textStyle,
                    bool isNextMonthDay,
                    bool isThisMonthDay,
                    DateTime day,
                  ) {
                    /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                    /// This way you can build custom containers for specific days only, leaving rest as default.

                    // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                    if (day.day == 15) {
                      return Center(
                        child: Icon(Icons.local_airport),
                      );
                    } else {
                      return null;
                    }
                  },
                  weekFormat: false,
                  // markedDatesMap: _markedDateMap,
                  height: 420.0,
                  // selectedDateTime: _currentDate,
                  daysHaveCircularBorder: false,

                  /// null for not rendering any border, true for circular border, false for rectangular border
                ),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    10,
                    20,
                    10,
                    0,
                  ),
                  // child:
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      20,
                      30,
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
                          child: Container(
                            width: 155,
                            height: 85,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF0DD439), Color(0xFF02AE89)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                              borderRadius: BorderRadius.circular(11),
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
                                  child: CircularPercentIndicator(
                                    percent: 0.5,
                                    radius: 30,
                                    lineWidth: 12,
                                    animation: true,
                                    progressColor: Colors.white,
                                    backgroundColor: Color(0xFF0DD439),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        20,
                                        15,
                                        0,
                                      ),
                                      child: Text(
                                        'Present',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 bold',
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        5,
                                        10,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        '18/26 days',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 bold',
                                              fontSize: 13,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            30,
                            0,
                            0,
                            0,
                          ),
                          child: Container(
                            width: 155,
                            height: 85,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFFFC8C8), Color(0xFFFF1834)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0.07, -1),
                                end: AlignmentDirectional(-0.07, 1),
                              ),
                              borderRadius: BorderRadius.circular(11),
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
                                  child: CircularPercentIndicator(
                                    percent: 0.2,
                                    radius: 30,
                                    lineWidth: 12,
                                    animation: true,
                                    progressColor: Colors.white,
                                    backgroundColor: Color(0xFFFFC8C8),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        20,
                                        15,
                                        0,
                                      ),
                                      child: Text(
                                        'Absent',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 bold',
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        5,
                                        10,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        '3/26 days',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'Harmonia Sans W01 bold',
                                              fontSize: 13,
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
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
