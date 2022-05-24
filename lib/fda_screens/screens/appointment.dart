import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:trymd_partner/dashboard/dashboard.dart';
import 'package:trymd_partner/global_widget/trymd_partner_theme.dart';
import 'package:trymd_partner/sizer.dart';

class AppointmentWidget extends StatefulWidget {
  const AppointmentWidget({Key key}) : super(key: key);

  @override
  _AppointmentWidgetState createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
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
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
            size: SizeConfig.blockSizeVertical * 3,
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 6, 0, 0, 0),
              child: Container(
                width: SizeConfig.blockSizeHorizontal * 10,
                height: SizeConfig.blockSizeVertical * 4,
                decoration: BoxDecoration(
                  color: Color(0xFF2C9B47),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0, SizeConfig.blockSizeVertical * 0.8, 0, 0),
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
                  SizeConfig.blockSizeHorizontal * 2, 0, 0, 0),
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
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0, 0, SizeConfig.blockSizeHorizontal * 4, 0),
            child: Icon(
              Icons.more_vert,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0, SizeConfig.blockSizeVertical * 1, 0, 0),
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
                      0, SizeConfig.blockSizeVertical * 2, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 5, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Karthiga Rajendran',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, SizeConfig.blockSizeVertical * 1, 0, 0),
                              child: Text(
                                'Jan 17, 2022 at 09:30 AM',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.5,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 28, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '09:30 AM - 09:45 AM',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.3,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 9,
                                  SizeConfig.blockSizeVertical * 1,
                                  0,
                                  0),
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 17,
                                height: SizeConfig.blockSizeVertical * 2.3,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF79E1B),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0,
                                      SizeConfig.blockSizeVertical * 0.3, 0, 0),
                                  child: Text(
                                    'Upcoming',
                                    textAlign: TextAlign.center,
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.3,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            )
                          ],
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
                  color: Color(0xFFF1F4F7),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0, SizeConfig.blockSizeVertical * 2, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 5, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Karthiga Rajendran',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, SizeConfig.blockSizeVertical * 1, 0, 0),
                              child: Text(
                                'Jan 17, 2022 at 09:30 AM',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.5,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 28, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '09:30 AM - 09:45 AM',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.3,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 9,
                                  SizeConfig.blockSizeVertical * 1,
                                  0,
                                  0),
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 17,
                                height: SizeConfig.blockSizeVertical * 2.3,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF79E1B),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0,
                                      SizeConfig.blockSizeVertical * 0.3, 0, 0),
                                  child: Text(
                                    'Upcoming',
                                    textAlign: TextAlign.center,
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.3,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            )
                          ],
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
                  color: Color(0xFFF1F4F7),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0, SizeConfig.blockSizeVertical * 1, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 5, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Karthiga Rajendran',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, SizeConfig.blockSizeVertical * 1, 0, 0),
                              child: Text(
                                'Jan 17, 2022 at 09:30 AM',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.5,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 23.5, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '09:30 AM - 09:45 AM',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.3,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 1,
                                  SizeConfig.blockSizeHorizontal * 5,
                                  0),
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 30.5,
                                height: SizeConfig.blockSizeVertical * 2.3,
                                decoration: BoxDecoration(
                                  color: Color(0xFF9132FD),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0,
                                      SizeConfig.blockSizeVertical * 0.3, 0, 0),
                                  child: Text(
                                    'appointment history',
                                    textAlign: TextAlign.center,
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Harmonia Bold',
                                          color: Colors.white,
                                          fontSize: 11,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            )
                          ],
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
                  color: Color(0xFFF1F4F7),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0, SizeConfig.blockSizeVertical * 1, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 5, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Karthiga Rajendran',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, SizeConfig.blockSizeVertical * 1, 0, 0),
                              child: Text(
                                'Jan 17, 2022 at 09:30 AM',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.5,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 23.5, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '09:30 AM - 09:45 AM',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.3,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 1,
                                  SizeConfig.blockSizeHorizontal * 5,
                                  0),
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 30.5,
                                height: SizeConfig.blockSizeVertical * 2.3,
                                decoration: BoxDecoration(
                                  color: Color(0xFF9132FD),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0,
                                      SizeConfig.blockSizeVertical * 0.3, 0, 0),
                                  child: Text(
                                    'appointment history',
                                    textAlign: TextAlign.center,
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Harmonia Bold',
                                          color: Colors.white,
                                          fontSize: 11,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            )
                          ],
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
                  color: Color(0xFFF1F4F7),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0, SizeConfig.blockSizeVertical * 1, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 5, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Karthiga Rajendran',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, SizeConfig.blockSizeVertical * 1, 0, 0),
                              child: Text(
                                'Jan 17, 2022 at 09:30 AM',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.5,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 23.5, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '09:30 AM - 09:45 AM',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.3,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 1,
                                  SizeConfig.blockSizeHorizontal * 5,
                                  0),
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 30.5,
                                height: SizeConfig.blockSizeVertical * 2.3,
                                decoration: BoxDecoration(
                                  color: Color(0xFF9132FD),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0,
                                      SizeConfig.blockSizeVertical * 0.3, 0, 0),
                                  child: Text(
                                    'appointment history',
                                    textAlign: TextAlign.center,
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Harmonia Bold',
                                          color: Colors.white,
                                          fontSize: 11,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            )
                          ],
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
                  color: Color(0xFFF1F4F7),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0, SizeConfig.blockSizeVertical * 1, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 5, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Karthiga Rajendran',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, SizeConfig.blockSizeVertical * 1, 0, 0),
                              child: Text(
                                'Jan 17, 2022 at 09:30 AM',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.5,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 23.5, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '09:30 AM - 09:45 AM',
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.3,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 1,
                                  SizeConfig.blockSizeHorizontal * 5,
                                  0),
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 30.5,
                                height: SizeConfig.blockSizeVertical * 2.3,
                                decoration: BoxDecoration(
                                  color: Color(0xFF9132FD),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0,
                                      SizeConfig.blockSizeVertical * 0.3, 0, 0),
                                  child: Text(
                                    'appointment history',
                                    textAlign: TextAlign.center,
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Harmonia Bold',
                                          color: Colors.white,
                                          fontSize: 11,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            )
                          ],
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
                  color: Color(0xFFF1F4F7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
