// import 'package:expansion_tile_card/expansion_tile_card.dart';
// import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:trymd_partner/global_widget/trymd_partner_theme.dart';
// import 'package:trymd_partner/repository.dart';
// import 'package:trymd_partner/sizer.dart';

// class ServiceListingView extends StatefulWidget {
//   const ServiceListingView({Key key}) : super(key: key);

//   @override
//   _ServiceListingViewState createState() => _ServiceListingViewState();
// }

// class _ServiceListingViewState extends State<ServiceListingView> {
//   dynamic servicename;
//   // final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
//   // final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     servicelisting();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         leading: Icon(
//           Icons.arrow_back_ios,
//           color: Colors.black,
//           size: 24,
//         ),
//         title: Text(
//           'Service Fee Details',
//           style: TextStyle(
//             fontFamily: 'geometric sans-serif',
//             color: Colors.black,
//             fontSize: SizeConfig.blockSizeVertical * 3,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [],
//         centerTitle: true,
//         elevation: 0,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(
//                 20,
//                 0,
//                 0,
//                 0,
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(
//                       10,
//                       0,
//                       0,
//                       0,
//                     ),
//                     child: Text(
//                       'Service Listing',
//                       style: TextStyle(
//                         fontFamily: 'geometric sans-serif',
//                         color: Colors.black,
//                         fontSize: SizeConfig.blockSizeVertical * 2,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               physics: ScrollPhysics(),
//               itemCount: (servicename == null) ? 0 : servicename.length,
//               itemBuilder: (context, index) {
//                 print(servicename);
//                 return servicelist(context, index);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget access() {
//     return Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(
//         0,
//         10,
//         0,
//         0,
//       ),
//       child: Material(
//         color: Colors.transparent,
//         elevation: 1,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Container(
//           width: double.infinity,
//           height: 64,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(
//               10,
//               4,
//               0,
//               0,
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(
//                     6,
//                     0,
//                     0,
//                     0,
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                           0,
//                           2,
//                           0,
//                           0,
//                         ),
//                         child: Text(
//                           'Slots',
//                           style: TextStyle(
//                             fontFamily: 'geometric sans-serif',
//                             color: Colors.black,
//                             fontSize: SizeConfig.blockSizeVertical * 1.8,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                           0,
//                           4,
//                           0,
//                           0,
//                         ),
//                         child: Container(
//                           width: 50,
//                           height: 27,
//                           decoration: BoxDecoration(
//                             color: Color(0xFFF1F4F7),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                               0,
//                               6,
//                               0,
//                               0,
//                             ),
//                             child: Text(
//                               '2',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: 'geometric sans-serif',
//                                 color: Colors.black,
//                                 fontSize: SizeConfig.blockSizeVertical * 1.4,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(
//                     10,
//                     0,
//                     0,
//                     0,
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                           0,
//                           2,
//                           0,
//                           0,
//                         ),
//                         child: Text(
//                           'Duration',
//                           style: TextStyle(
//                             fontFamily: 'geometric sans-serif',
//                             color: Colors.black,
//                             fontSize: SizeConfig.blockSizeVertical * 1.8,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                           0,
//                           4,
//                           0,
//                           0,
//                         ),
//                         child: Container(
//                           width: 70,
//                           height: 27,
//                           decoration: BoxDecoration(
//                             color: Color(0xFFF1F4F7),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                               0,
//                               6,
//                               0,
//                               0,
//                             ),
//                             child: Text(
//                               '40 mins',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: 'geometric sans-serif',
//                                 color: Color(0XFFACB9C2),
//                                 fontSize: SizeConfig.blockSizeVertical * 1.4,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(
//                     10,
//                     0,
//                     0,
//                     0,
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                           0,
//                           2,
//                           0,
//                           0,
//                         ),
//                         child: Text(
//                           'Fee',
//                           style: TextStyle(
//                             fontFamily: 'geometric sans-serif',
//                             color: Colors.black,
//                             fontSize: SizeConfig.blockSizeVertical * 1.8,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                           0,
//                           4,
//                           0,
//                           0,
//                         ),
//                         child: Container(
//                           width: 50,
//                           height: 27,
//                           decoration: BoxDecoration(
//                             color: Color(0xFFF1F4F7),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                               0,
//                               6,
//                               0,
//                               0,
//                             ),
//                             child: Text(
//                               '100',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: 'geometric sans-serif',
//                                 color: Colors.black,
//                                 fontSize: SizeConfig.blockSizeVertical * 1.4,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(
//                     10,
//                     0,
//                     0,
//                     0,
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                           0,
//                           2,
//                           0,
//                           0,
//                         ),
//                         child: Text(
//                           'Tax',
//                           style: TextStyle(
//                             fontFamily: 'geometric sans-serif',
//                             color: Colors.black,
//                             fontSize: SizeConfig.blockSizeVertical * 1.8,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                           0,
//                           4,
//                           0,
//                           0,
//                         ),
//                         child: Container(
//                           width: 45,
//                           height: 27,
//                           decoration: BoxDecoration(
//                             color: Color(0xFFF1F4F7),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                               0,
//                               6,
//                               0,
//                               0,
//                             ),
//                             child: Text(
//                               '18%',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: 'geometric sans-serif',
//                                 color: Colors.black,
//                                 fontSize: SizeConfig.blockSizeVertical * 1.4,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(
//                     10,
//                     0,
//                     0,
//                     0,
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                           0,
//                           2,
//                           0,
//                           0,
//                         ),
//                         child: Text(
//                           'Total',
//                           style: TextStyle(
//                             fontFamily: 'geometric sans-serif',
//                             color: Colors.black,
//                             fontSize: SizeConfig.blockSizeVertical * 1.8,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                           0,
//                           4,
//                           0,
//                           0,
//                         ),
//                         child: Container(
//                           width: 80,
//                           height: 27,
//                           decoration: BoxDecoration(
//                             color: Color(0xFFF1F4F7),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                               0,
//                               6,
//                               0,
//                               0,
//                             ),
//                             child: Text(
//                               '118',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: 'geometric sans-serif',
//                                 color: Color(0XFFACB9C2),
//                                 fontSize: SizeConfig.blockSizeVertical * 1.4,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget servicelist(context, index) {
//     return Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(
//         10,
//         10,
//         10,
//         0,
//       ),
//       child: ExpansionTileCard(
//           baseColor: Color(0xFFF1F4F7),
//           expandedColor: Color(0XFF3F8BFD),
//           expandedTextColor: Colors.white,
//           title: Text(
//             servicename[index]['nameofservice'],
//             style: TextStyle(
//               fontFamily: 'geometric sans-serif',
//               fontSize: SizeConfig.blockSizeVertical * 2,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           children: [access()]),
//     );
//   }

//   servicelisting() async {
//     var response = Service();
//     Map<String, dynamic> value = await response.list();
//     servicename = value["servicelist"];
//     print(
//       'Access Control: ' + servicename.toString(),
//     );
//     if (mounted) setState(() {});
//   }
// }

import 'package:flutter/material.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';

class ServicedetailsWidget extends StatefulWidget {
  const ServicedetailsWidget({Key key}) : super(key: key);

  @override
  _ServicedetailsWidgetState createState() => _ServicedetailsWidgetState();
}

class _ServicedetailsWidgetState extends State<ServicedetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black,
          size: 24,
        ),
        title: Text(
          'Service Fee Details',
          style: TrymdPartnerTheme.of(context).title2.override(
                fontFamily: 'Harmonia Bold',
                color: Colors.black,
                fontSize: 20,
                useGoogleFonts: false,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
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
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F4F7),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Text(
                          'Service Listing',
                          style: TrymdPartnerTheme.of(context).title2.override(
                                fontFamily: 'Harmonia Bold',
                                color: Colors.black,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: 335,
                    height: 118,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFF1F4F7),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Text(
                                  'Consultation',
                                  style: TrymdPartnerTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Harmonia Bold',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    170, 0, 0, 0),
                                child: Text(
                                  '118',
                                  style: TrymdPartnerTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Harmonia Bold',
                                        color: Color(0xFFFF7384),
                                        fontSize: 14,
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
                          indent: 20,
                          endIndent: 20,
                          color: Color(0xFFF1F4F7),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Slots',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '2',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Duration',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 0, 0),
                                          child: Text(
                                            '40',
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Harmonia Bold',
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 0, 0),
                                          child: Text(
                                            'mins',
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Harmonia Bold',
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Fee',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '100',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Tax',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '18 %',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: 335,
                    height: 118,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFF1F4F7),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Text(
                                  'Vaccination',
                                  style: TrymdPartnerTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Harmonia Bold',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    170, 0, 0, 0),
                                child: Text(
                                  '118',
                                  style: TrymdPartnerTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Harmonia Bold',
                                        color: Color(0xFFFF7384),
                                        fontSize: 14,
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
                          indent: 20,
                          endIndent: 20,
                          color: Color(0xFFF1F4F7),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Slots',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '2',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Duration',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 0, 0),
                                          child: Text(
                                            '40',
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Harmonia Bold',
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 0, 0),
                                          child: Text(
                                            'mins',
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Harmonia Bold',
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Fee',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '100',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Tax',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '18 %',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: 335,
                    height: 118,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFF1F4F7),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Text(
                                  'Follow-up',
                                  style: TrymdPartnerTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Harmonia Bold',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    184, 0, 0, 0),
                                child: Text(
                                  '118',
                                  style: TrymdPartnerTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Harmonia Bold',
                                        color: Color(0xFFFF7384),
                                        fontSize: 14,
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
                          indent: 20,
                          endIndent: 20,
                          color: Color(0xFFF1F4F7),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Slots',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '2',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Duration',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 0, 0),
                                          child: Text(
                                            '40',
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Harmonia Bold',
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 0, 0),
                                          child: Text(
                                            'mins',
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Harmonia Bold',
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Fee',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '100',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Tax',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '18 %',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: 335,
                    height: 118,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFF1F4F7),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Text(
                                  'Consultation',
                                  style: TrymdPartnerTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Harmonia Bold',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    170, 0, 0, 0),
                                child: Text(
                                  '118',
                                  style: TrymdPartnerTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Harmonia Bold',
                                        color: Color(0xFFFF7384),
                                        fontSize: 14,
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
                          indent: 20,
                          endIndent: 20,
                          color: Color(0xFFF1F4F7),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Slots',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '2',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Duration',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 0, 0),
                                          child: Text(
                                            '40',
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Harmonia Bold',
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 0, 0),
                                          child: Text(
                                            'mins',
                                            style: TrymdPartnerTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Harmonia Bold',
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Fee',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '100',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width: 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Tax',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        '18 %',
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Harmonia Bold',
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
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
          ),
        ),
      ),
    );
  }
}
