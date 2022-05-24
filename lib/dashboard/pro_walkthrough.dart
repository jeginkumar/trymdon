import 'package:trymd_partner/dashboard/dashboard.dart';
// import 'package:trymd_partner/trymd_flow/flutter_flow_widgets.dart';
// import 'package:trymd_partner/trymd_flow/trymd_theme.dart';

// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
// import '../global_widget/flutter_flow_widgets.dart';
// import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:trymd_partner/fda_screens/global_widgets/flutter_flow_theme.dart';
import 'package:trymd_partner/global_widget/trymd_partner_widgets.dart';

class ProfessionalWalkthrough extends StatefulWidget {
  const ProfessionalWalkthrough({Key key}) : super(key: key);

  @override
  _ProfessionalWalkthroughState createState() =>
      _ProfessionalWalkthroughState();
}

class _ProfessionalWalkthroughState extends State<ProfessionalWalkthrough> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageViewController ??= PageController(
                          initialPage: 0,
                        ),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFEFE),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/Walkthrough Screen_1.png',
                                  width: double.infinity,
                                  height: 750,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 78),
                                  //   child: Row(
                                  //     mainAxisSize: MainAxisSize.max,
                                  //     children: [
                                  //       Padding(
                                  //         padding: EdgeInsetsDirectional.fromSTEB(
                                  //             180, 6, 0, 0,),
                                  //         child: FFButtonWidget(
                                  //           onPressed: () async {
                                  //             await Navigator.push(
                                  //               context,
                                  //               MaterialPageRoute(
                                  //                 builder: (context) =>
                                  //                     DashboardScreen(),
                                  //               ),
                                  //             );
                                  //           },
                                  //           text: 'Explore Now',
                                  //           options: FFButtonOptions(
                                  //             width: 170,
                                  //             height: 50,
                                  //             color: Color(0xFF39D2C0,),
                                  //             textStyle: TrymdTheme.of(context)
                                  //                 .subtitle2
                                  //                 .override(
                                  //                   fontFamily: 'Lexend Deca',
                                  //                   color: Colors.white,
                                  //                   fontSize: 16,
                                  //                   fontWeight: FontWeight.w500,
                                  //                 ),
                                  //             elevation: 2,
                                  //             borderSide: BorderSide(
                                  //               color: Colors.transparent,
                                  //               width: 1,
                                  //             ),
                                  //             borderRadius: 12,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF15212B),
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFEFE),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/Google Pixel 2 XL - 31.png',
                                    width: double.infinity,
                                    height: 750,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 78),
                                    //   child: Row(
                                    //     mainAxisSize: MainAxisSize.max,
                                    //     children: [
                                    //       Padding(
                                    //         padding:
                                    //             EdgeInsetsDirectional.fromSTEB(
                                    //                 180, 6, 0, 0,),
                                    //         child: FFButtonWidget(
                                    //           onPressed: () async {
                                    //             await Navigator.push(
                                    //               context,
                                    //               MaterialPageRoute(
                                    //                 builder: (context) =>
                                    //                     DashboardScreen(),
                                    //               ),
                                    //             );
                                    //           },
                                    //           text: 'Explore Now',
                                    //           options: FFButtonOptions(
                                    //             width: 170,
                                    //             height: 50,
                                    //             color: Color(0xFF39D2C0,),
                                    //             textStyle: TrymdTheme.of(context)
                                    //                 .subtitle2
                                    //                 .override(
                                    //                   fontFamily: 'Lexend Deca',
                                    //                   color: Colors.white,
                                    //                   fontSize: 16,
                                    //                   fontWeight: FontWeight.w500,
                                    //                 ),
                                    //             elevation: 2,
                                    //             borderSide: BorderSide(
                                    //               color: Colors.transparent,
                                    //               width: 1,
                                    //             ),
                                    //             borderRadius: 12,
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFDCE0E4),
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFEFE),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/Google Pixel 2 XL - 32.png',
                                    width: double.infinity,
                                    height: 750,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 78),
                                    // child: Row(
                                    //   mainAxisSize: MainAxisSize.max,
                                    //   children: [
                                    //     Padding(
                                    //       padding:
                                    //           EdgeInsetsDirectional.fromSTEB(
                                    //               180, 6, 0, 0,),
                                    //       child: FFButtonWidget(
                                    //         onPressed: () async {
                                    //           await Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //               builder: (context) =>
                                    //                   DashboardScreen(),
                                    //             ),
                                    //           );
                                    //         },
                                    //         text: 'Explore Now',
                                    //         options: FFButtonOptions(
                                    //           width: 170,
                                    //           height: 50,
                                    //           color: Color(0xFF39D2C0,),
                                    //           textStyle: TrymdTheme.of(context)
                                    //               .subtitle2
                                    //               .override(
                                    //                 fontFamily: 'Lexend Deca',
                                    //                 color: Colors.white,
                                    //                 fontSize: 16,
                                    //                 fontWeight: FontWeight.w500,
                                    //               ),
                                    //           elevation: 2,
                                    //           borderSide: BorderSide(
                                    //             color: Colors.transparent,
                                    //             width: 1,
                                    //           ),
                                    //           borderRadius: 12,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFDCE0E4),
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFEFE),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/4 SCREEN.png',
                                    width: double.infinity,
                                    height: 750,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 23),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            180,
                                            6,
                                            0,
                                            0,
                                          ),
                                          child: TrymdButtonWidget(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DashboardScreen(),
                                                ),
                                              );
                                            },
                                            text: 'Go to home',
                                            options: TrymdButtonOptions(
                                              width: 170,
                                              height: 50,
                                              color: Color(0xFFFE418A),
                                              textStyle: TrymdPartnerTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              elevation: 2,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
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
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.85, 0.7),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            0,
                            0,
                            10,
                          ),
                          child: SmoothPageIndicator(
                            controller: pageViewController ??= PageController(
                              initialPage: 0,
                            ),
                            count: 4,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController.animateToPage(
                                i,
                                duration: Duration(
                                  milliseconds: 500,
                                ),
                                curve: Curves.ease,
                              );
                            },
                            effect: ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 8,
                              dotHeight: 8,
                              dotColor: Color(0xFFC6CAD4),
                              activeDotColor: Color(0xFFFE418A),
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
