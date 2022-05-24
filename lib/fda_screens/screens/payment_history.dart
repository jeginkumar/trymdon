// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trymd_partner/repository.dart';
import 'package:trymd_partner/sizer.dart';
// import 'package:google_fonts/google_fonts.dart';

class PaymentHistoryWidget extends StatefulWidget {
  const PaymentHistoryWidget({Key key}) : super(key: key);

  @override
  _PaymentHistoryWidgetState createState() => _PaymentHistoryWidgetState();
}

class _PaymentHistoryWidgetState extends State<PaymentHistoryWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> payments = [];
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
      results = payments;
      setState(() {});
      print(results);
    } else {
      results = payments
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
      payments = results;
    });
  }

  @override
  void initState() {
    super.initState();
    finalpaymentlist();
    colorList = payments;
    _controller = TextEditingController();
  }

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
          size: SizeConfig.blockSizeVertical * 3,
        ),
        title: Text(
          'Payment History',
          style: TextStyle(
            fontFamily: 'geometric sans-serif',
            fontSize: SizeConfig.blockSizeVertical * 2,
            color: Colors.black,
            fontWeight: FontWeight.bold,
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
                      SizeConfig.blockSizeHorizontal * 3,
                      SizeConfig.blockSizeVertical * 1,
                      0,
                      0,
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
                          child: Text(
                            'History',
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 65,
                            0,
                            0,
                            0,
                          ),
                          child: Icon(
                            Icons.swap_vert,
                            color: Colors.black,
                            size: SizeConfig.blockSizeVertical * 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
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
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
                        prefixIcon: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 3,
                      SizeConfig.blockSizeVertical * 1,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            0,
                            0,
                            0,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.black,
                            size: SizeConfig.blockSizeVertical * 3,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 27,
                            0,
                            0,
                            0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Today',
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.9,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '08 Apr 2022',
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.4,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            120,
                            0,
                            0,
                            0,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: SizeConfig.blockSizeVertical * 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: SizeConfig.blockSizeVertical * 2,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: Color(0xFFF1F4F7),
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
                        child: payments.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: ScrollPhysics(),
                                itemCount: payments.length,
                                // (namesearch == null) ? 0 : namesearch.length,
                                itemBuilder: (context, index) {
                                  return payinglists(context, index);
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
                  //     SizeConfig.blockSizeHorizontal * 1,
                  //     SizeConfig.blockSizeVertical * 1,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 6,
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
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.8,
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 2,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           children: [
                  //             Text(
                  //               'Karthiga Rajendran',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 2,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               'April 5 , 2020 at 10:33 AM',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.6,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           100,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           '\$200',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 1,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 6,
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
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.8,
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 2,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           children: [
                  //             Text(
                  //               'Karthiga Rajendran',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 2,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               'April 5 , 2020 at 10:33 AM',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.6,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           100,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           '\$200',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 1,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 6,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 10,
                  //           height: SizeConfig.blockSizeVertical * 4,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xFF3468C5),
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
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.8,
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 2,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           children: [
                  //             Text(
                  //               'Karthiga Rajendran',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 2,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               'April 5 , 2020 at 10:33 AM',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.6,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           100,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           '\$200',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 1,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 6,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 10,
                  //           height: SizeConfig.blockSizeVertical * 4,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xFF01326F),
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
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.8,
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 2,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           children: [
                  //             Text(
                  //               'Karthiga Rajendran',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 2,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               'April 5 , 2020 at 10:33 AM',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.6,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           100,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           '\$200',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 1,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 6,
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
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.8,
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 2,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           children: [
                  //             Text(
                  //               'Karthiga Rajendran',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 2,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               'April 5 , 2020 at 10:33 AM',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.6,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           100,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           '\$200',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 1,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 6,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 10,
                  //           height: SizeConfig.blockSizeVertical * 4,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xFFFFC24B),
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
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.8,
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 2,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           children: [
                  //             Text(
                  //               'Karthiga Rajendran',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 2,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               'April 5 , 2020 at 10:33 AM',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.6,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           100,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           '\$200',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 1,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 6,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 10,
                  //           height: SizeConfig.blockSizeVertical * 4,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xFFFF81B5),
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
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.8,
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 2,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           children: [
                  //             Text(
                  //               'Karthiga Rajendran',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 2,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               'April 5 , 2020 at 10:33 AM',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.6,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           100,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           '\$200',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     SizeConfig.blockSizeHorizontal * 1,
                  //     SizeConfig.blockSizeVertical * 2,
                  //     0,
                  //     0,
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 6,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 10,
                  //           height: SizeConfig.blockSizeVertical * 4,
                  //           decoration: BoxDecoration(
                  //             color: Color(0xFFEB965E),
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
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.8,
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           SizeConfig.blockSizeHorizontal * 2,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           children: [
                  //             Text(
                  //               'Karthiga Rajendran',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 2,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               'April 5 , 2020 at 10:33 AM',
                  //               style: TextStyle(
                  //                 fontFamily: 'geometric sans-serif',
                  //                 fontSize: SizeConfig.blockSizeVertical * 1.6,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(
                  //           100,
                  //           0,
                  //           0,
                  //           0,
                  //         ),
                  //         child: Text(
                  //           '\$200',
                  //           style: TextStyle(
                  //             fontFamily: 'geometric sans-serif',
                  //             fontSize: SizeConfig.blockSizeVertical * 2,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget payinglists(context, index) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          SizeConfig.blockSizeHorizontal * 1,
          SizeConfig.blockSizeVertical * 2,
          0,
          0,
        ),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              SizeConfig.blockSizeHorizontal * 3,
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
                  SizeConfig.blockSizeVertical * 0.75,
                  0,
                  0,
                ),
                child: Text(
                  payments[index]["caption"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    fontSize: SizeConfig.blockSizeVertical * 1.8,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                Text(
                  payments[index]["listofnames"],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    fontSize: SizeConfig.blockSizeVertical * 2,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0, SizeConfig.blockSizeVertical * 0.5, 0, 0),
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      Text(
                        payments[index]["date"] + "at",
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          fontSize: SizeConfig.blockSizeVertical * 1.6,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            payments[index]["time"],
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.6,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ))
                    ]))
              ])),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal * 4,
                0,
                0,
                0,
              ),
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    10,
                    0,
                    0,
                    0,
                  ),
                  child: Text(
                    '\$' + payments[index]["amount"],
                    style: TextStyle(
                      fontFamily: 'geometric sans-serif',
                      fontSize: SizeConfig.blockSizeVertical * 2,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 4,
                      SizeConfig.blockSizeVertical * 0.75,
                      0,
                      0),
                  child: Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color(0xFFD6F2D6),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                      child: Text(
                        'Online',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          fontSize: SizeConfig.blockSizeVertical * 1.6,
                          color: Color(0xFF01AD27),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ]))
        ]));
  }

  finalpaymentlist() async {
    var response = Paymentlist();
    Map<String, dynamic> value = await response.listpay();
    payments = value["payments"];
    print('Access Control: ' + payments.toString());
    setState(() {});
  }
}
