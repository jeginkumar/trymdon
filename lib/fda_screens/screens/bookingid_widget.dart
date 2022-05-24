// import 'package:trymd_partner/flutter_barcode_scanner.dart';

import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:trymd_partner/fda_screens/repository/repository.dart';
// import 'package:trymd_partner/repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:google_fonts/google_fonts.dart';

class BookingIDWidget extends StatefulWidget {
  const BookingIDWidget({Key key}) : super(key: key);

  @override
  _BookingIDWidgetState createState() => _BookingIDWidgetState();
}

class _BookingIDWidgetState extends State<BookingIDWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var scan = '';
  dynamic id = "";
  dynamic name = "";
  dynamic address = "";
  dynamic mobile = "";
  dynamic slot = "";
  dynamic bstatus = "";
  dynamic pstatus = "";
  dynamic status = "";
  dynamic date = "";
  @override
  void initState() {
    super.initState();
    idbooking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          40,
        ),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              110,
              40,
              0,
              0,
            ),
            child: Text(
              "BOOKING ID" + "[" + id + "]",
              style: TrymdPartnerTheme.of(context).bodyText1.override(
                    fontFamily: 'Harmonia Sans W01 Bold',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          actions: [],
          elevation: 0,
        ),
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
                    0,
                    20,
                    0,
                    0,
                  ),
                  child: Container(
                    width: 356,
                    height: 399,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F7),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
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
                                name,
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 Bold',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                        ),
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
                                address,
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 Bold',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                        ),
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
                                'Status  :',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 Bold',
                                      color: Color(0x4D0B2F45),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  10,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  status,
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Harmonia Sans W01 Bold',
                                        color: Color(0xFF4D93FD),
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
                            20,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                mobile,
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 Bold',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            20,
                            15,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                pstatus,
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 Bold',
                                      color: Color(0x4D0B2F45),
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  8,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Container(
                                  width: 47,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF53B175),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      2,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      pstatus,
                                      textAlign: TextAlign.center,
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 Bold',
                                            color: Colors.white,
                                            fontSize: 12,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            20,
                            15,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Booking Date  :',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 Bold',
                                      color: Color(0x4D0B2F45),
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  5,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  date,
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                            20,
                            15,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Booking Slot    :',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 Bold',
                                      color: Color(0x4D0B2F45),
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  5,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  slot,
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                            20,
                            15,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Booking Status  ',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Harmonia Sans W01 Bold',
                                      color: Color(0x4D0B2F45),
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  8,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Container(
                                  width: 72,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF79E1B),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      3,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      bstatus,
                                      textAlign: TextAlign.center,
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                'Harmonia Sans W01 Bold',
                                            color: Colors.white,
                                            fontSize: 12,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            5,
                            25,
                            0,
                            0,
                          ),
                          child: InkWell(
                            onTap: () async {
                              scan = await FlutterBarcodeScanner.scanBarcode(
                                '#36B164', // scanning line color
                                'Cancel', // cancel button text
                                true, // whether to show the flash icon
                                ScanMode.QR,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 294,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF3F8BFD),
                                    Color(0xFF07D0F2)
                                  ],
                                  stops: [0, 1],
                                  begin: AlignmentDirectional(0.94, -1),
                                  end: AlignmentDirectional(-0.94, 1),
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  15,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'Scan Now',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            10,
                            0,
                            0,
                          ),
                          child: Text(
                            scan,
                            style: TrymdPartnerTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  idbooking() async {
    var response = Bookingid();
    Map<String, dynamic> value = await response.booking();
    id = value["bookingid"]["id"];
    name = value["bookingid"]["name"];
    address = value["bookingid"]["address"];
    mobile = value["bookingid"]["mobile"];
    date = value["bookingid"]["date"];
    slot = value["bookingid"]["slot"];
    bstatus = value["bookingid"]["bstatus"];
    pstatus = value["bookingid"]["pstatus"];
    status = value["bookingid"]["status"];
    if(mounted)
    setState(() {});
  }
}
