import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:trymd_partner/sizer.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansionTileCard Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'ExpansionTileCard Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  bool viewvalue = false;
  bool editvalue = false;
  bool deletevalue = false;
  bool allvalue = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();

    // final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(4.0,),),
    //   ),
    // );

    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          10,
          200,
          10,
          0,
        ),
        child: ExpansionTileCard(
          baseColor: Color(0xFFEEEEEE),
          key: cardA,
          title: Container(
            width: 350,
            height: 50,
            decoration: BoxDecoration(
              // color: Color(0xFFEEEEEE),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    30,
                    0,
                    0,
                    0,
                  ),
                  child: Text(
                    '$now',
                    style: TextStyle(
                      fontFamily: 'geometric sans-serif',
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeVertical * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          children: [
            access(),
          ],
        ),
      ),
    );
  }

  Widget access() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        0,
        10,
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
          width: 350,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              24,
              4,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          2,
                          0,
                          0,
                        ),
                        child: Text(
                          'Slots',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Bold',
                                    fontSize: 12,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          4,
                          0,
                          0,
                        ),
                        child: Container(
                          width: 37,
                          height: 27,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F7),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              4,
                              0,
                              0,
                            ),
                            child: Text(
                              '2',
                              textAlign: TextAlign.center,
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Harmonia Bold',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
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
                    10,
                    0,
                    0,
                    0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          2,
                          0,
                          0,
                        ),
                        child: Text(
                          'Duration',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Bold',
                                    fontSize: 12,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          4,
                          0,
                          0,
                        ),
                        child: Container(
                          width: 61,
                          height: 27,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F7),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              4,
                              0,
                              0,
                            ),
                            child: Text(
                              '40 mins',
                              textAlign: TextAlign.center,
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Harmonia Bold',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
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
                    10,
                    0,
                    0,
                    0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          2,
                          0,
                          0,
                        ),
                        child: Text(
                          'Fee',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Bold',
                                    fontSize: 12,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          4,
                          0,
                          0,
                        ),
                        child: Container(
                          width: 47,
                          height: 27,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F7),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              4,
                              0,
                              0,
                            ),
                            child: Text(
                              '100',
                              textAlign: TextAlign.center,
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Harmonia Bold',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
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
                    10,
                    0,
                    0,
                    0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          2,
                          0,
                          0,
                        ),
                        child: Text(
                          'Tax',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Bold',
                                    fontSize: 12,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          4,
                          0,
                          0,
                        ),
                        child: Container(
                          width: 38,
                          height: 27,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F7),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              4,
                              0,
                              0,
                            ),
                            child: Text(
                              '18%',
                              textAlign: TextAlign.center,
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Harmonia Bold',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
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
                    10,
                    0,
                    0,
                    0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          2,
                          0,
                          0,
                        ),
                        child: Text(
                          'Total',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Bold',
                                    fontSize: 12,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          4,
                          0,
                          0,
                        ),
                        child: Container(
                          width: 72,
                          height: 27,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F7),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              4,
                              0,
                              0,
                            ),
                            child: Text(
                              '118',
                              textAlign: TextAlign.center,
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Harmonia Bold',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
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
}

// import 'package:flutter/material.dart';
// import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';

// void main() => runApp(const MyApp(),);

// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title),),
//         body: const MyStatefulWidget(),
//       ),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   bool _customTileExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0,),
//         child: Column(
//           children: <Widget>[
//             ExpansionTile(
//               // backgroundColor: Color(0xFFF1F4F7),
//               trailing: Text(''),
//               // collapsedBackgroundColor: Color(0xFFF1F4F7),

