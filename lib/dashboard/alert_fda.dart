import 'package:trymd_partner/dashboard/dashboard.dart';
import 'package:trymd_partner/sizer.dart';
import '../global_widget/trymd_partner_theme.dart';
import 'package:flutter/material.dart';

class AlertWidget extends StatefulWidget {
  const AlertWidget({Key key}) : super(key: key);

  @override
  _AlertWidgetState createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  String showAvailableContent = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              0,
              260,
              0,
              0,
            ),
            child: Material(
              color: Colors.transparent,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Container(
                width: 270,
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        70,
                        0,
                        0,
                      ),
                      child: Text(
                        'Your FDA account will be ',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          fontSize: SizeConfig.blockSizeVertical * 2,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
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
                        'BLOCKED',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          fontSize: SizeConfig.blockSizeVertical * 2,
                          color: Color(0XFF477FFF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Color(0x85D8D8D8),
                    ),
                    Text(
                      '  Are you sure want \nto update the status?',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        fontSize: SizeConfig.blockSizeVertical * 2,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        20,
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
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  if (showAvailableContent.length == 0 ||
                                      showAvailableContent != "1") {
                                    showAvailableContent = "1";
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DashboardScreen(),
                                        ));
                                  } else if (showAvailableContent == "1") {
                                    showAvailableContent = "";
                                  }
                                });
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                child: Container(
                                  width: 110,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: showAvailableContent == "1"
                                          ? [
                                              Color(0xFF3F8BFD),
                                              Color(0xFF07D0F2)
                                            ]
                                          : [Colors.white, Colors.white],
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    border: Border.all(
                                      width: 1,
                                      color: showAvailableContent == "1"
                                          ? Colors.transparent
                                          : Color(0XFF3F8BFD),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      10,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'YES',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: showAvailableContent == "1"
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
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
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  if (showAvailableContent.length == 0 ||
                                      showAvailableContent != "2") {
                                    showAvailableContent = "2";
                                    Navigator.pop(context);
                                  } else if (showAvailableContent == "2") {
                                    showAvailableContent = "";
                                  }
                                });
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                child: Container(
                                  width: 110,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: showAvailableContent == "2"
                                          ? [
                                              Color(0xFF3F8BFD),
                                              Color(0xFF07D0F2)
                                            ]
                                          : [Colors.white, Colors.white],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(0.87, -1),
                                      end: AlignmentDirectional(-0.87, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    border: Border.all(
                                      width: 1,
                                      color: showAvailableContent == "2"
                                          ? Colors.transparent
                                          : Color(0XFF3F8BFD),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      10,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'NO',
                                      textAlign: TextAlign.center,
                                      style: TrymdPartnerTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Harmonia Bold',
                                            color: showAvailableContent == "2"
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
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
        ],
      ),
    );
  }
}
