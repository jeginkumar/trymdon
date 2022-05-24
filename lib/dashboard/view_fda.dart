// import 'package:trymd_partner/dashboard/alertfda.dart';
import 'package:trymd_partner/dashboard/dashboard.dart';
import 'package:trymd_partner/dashboard/fda_edit.dart';
// import 'package:trymd_partner/fda_registration/fda_registration.dart';
// import 'package:trymd_partner/fda_screens/fdahome.dart';
import 'package:trymd_partner/fda_screens/screens/fda_dashboard.dart';
import 'package:trymd_partner/sizer.dart';

// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
// import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class ViewFDAWidget extends StatefulWidget {
  const ViewFDAWidget({Key key}) : super(key: key);

  @override
  _ViewFDAWidgetState createState() => _ViewFDAWidgetState();
}

class _ViewFDAWidgetState extends State<ViewFDAWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  TextEditingController textController6;
  TextEditingController textController7;
  TextEditingController textController8;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
    textController7 = TextEditingController();
    textController8 = TextEditingController();
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
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          'FDA Details',
          style: TextStyle(
            fontFamily: 'geometric sans-serif',
            fontSize: SizeConfig.blockSizeVertical * 3,
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
                      0,
                      70,
                      0,
                      0,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Container(
                        width: 350,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          border: Border.all(
                            width: 1,
                            color: Color(0xFFEEEEEE),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                16,
                                0,
                                0,
                                0,
                              ),
                              child: Container(
                                width: 70,
                                height: 70,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'http://moneyinc.com/wp-content/uploads/2016/06/Dr-Oz.jpg',
                                  fit: BoxFit.fitHeight,
                                ),
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
                                        20,
                                        10,
                                        20,
                                        0,
                                      ),
                                      child: Text(
                                        'Ravichandhiran',
                                        style: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        10,
                                        50,
                                        0,
                                      ),
                                      child: Container(
                                        width: 70,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF55B153),
                                              Color(0XFF34BA1B)
                                            ],
                                            stops: [0, 1],
                                            begin:
                                                AlignmentDirectional(0.87, -1),
                                            end: AlignmentDirectional(-0.87, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            3,
                                            0,
                                            0,
                                          ),
                                          child: Text(
                                            'Active',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                                  'geometric sans-serif',
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      1.64,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            )
                          ],
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
                    child: Container(
                      width: 350,
                      height: 280,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          20,
                          0,
                          0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Mobile number:',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      '9677525135',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
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
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Email id:',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Trmyd@gmail.com',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
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
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Language spoken:',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'English',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
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
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Educational classification:',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'B.Sc Nursing',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
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
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Gender:',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Male',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
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
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Work experience:',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      '10 Years',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
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
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Employee start year:',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      '2010',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
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
                            10,
                            0,
                            0,
                            0,
                          ),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FDADashboardWidget(),
                                ),
                              );
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
                                width: 170,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // gradient: LinearGradient(
                                  //   colors: [
                                  //     Color(0xFF3F8BFD),
                                  //     Color(0xFF07D0F2)
                                  //   ],
                                  //   stops: [0, 1],
                                  //   begin: AlignmentDirectional(0.87, -1),
                                  //   end: AlignmentDirectional(-0.87, 1),
                                  // ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0XFF3F8BFD),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    16,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    'Switch to FDA',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.9,
                                      color: Colors.black,
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
                            10,
                            0,
                            0,
                            0,
                          ),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FDAEditScreenWidget(),
                                ),
                              );
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Container(
                                width: 170,
                                height: 50,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF3F8BFD),
                                        Color(0xFF07D0F2)
                                      ],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(0.87, -1),
                                      end: AlignmentDirectional(-0.87, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    color: Colors.grey[300]),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    16,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    'Edit',
                                    textAlign: TextAlign.center,
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Harmonia Bold',
                                          color: Colors.white,
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
      ),
    );
  }
}