//               title: Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0,),
//                 child: Container(
//                   width: 335,
//                   height: 56,
//                   decoration: BoxDecoration(
//                     color: Color(0xFFF1F4F7),
//                     borderRadius: BorderRadius.circular(10,),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0,),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0,),
//                           child: Text(
//                             'Consultation',
//                             style: TrymdPartnerTheme.of(context).bodyText1,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(190, 0, 0, 0,),
//                           child: Icon(
//                             Icons.keyboard_arrow_down,
//                             color: Colors.black,
//                             size: 24,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               children: <Widget>[
//                 ListTile(
//                   title: Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0,),
//                     child: Material(
//                       color: Colors.transparent,
//                       elevation: 1,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10,),
//                       ),
//                       child: Container(
//                         width: 100,
//                         height: 56,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10,),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(24, 4, 0, 0,),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0,),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 2, 0, 0,),
//                                       child: Text(
//                                         'Slots',
//                                         style: TrymdPartnerTheme.of(context)
//                                             .bodyText1
//                                             .override(
//                                               fontFamily: 'Harmonia Bold',
//                                               fontSize: 12,
//                                               useGoogleFonts: false,
//                                             ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 4, 0, 0,),
//                                       child: Container(
//                                         width: 37,
//                                         height: 27,
//                                         decoration: BoxDecoration(
//                                           color: Color(0xFFF1F4F7),
//                                           borderRadius:
//                                               BorderRadius.circular(6),
//                                         ),
//                                         child: Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 4, 0, 0,),
//                                           child: Text(
//                                             '2',
//                                             textAlign: TextAlign.center,
//                                             style: TrymdPartnerTheme.of(context)
//                                                 .bodyText1
//                                                 .override(
//                                                   fontFamily: 'Harmonia Bold',
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.normal,
//                                                   useGoogleFonts: false,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0,),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 2, 0, 0,),
//                                       child: Text(
//                                         'Duration',
//                                         style: TrymdPartnerTheme.of(context)
//                                             .bodyText1
//                                             .override(
//                                               fontFamily: 'Harmonia Bold',
//                                               fontSize: 12,
//                                               useGoogleFonts: false,
//                                             ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 4, 0, 0,),
//                                       child: Container(
//                                         width: 61,
//                                         height: 27,
//                                         decoration: BoxDecoration(
//                                           color: Color(0xFFF1F4F7),
//                                           borderRadius:
//                                               BorderRadius.circular(6),
//                                         ),
//                                         child: Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 4, 0, 0,),
//                                           child: Text(
//                                             '40 mins',
//                                             textAlign: TextAlign.center,
//                                             style: TrymdPartnerTheme.of(context)
//                                                 .bodyText1
//                                                 .override(
//                                                   fontFamily: 'Harmonia Bold',
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.normal,
//                                                   useGoogleFonts: false,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0,),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 2, 0, 0,),
//                                       child: Text(
//                                         'Fee',
//                                         style: TrymdPartnerTheme.of(context)
//                                             .bodyText1
//                                             .override(
//                                               fontFamily: 'Harmonia Bold',
//                                               fontSize: 12,
//                                               useGoogleFonts: false,
//                                             ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 4, 0, 0,),
//                                       child: Container(
//                                         width: 47,
//                                         height: 27,
//                                         decoration: BoxDecoration(
//                                           color: Color(0xFFF1F4F7),
//                                           borderRadius:
//                                               BorderRadius.circular(6),
//                                         ),
//                                         child: Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 4, 0, 0,),
//                                           child: Text(
//                                             '100',
//                                             textAlign: TextAlign.center,
//                                             style: TrymdPartnerTheme.of(context)
//                                                 .bodyText1
//                                                 .override(
//                                                   fontFamily: 'Harmonia Bold',
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.normal,
//                                                   useGoogleFonts: false,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0,),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 2, 0, 0,),
//                                       child: Text(
//                                         'Tax',
//                                         style: TrymdPartnerTheme.of(context)
//                                             .bodyText1
//                                             .override(
//                                               fontFamily: 'Harmonia Bold',
//                                               fontSize: 12,
//                                               useGoogleFonts: false,
//                                             ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 4, 0, 0,),
//                                       child: Container(
//                                         width: 38,
//                                         height: 27,
//                                         decoration: BoxDecoration(
//                                           color: Color(0xFFF1F4F7),
//                                           borderRadius:
//                                               BorderRadius.circular(6),
//                                         ),
//                                         child: Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 4, 0, 0,),
//                                           child: Text(
//                                             '18%',
//                                             textAlign: TextAlign.center,
//                                             style: TrymdPartnerTheme.of(context)
//                                                 .bodyText1
//                                                 .override(
//                                                   fontFamily: 'Harmonia Bold',
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.normal,
//                                                   useGoogleFonts: false,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0,),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 2, 0, 0,),
//                                       child: Text(
//                                         'Total',
//                                         style: TrymdPartnerTheme.of(context)
//                                             .bodyText1
//                                             .override(
//                                               fontFamily: 'Harmonia Bold',
//                                               fontSize: 12,
//                                               useGoogleFonts: false,
//                                             ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           0, 4, 0, 0,),
//                                       child: Container(
//                                         width: 72,
//                                         height: 27,
//                                         decoration: BoxDecoration(
//                                           color: Color(0xFFF1F4F7),
//                                           borderRadius:
//                                               BorderRadius.circular(6),
//                                         ),
//                                         child: Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 4, 0, 0,),
//                                           child: Text(
//                                             '118',
//                                             textAlign: TextAlign.center,
//                                             style: TrymdPartnerTheme.of(context)
//                                                 .bodyText1
//                                                 .override(
//                                                   fontFamily: 'Harmonia Bold',
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.normal,
//                                                   useGoogleFonts: false,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             // ExpansionTile(
//             //   title: const Text('ExpansionTile 2'),
//             //   subtitle: const Text('Custom expansion arrow icon'),
//             //   trailing: Icon(
//             //     _customTileExpanded
//             //         ? Icons.arrow_drop_down_circle
//             //         : Icons.arrow_drop_down,
//             //   ),
//             //   children: const <Widget>[
//             //     ListTile(title: Text('This is tile number 2'),),
//             //   ],
//             //   onExpansionChanged: (bool expanded) {
//             //     setState(() => _customTileExpanded = expanded);
//             //   },
//             // ),
//             // const ExpansionTile(
//             //   title: Text('ExpansionTile 3'),
//             //   subtitle: Text('Leading expansion arrow icon'),
//             //   controlAffinity: ListTileControlAffinity.leading,
//             //   children: <Widget>[
//             //     ListTile(title: Text('This is tile number 3'),),
//             //   ],
//             // ),
//           ],
//         ),);
//   }
// }

// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:intl/intl.dart';

// void main() => runApp(MyApp(),);

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter DateTimePicker Demo',
//       home: MyHomePage(),
//       localizationsDelegates: [
//         GlobalWidgetsLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: [Locale('en', 'US')], //, Locale('pt', 'BR')],
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
//   TextEditingController _controller1;
//   TextEditingController _controller2;
//   TextEditingController _controller3;
//   TextEditingController _controller4;

//   //String _initialValue = '';
//   String _valueChanged1 = '';
//   String _valueToValidate1 = '';
//   String _valueSaved1 = '';
//   String _valueChanged2 = '';
//   String _valueToValidate2 = '';
//   String _valueSaved2 = '';
//   String _valueChanged3 = '';
//   String _valueToValidate3 = '';
//   String _valueSaved3 = '';
//   String _valueChanged4 = '';
//   String _valueToValidate4 = '';
//   String _valueSaved4 = '';

//   @override
//   void initState() {
//     super.initState();
//     Intl.defaultLocale = 'pt_BR';
//     //_initialValue = DateTime.now().toString();
//     _controller1 = TextEditingController(text: DateTime.now().toString(),);
//     _controller2 = TextEditingController(text: DateTime.now().toString(),);
//     _controller3 = TextEditingController(text: DateTime.now().toString(),);

//     String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
//     String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
//     _controller4 = TextEditingController(text: '$lsHour:$lsMinute');

//     _getValue();
//   }

