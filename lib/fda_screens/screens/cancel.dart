import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:trymd_partner/sizer.dart';

class CancelWidget extends StatefulWidget {
  const CancelWidget({Key key}) : super(key: key);

  @override
  _CancelWidgetState createState() => _CancelWidgetState();
}

class _CancelWidgetState extends State<CancelWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black,
          size: 24,
        ),
        title: Text(
          'Cancellation Details',
          style: TrymdPartnerTheme.of(context).bodyText1.override(
                fontFamily: 'geometric sans-serif',
                color: Colors.black,
                fontSize: SizeConfig.blockSizeVertical * 3,
                fontWeight: FontWeight.bold,
                useGoogleFonts: false,
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
              Icons.drive_file_rename_outline,
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
                Container(
                  width: double.infinity,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F4F7),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    10,
                    10,
                    0,
                    0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          20,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          'Cancellation  details',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    10,
                    20,
                    0,
                    0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          20,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          'Before ',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
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
                          '40 mins',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          140,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          '20% ',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Color(0xFFFF7384),
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          1,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          ' Deducted',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Color(0xFFFF7384),
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                  color: Color(0xFFF1F4F7),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    10,
                    10,
                    0,
                    0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          20,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          'Before ',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
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
                          '2 hour',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          146,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          '10% ',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Color(0xFFFF7384),
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          1,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          ' Deducted',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Color(0xFFFF7384),
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                  color: Color(0xFFF1F4F7),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    10,
                    10,
                    0,
                    0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          20,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          'Before ',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
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
                          '24 hour',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          145,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          '5% ',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Color(0xFFFF7384),
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          1,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          ' Deducted',
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Color(0xFFFF7384),
                                fontSize: SizeConfig.blockSizeVertical * 1.6,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
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
