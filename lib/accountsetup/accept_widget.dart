import 'package:flutter_svg/flutter_svg.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:trymd_partner/accountsetup/accountsetup1.dart';
import 'package:trymd_partner/dashboard/dashboard.dart';

import 'package:trymd_partner/sizer.dart';
// import '../trymd_flow/trymd_theme.dart' as tt;
import 'package:flutter/material.dart';

class AcceptWidget extends StatefulWidget {
  final vendorType;
  const AcceptWidget({this.vendorType});

  @override
  _AcceptWidgetState createState() => _AcceptWidgetState();
}

class _AcceptWidgetState extends State<AcceptWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final LocalStorage storage = new LocalStorage('localstorage_app');

  Future<bool> _onBackButtonPressed() async {
    // Navigator.pop(context);
    // Navigator.pushReplacement(
    //   context,
    //   PageRouteBuilder(
    //     pageBuilder: (context, animation1, animation2) => AccountSetupWidget(
    //       vendorType: widget.vendorType,
    //     ),
    //     transitionDuration: Duration(seconds: 0,),
    //   ),
    // );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return WillPopScope(
        onWillPop: _onBackButtonPressed,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
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
                        SizeConfig.blockSizeVertical * 25,
                        0,
                        0,
                      ),
                      child: SvgPicture.asset(
                        "assets/images/Group_6872.svg",
                        width: SizeConfig.blockSizeHorizontal * 50,
                        height: SizeConfig.blockSizeVertical * 21,
                        fit: BoxFit.cover,
                      ),

                      // Image.asset(
                      //   'assets/images/Group_6872.png',
                      //   width: SizeConfig.blockSizeHorizontal * 50,
                      //   height: SizeConfig.blockSizeVertical * 21,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        20,
                        20,
                        0,
                        0,
                      ),
                      child: Text(
                        'Account Setup Completed',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Color(
                            0xFF000000,
                          ),
                          fontSize: SizeConfig.blockSizeVertical * 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        20,
                        0,
                        0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 80,
                                height: SizeConfig.blockSizeVertical * 8,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color(0xFF2BA4F9),
                                      Color(0xFF07D0F2),
                                    ],
                                    stops: [0, 1],
                                    begin: AlignmentDirectional(1, 1),
                                    end: AlignmentDirectional(
                                      0,
                                      0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 95, vertical: 18),
                                primary: Colors.white,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () {
                                storage.setItem("successStatus", 1);
                                if (storage.getItem('mobile_number') ==
                                    '9876543210') {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              DashboardScreen(),
                                      transitionDuration: Duration(
                                        seconds: 0,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              DashboardScreen(),
                                      transitionDuration: Duration(
                                        seconds: 0,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Move to Home Screen',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFFFFFFFF),
                                  fontSize: SizeConfig.blockSizeVertical * 2,
                                  fontWeight: FontWeight.w700,
                                ),
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
        ),
      );
    });
  }
}
