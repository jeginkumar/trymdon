import 'package:localstorage/localstorage.dart';
// import 'package:trymd_partner/fda_screens/fdahome.dart';
// import 'package:trymd_partner/screens/makepayment_widget.dart';

// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
import 'package:trymd_partner/fda_screens/screens/fda_dashboard.dart';
// import 'package:google_fonts/google_fonts.dart';

class BookingSuccessWidget extends StatefulWidget {
  final userData;
  final start;
  final end;
  final delayS;
  final delayE;
  const BookingSuccessWidget(
      {this.userData, this.start, this.end, this.delayS, this.delayE});

  @override
  _BookingSuccessWidgetState createState() => _BookingSuccessWidgetState();
}

class _BookingSuccessWidgetState extends State<BookingSuccessWidget> {
  final LocalStorage storage = new LocalStorage('localstorage_app');
  String bookingId = "";

  @override
  void initState() {
    super.initState();

    bookingId = storage.getItem("booking_id");
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 320,
      height: 550,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Padding(
            padding: EdgeInsetsDirectional.fromSTEB(280, 10, 0, 0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                color: Color(0xFFCCD2E3),
                size: 24,
              ),
            )),
        Image.asset(
          'assets/images/Group_6872.png',
          width: 150,
          height: 145,
          fit: BoxFit.none,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 5, 0, 0),
          child: Text(
            'Booking Successful',
            style: TrymdPartnerTheme.of(context).bodyText1.override(
                  fontFamily: 'Harmonia Sans W01 Bold',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Container(
            width: 290,
            height: 149,
            decoration: BoxDecoration(
              color: Color(0xFFF1F4F7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    widget.userData['customer_name'],
                    style: TrymdPartnerTheme.of(context).bodyText1.override(
                          fontFamily: 'Harmonia Sans W01 Bold',
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    'Booking ID : ' + bookingId,
                    style: TrymdPartnerTheme.of(context).bodyText1.override(
                          fontFamily: 'Harmonia Sans W01 Bold',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: 276,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFF1F4F7),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Text(
                        widget.start + " " + widget.end,
                        textAlign: TextAlign.center,
                        style: TrymdPartnerTheme.of(context).bodyText1.override(
                              fontFamily: 'Harmonia Sans W01 Bold',
                              color: Color(0xFF477FFF),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(100, 10, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Delay in ',
                style: TrymdPartnerTheme.of(context).bodyText1.override(
                      fontFamily: 'Harmonia Sans W01 Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              ),
              Text(
                ' 10 mins ',
                style: TrymdPartnerTheme.of(context).bodyText1.override(
                      fontFamily: 'Harmonia Sans W01 Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Rescheduled Time :',
                style: TrymdPartnerTheme.of(context).bodyText1.override(
                      fontFamily: 'Harmonia Sans W01 Regular',
                      color: Colors.black,
                      useGoogleFonts: false,
                    ),
              ),
              Text(
                widget.delayS + " " + widget.delayE,
                style: TrymdPartnerTheme.of(context).bodyText1.override(
                      fontFamily: 'Harmonia Sans W01 Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
          child: InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FDADashboardWidget(),
                ),
              );
            },
            child: Container(
              width: 280,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF477FFF), Color(0xFF07D0F2)],
                  stops: [0, 1],
                  begin: AlignmentDirectional(1, -0.98),
                  end: AlignmentDirectional(-1, 0.98),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Text(
                  'GOTO BOOKING',
                  textAlign: TextAlign.center,
                  style: TrymdPartnerTheme.of(context).bodyText1.override(
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
        )
      ]),
    ));
  }
}