//   /// This implementation is just to simulate a load data behavior
//   /// from a data base sqlite or from a API
//   Future<void> _getValue() async {
//     await Future.delayed(const Duration(seconds: 3), () {
//       setState(() {
//         //_initialValue = '2000-10-22 14:30';
//         _controller1.text = '2000-09-20 14:30';
//         _controller2.text = '2001-10-21 15:31';
//         _controller3.text = '2002-11-22';
//         _controller4.text = '17:01';
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter DateTimePicker Demo'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.only(left: 20, right: 20, top: 10,),
//         child: Form(
//           key: _oFormKey,
//           child: Column(
//             children: <Widget>[
//               DateTimePicker(
//                 type: DateTimePickerType.dateTimeSeparate,
//                 dateMask: 'd MMM, yyyy',
//                 controller: _controller1,
//                 //initialValue: _initialValue,
//                 firstDate: DateTime(2000,),
//                 lastDate: DateTime(2100,),
//                 icon: Icon(Icons.event),
//                 dateLabelText: 'Date',
//                 timeLabelText: "Hour",
//                 //use24HourFormat: false,
//                 //locale: Locale('pt', 'BR'),
//                 selectableDayPredicate: (date) {
//                   if (date.weekday == 6 || date.weekday == 7) {
//                     return false;
//                   }
//                   return true;
//                 },
//                 onChanged: (val) => setState(() => _valueChanged1 = val),
//                 validator: (val) {
//                   setState(() => _valueToValidate1 = val ?? '');
//                   return null;
//                 },
//                 onSaved: (val) => setState(() => _valueSaved1 = val ?? ''),
//               ),
//               DateTimePicker(
//                 type: DateTimePickerType.dateTime,
//                 dateMask: 'd MMMM, yyyy - hh:mm a',
//                 controller: _controller2,
//                 //initialValue: _initialValue,
//                 firstDate: DateTime(2000,),
//                 lastDate: DateTime(2100,),
//                 //icon: Icon(Icons.event),
//                 dateLabelText: 'Date Time',
//                 use24HourFormat: false,
//                 locale: Locale('en', 'US'),
//                 onChanged: (val) => setState(() => _valueChanged2 = val),
//                 validator: (val) {
//                   setState(() => _valueToValidate2 = val ?? '');
//                   return null;
//                 },
//                 onSaved: (val) => setState(() => _valueSaved2 = val ?? ''),
//               ),
//               DateTimePicker(
//                 type: DateTimePickerType.date,
//                 //dateMask: 'yyyy/MM/dd',
//                 controller: _controller3,
//                 //initialValue: _initialValue,
//                 firstDate: DateTime(2000,),
//                 lastDate: DateTime(2100,),
//                 icon: Icon(Icons.event),
//                 dateLabelText: 'Date',
//                 locale: Locale('pt', 'BR'),
//                 onChanged: (val) => setState(() => _valueChanged3 = val),
//                 validator: (val) {
//                   setState(() => _valueToValidate3 = val ?? '');
//                   return null;
//                 },
//                 onSaved: (val) => setState(() => _valueSaved3 = val ?? ''),
//               ),
//               DateTimePicker(
//                 type: DateTimePickerType.time,
//                 //timePickerEntryModeInput: true,
//                 //controller: _controller4,
//                 initialValue: '', //_initialValue,
//                 icon: Icon(Icons.access_time),
//                 timeLabelText: "Time",
//                 use24HourFormat: false,
//                 locale: Locale('pt', 'BR'),
//                 onChanged: (val) => setState(() => _valueChanged4 = val),
//                 validator: (val) {
//                   setState(() => _valueToValidate4 = val ?? '');
//                   return null;
//                 },
//                 onSaved: (val) => setState(() => _valueSaved4 = val ?? ''),
//               ),
//               SizedBox(height: 20,),
//               Text(
//                 'DateTimePicker data value onChanged:',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10,),
//               SelectableText(_valueChanged1),
//               SelectableText(_valueChanged2),
//               SelectableText(_valueChanged3),
//               SelectableText(_valueChanged4),
//               SizedBox(height: 10,),
//               ElevatedButton(
//                 onPressed: () {
//                   final loForm = _oFormKey.currentState;

//                   if (loForm?.validate() == true) {
//                     loForm?.save();
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//               SizedBox(height: 30,),
//               Text(
//                 'DateTimePicker data value validator:',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10,),
//               SelectableText(_valueToValidate1),
//               SelectableText(_valueToValidate2),
//               SelectableText(_valueToValidate3),
//               SelectableText(_valueToValidate4),
//               SizedBox(height: 10,),
//               Text(
//                 'DateTimePicker data value onSaved:',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10,),
//               SelectableText(_valueSaved1),
//               SelectableText(_valueSaved2),
//               SelectableText(_valueSaved3),
//               SelectableText(_valueSaved4),
//               SizedBox(height: 20,),
//               ElevatedButton(
//                 onPressed: () {
//                   final loForm = _oFormKey.currentState;
//                   loForm?.reset();

//                   setState(() {
//                     _valueChanged1 = '';
//                     _valueChanged2 = '';
//                     _valueChanged3 = '';
//                     _valueChanged4 = '';
//                     _valueToValidate1 = '';
//                     _valueToValidate2 = '';
//                     _valueToValidate3 = '';
//                     _valueToValidate4 = '';
//                     _valueSaved1 = '';
//                     _valueSaved2 = '';
//                     _valueSaved3 = '';
//                     _valueSaved4 = '';
//                   });

//                   _controller1.clear();
//                   _controller2.clear();
//                   _controller3.clear();
//                   _controller4.clear();
//                 },
//                 child: Text('Reset'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
