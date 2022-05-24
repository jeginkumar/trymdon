import 'package:intl/intl.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:trymd_partner/fda_screens/repository/repository.dart';
// import 'package:trymd_partner/repository.dart';

import '../components/invoice_widget.dart';
// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class BookingslotWidget extends StatefulWidget {
  final serviceName;
  final userData;
  BookingslotWidget({this.serviceName, this.userData});

  @override
  _BookingslotWidgetState createState() => _BookingslotWidgetState();
}

class _BookingslotWidgetState extends State<BookingslotWidget> {
  dynamic delay = "";

  var reschedule;
  String startTime1 = "";
  String endTime1 = "";

  String delayStart = "";
  String delayEnd = "";

  var slots;

  @override
  void initState() {
    super.initState();
    print(widget.serviceName);
    bookingslot();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm').format(now);
    var d = formattedDate.split(':');
    int starT = int.parse(d[0]);
    int endT = starT + 1;

    final startTime = TimeOfDay(hour: starT, minute: 0);
    final endTime = TimeOfDay(hour: endT, minute: 0);
    final interval = Duration(minutes: 20);

    final times = getTimeSlots(startTime, endTime, interval).toList();
    List data1 = [];
    times.forEach((element) {
      String d1 = element.toString();
      String std = d1.replaceAll("TimeOfDay(", "");
      std = std.replaceAll(")", "");
      formattedDate = DateFormat.jm().format(DateFormat("hh:mm").parse(std));
      data1.add(formattedDate);
    });
    startTime1 = data1[0];
    endTime1 = data1[1];

    final startTi = TimeOfDay(hour: starT, minute: 10);
    final endTi = TimeOfDay(hour: endT, minute: 10);
    final inter = Duration(minutes: 20);

    final times1 = getTimeSlots(startTi, endTi, inter).toList();
    List data2 = [];
    times1.forEach((element) {
      String d1 = element.toString();
      String std = d1.replaceAll("TimeOfDay(", "");
      std = std.replaceAll(")", "");
      formattedDate = DateFormat.jm().format(DateFormat("hh:mm").parse(std));
      data2.add(formattedDate);
    });

    delayStart = data2[0];
    delayEnd = data2[1];
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Dialog(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Container(
            width: 320,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                  child: Container(
                    width: 290,
                    height: 131,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F7),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFF1F4F7),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'Available Booking Slot',
                            style: TrymdPartnerTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Container(
                            width: 276,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: Text(
                                startTime1 + " - " + endTime1,
                                textAlign: TextAlign.center,
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'geometric sans-serif',
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
                  padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Delayed by',
                        style: TrymdPartnerTheme.of(context).bodyText1.override(
                              fontFamily: 'Harmonia Sans W01 Bold',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          "10 Mins",
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 Bold',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Rescheduled Time :',
                        style: TrymdPartnerTheme.of(context).bodyText1.override(
                              fontFamily: 'Harmonia Sans W01 Bold',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          delayStart + " - " + delayEnd,
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 Bold',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                textAlign: TextAlign.center,
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 Bold',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await showDialog(
                              // isScrollControlled: true,
                              // backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Container(
                                    height: 400,
                                    child: InvoiceWidget(
                                        serviceName: widget.serviceName,
                                        startT: startTime1,
                                        endTime: endTime1,
                                        delaySt: delayStart,
                                        delayEnd: delayEnd,
                                        userData: widget.userData),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF477FFF), Color(0xFF07D0F2)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0.94, -1),
                                end: AlignmentDirectional(-0.94, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: Text(
                                'Book Slot',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bookingslot() async {
    var response = Availablebooking();
    Map<String, dynamic> value = await response.availablebooking();
    slots = value["available"]["slots"];
    delay = value["available"]["delay"];
    reschedule = value["available"]["reschedule"];
    setState(() {});
  }
}
