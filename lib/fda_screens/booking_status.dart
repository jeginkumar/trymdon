// import 'package:trymd_partner/fda_screens/fdahome.dart';

// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:trymd_partner/fda_screens/screens/fda_dashboard.dart';

class BookingStatusWidget extends StatefulWidget {
  const BookingStatusWidget({Key key}) : super(key: key);

  @override
  _BookingStatusWidgetState createState() => _BookingStatusWidgetState();
}

class _BookingStatusWidgetState extends State<BookingStatusWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: EdgeInsetsDirectional.fromSTEB(
            50,
            0,
            0,
            0,
          ),
          child: Text(
            'Booking status',
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
            padding: EdgeInsetsDirectional.fromSTEB(
              0,
              0,
              20,
              0,
            ),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    16,
                    16,
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
                          'Slot Details /',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          2,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          'Today',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    color: Color(0xFF477FFF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          136,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          'Bookings',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
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
                        child: Text(
                          '09:00 AM - 10:00 AM',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          178,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          '50%',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(
                    6,
                    10,
                    0,
                    10,
                  ),
                  child: LinearPercentIndicator(
                      percent: 0.5,
                      width: 366,
                      lineHeight: 18,
                      animation: true,
                      progressColor: Color(0xFFFF7B0D),
                      backgroundColor: Color(0xFF01AD88),
                      barRadius: Radius.circular(5)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    20,
                    0,
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
                          '10:00 AM - 11:00 AM',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          178,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          '30%',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(
                    6,
                    10,
                    0,
                    10,
                  ),
                  child: LinearPercentIndicator(
                      percent: 0.4,
                      width: 366,
                      lineHeight: 18,
                      animation: true,
                      progressColor: Color(0xFFFF7B0D),
                      backgroundColor: Color(0xFF01AD88),
                      barRadius: Radius.circular(5)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    20,
                    0,
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
                          '11:00 AM - 12:00 PM',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          178,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          '70%',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(
                    6,
                    10,
                    0,
                    10,
                  ),
                  child: LinearPercentIndicator(
                      percent: 0.7,
                      width: 366,
                      lineHeight: 18,
                      animation: true,
                      progressColor: Color(0xFFFF7B0D),
                      backgroundColor: Color(0xFF01AD88),
                      barRadius: Radius.circular(5)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    20,
                    0,
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
                          '12:00 PM - 01:00 PM',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 bold',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          178,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          '15%',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(
                    6,
                    10,
                    0,
                    10,
                  ),
                  child: LinearPercentIndicator(
                      percent: 0.2,
                      width: 366,
                      lineHeight: 18,
                      animation: true,
                      progressColor: Color(0xFFFF7B0D),
                      backgroundColor: Color(0xFF01AD88),
                      barRadius: Radius.circular(5)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
