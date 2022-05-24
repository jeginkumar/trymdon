import 'package:trymd_partner/dashboard/dashboard.dart';

// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trymd_partner/repository.dart';
import 'package:trymd_partner/sizer.dart';
// import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  dynamic namelistofsearch;
  List<dynamic> namesearch = [];
  List<dynamic> colorList = [];
  var _controller = TextEditingController();
  var colors = [
    Colors.red,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.cyan,
    Colors.green
  ];

  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = namesearch;
      setState(() {});
      print(results);
    } else {
      results = namesearch
          .where((user) => user["listofnames"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      print(results);
      setState(() {
        colorList = results;
      });

      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      namesearch = results;
    });
  }

  @override
  void initState() {
    super.initState();
    colorList = namesearch;
    _controller = TextEditingController();
    finalnamelist();
  }

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
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
          child: TextField(
            controller: _controller,
            onChanged: (value) => _runFilter(value),
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Search',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFF1F4F7),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFF1F4F7),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
              prefixIcon: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                    size: SizeConfig.blockSizeVertical * 3.5,
                  )),
              suffixIcon: _controller.text.isNotEmpty
                  ? InkWell(
                      onTap: () => setState(
                            () => _controller.clear(),
                          ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Icon(
                          Icons.clear,
                          color: Color(0xFFCCD2E3),
                          size: 22,
                        ),
                      ))
                  : null,
            ),
            style: TextStyle(
              fontFamily: 'geometric sans-serif',
              fontSize: SizeConfig.blockSizeVertical * 2.2,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [],
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 1,
                      0,
                      0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: SizeConfig.blockSizeVertical * 3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          0,
                          0,
                          0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 6,
                                0,
                                0,
                                0,
                              ),
                              child: Text(
                                'Results',
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                                  color: Color(0xFFCCD2E3),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 1 * 1,
                                0,
                                0,
                                0,
                              ),
                              child: Text(
                                '(6)',
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                                  color: Color(0xFFCCD2E3),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 66,
                                0,
                                0,
                                0,
                              ),
                              child: Icon(
                                Icons.tune_outlined,
                                color: Color(0xFFCCD2E3),
                                size: SizeConfig.blockSizeVertical * 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: SizeConfig.blockSizeVertical * 1,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F7),
                    ),
                  ),

                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        SizeConfig.blockSizeHorizontal * 1,
                        SizeConfig.blockSizeVertical * 0,
                        SizeConfig.blockSizeHorizontal * 0,
                        0,
                      ),
                      child: Container(
                        height: 1300,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.white),
                        child: namesearch.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: ScrollPhysics(),
                                itemCount: namesearch.length,
                                // (namesearch == null) ? 0 : namesearch.length,
                                itemBuilder: (context, index) {
                                  return search(context, index);
                                },
                              )
                            : Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 5.5,
                                    0,
                                    0,
                                    0),
                                child: Text('No results found',
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2.5,
                                      color: Color(0xFFCCD2E3),
                                      fontWeight: FontWeight.bold,
                                    ))),
                      )),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 2,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 5,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 10,
                  //           height: SizeConfig.blockSizeVertical * 4,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xFF2C9B47),
                  //             shape: BoxShape.circle,
                  //           ),
                  //           child: Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(
                  //               0,
                  //               SizeConfig.blockSizeVertical * 0.8,
                  //               0,
                  //               0,
                  //             ),
                  //             child: Text(
                  //               'K',
                  //               textAlign: TextAlign.center,
                  //               style: TrymdPartnerTheme.of(context)
                  //                   .bodyText1
                  //                   .override(
                  //                     fontFamily: 'geometric sans-serif',
                  //                     color: Colors.white,
                  //                     fontSize:
                  //                         SizeConfig.blockSizeVertical * 1.8,
                  //                     fontWeight: FontWeight.bold,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 3,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           'Karthiga Rajendran',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Divider(
                  //   height: SizeConfig.blockSizeVertical * 2,
                  //   thickness: 1,
                  //   indent: 20,
                  //   endIndent: 20,
                  //   color: Color(0xFFF1F4F7),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 2,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 5,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 10,
                  //           height: SizeConfig.blockSizeVertical * 4,
                  //           decoration: BoxDecoration(
                  //             color: Color(
                  //               0xFFDE6530,
                  //             ),
                  //             shape: BoxShape.circle,
                  //           ),
                  //           child: Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(
                  //               0,
                  //               SizeConfig.blockSizeVertical * 0.8,
                  //               0,
                  //               0,
                  //             ),
                  //             child: Text(
                  //               'K',
                  //               textAlign: TextAlign.center,
                  //               style: TrymdPartnerTheme.of(context)
                  //                   .bodyText1
                  //                   .override(
                  //                     fontFamily: 'geometric sans-serif',
                  //                     color: Colors.white,
                  //                     fontSize:
                  //                         SizeConfig.blockSizeVertical * 1.8,
                  //                     fontWeight: FontWeight.bold,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 3,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           'Karthiga Rajendran',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Divider(
                  //   height: SizeConfig.blockSizeVertical * 2,
                  //   thickness: 1,
                  //   indent: 20,
                  //   endIndent: 20,
                  //   color: Color(0xFFF1F4F7),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 2,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 5,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 10,
                  //           height: SizeConfig.blockSizeVertical * 4,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xFF9132FD),
                  //             shape: BoxShape.circle,
                  //           ),
                  //           child: Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(
                  //               0,
                  //               SizeConfig.blockSizeVertical * 0.8,
                  //               0,
                  //               0,
                  //             ),
                  //             child: Text(
                  //               'K',
                  //               textAlign: TextAlign.center,
                  //               style: TrymdPartnerTheme.of(context)
                  //                   .bodyText1
                  //                   .override(
                  //                     fontFamily: 'geometric sans-serif',
                  //                     color: Colors.white,
                  //                     fontSize:
                  //                         SizeConfig.blockSizeVertical * 1.8,
                  //                     fontWeight: FontWeight.bold,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 3,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           'Karthiga Rajendran',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Divider(
                  //   height: SizeConfig.blockSizeVertical * 2,
                  //   thickness: 1,
                  //   indent: 20,
                  //   endIndent: 20,
                  //   color: Color(0xFFF1F4F7),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 2,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 5,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 10,
                  //           height: SizeConfig.blockSizeVertical * 4,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xFFE6864E),
                  //             shape: BoxShape.circle,
                  //           ),
                  //           child: Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(
                  //               0,
                  //               SizeConfig.blockSizeVertical * 0.8,
                  //               0,
                  //               0,
                  //             ),
                  //             child: Text(
                  //               'K',
                  //               textAlign: TextAlign.center,
                  //               style: TrymdPartnerTheme.of(context)
                  //                   .bodyText1
                  //                   .override(
                  //                     fontFamily: 'geometric sans-serif',
                  //                     color: Colors.white,
                  //                     fontSize:
                  //                         SizeConfig.blockSizeVertical * 1.8,
                  //                     fontWeight: FontWeight.bold,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 3,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           'Karthiga Rajendran',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Divider(
                  //   height: SizeConfig.blockSizeVertical * 2,
                  //   thickness: 1,
                  //   indent: 20,
                  //   endIndent: 20,
                  //   color: Color(0xFFF1F4F7),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 2,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 5,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 10,
                  //           height: SizeConfig.blockSizeVertical * 4,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xFF3F8BFD),
                  //             shape: BoxShape.circle,
                  //           ),
                  //           child: Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(
                  //               0,
                  //               SizeConfig.blockSizeVertical * 0.8,
                  //               0,
                  //               0,
                  //             ),
                  //             child: Text(
                  //               'K',
                  //               textAlign: TextAlign.center,
                  //               style: TrymdPartnerTheme.of(context)
                  //                   .bodyText1
                  //                   .override(
                  //                     fontFamily: 'geometric sans-serif',
                  //                     color: Colors.white,
                  //                     fontSize:
                  //                         SizeConfig.blockSizeVertical * 1.8,
                  //                     fontWeight: FontWeight.bold,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 3,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           'Karthiga Rajendran',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Divider(
                  //   height: SizeConfig.blockSizeVertical * 2,
                  //   thickness: 1,
                  //   indent: 20,
                  //   endIndent: 20,
                  //   color: Color(0xFFF1F4F7),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 2,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 5,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 10,
                  //           height: SizeConfig.blockSizeVertical * 4,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xFFFF7384),
                  //             shape: BoxShape.circle,
                  //           ),
                  //           child: Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(
                  //               0,
                  //               SizeConfig.blockSizeVertical * 0.8,
                  //               0,
                  //               0,
                  //             ),
                  //             child: Text(
                  //               'K',
                  //               textAlign: TextAlign.center,
                  //               style: TrymdPartnerTheme.of(context)
                  //                   .bodyText1
                  //                   .override(
                  //                     fontFamily: 'geometric sans-serif',
                  //                     color: Colors.white,
                  //                     fontSize:
                  //                         SizeConfig.blockSizeVertical * 1.8,
                  //                     fontWeight: FontWeight.bold,
                  //                     useGoogleFonts: false,
                  //                   ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 3,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           'Karthiga Rajendran',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Divider(
                  //   height: SizeConfig.blockSizeVertical * 2,
                  //   thickness: 1,
                  //   indent: 20,
                  //   endIndent: 20,
                  //   color: Color(0xFFF1F4F7),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget search(context, index) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          SizeConfig.blockSizeHorizontal * 2,
          SizeConfig.blockSizeVertical * 2,
          0,
          0,
        ),
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              SizeConfig.blockSizeHorizontal * 1,
              SizeConfig.blockSizeVertical * 0,
              0,
              SizeConfig.blockSizeVertical * 2,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    SizeConfig.blockSizeHorizontal * 5,
                    0,
                    0,
                    0,
                  ),
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 10,
                    height: SizeConfig.blockSizeVertical * 4,
                    decoration: BoxDecoration(
                      color: colors[index],
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        SizeConfig.blockSizeVertical * 0.8,
                        0,
                        0,
                      ),
                      child: Text(
                        namesearch[index]["caption"],
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
                    SizeConfig.blockSizeHorizontal * 3,
                    0,
                    0,
                    0,
                  ),
                  child: Text(
                    namesearch[index]["listofnames"],
                    style: TextStyle(
                      fontFamily: 'geometric sans-serif',
                      fontSize: SizeConfig.blockSizeVertical * 2,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: SizeConfig.blockSizeVertical * 1.6,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Color(0xFFF1F4F7),
          )
        ]));
  }

  finalnamelist() async {
    var response = Searchengine();
    Map<String, dynamic> value = await response.searchbar();
    namesearch = value["namesearch"];
    print('Access Control: ' + namesearch.toString());
    setState(() {});
  }
}
