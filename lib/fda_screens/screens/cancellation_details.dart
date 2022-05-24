import 'package:trymd_partner/dashboard/dashboard.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_drop_down.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';

// import '../global_widget/flutter_flow_drop_down.dart';
// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
// import 'package:trymd_partner/fda_screens/global_widgets/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:trymd_partner/sizer.dart';
// import 'package:google_fonts/google_fonts.dart';

class CancellationDetailsWidget extends StatefulWidget {
  const CancellationDetailsWidget({Key key}) : super(key: key);

  @override
  _CancellationDetailsWidgetState createState() =>
      _CancellationDetailsWidgetState();
}

class _CancellationDetailsWidgetState extends State<CancellationDetailsWidget> {
  String dropDownValue1;
  TextEditingController textController1;
  TextEditingController textController2;
  String dropDownValue2;
  TextEditingController textController3;
  TextEditingController textController4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
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
                  ));
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: SizeConfig.blockSizeVertical * 3,
            )),
        title: Text(
          'Cancellation Details',
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
                      SizeConfig.blockSizeHorizontal * 1,
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
                          child: Text(
                            'Cancellation  details',
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 2.5,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 18,
                            0,
                            0,
                            0,
                          ),
                          child: Text(
                            '+ Add other',
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
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
                      0,
                      SizeConfig.blockSizeVertical * 1.5,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 4,
                              0,
                              0,
                              0,
                            ),
                            child: TextFormField(
                              controller: textController1,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Before',
                                labelStyle: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF1F4F7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF1F4F7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 3,
                                  0,
                                  0,
                                  0,
                                ),
                              ),
                              style: TrymdPartnerTheme.of(context).bodyText1,
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
                          child: TrymdPartnerDropDown(
                            options: ['Hour', 'Minute'].toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue1 = val),
                            width: SizeConfig.blockSizeHorizontal * 28,
                            height: SizeConfig.blockSizeVertical * 5.8,
                            textStyle: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.black,
                              size: SizeConfig.blockSizeVertical * 2,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Color(0xFFF1F4F7),
                            borderWidth: 1,
                            borderRadius: 10,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 4,
                                SizeConfig.blockSizeVertical * 0.3,
                                SizeConfig.blockSizeHorizontal * 3,
                                SizeConfig.blockSizeVertical * 0.4),
                            hidesUnderline: true,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
                              0,
                              SizeConfig.blockSizeHorizontal * 5,
                              0,
                            ),
                            child: TextFormField(
                              controller: textController2,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '% Deducted',
                                labelStyle: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF1F4F7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF1F4F7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 3,
                                  0,
                                  0,
                                  0,
                                ),
                              ),
                              style: TrymdPartnerTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 1.5,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 4,
                              0,
                              0,
                              0,
                            ),
                            child: TextFormField(
                              controller: textController3,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Before',
                                labelStyle: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF1F4F7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF1F4F7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 3,
                                  0,
                                  0,
                                  0,
                                ),
                              ),
                              style: TrymdPartnerTheme.of(context).bodyText1,
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
                          child: TrymdPartnerDropDown(
                            options: ['Hour', 'Minute'].toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue1 = val),
                            width: SizeConfig.blockSizeHorizontal * 28,
                            height: SizeConfig.blockSizeVertical * 5.8,
                            textStyle: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.black,
                              size: SizeConfig.blockSizeVertical * 2,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Color(0xFFF1F4F7),
                            borderWidth: 1,
                            borderRadius: 10,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 4,
                                SizeConfig.blockSizeVertical * 0.3,
                                SizeConfig.blockSizeHorizontal * 3,
                                SizeConfig.blockSizeVertical * 0.4),
                            hidesUnderline: true,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
                              0,
                              SizeConfig.blockSizeHorizontal * 5,
                              0,
                            ),
                            child: TextFormField(
                              controller: textController4,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '% Deducted',
                                labelStyle: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF1F4F7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF1F4F7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 3,
                                  0,
                                  0,
                                  0,
                                ),
                              ),
                              style: TrymdPartnerTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 50,
                      0,
                      0,
                    ),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardScreen(),
                            ));
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
                          width: SizeConfig.blockSizeHorizontal * 86,
                          height: SizeConfig.blockSizeVertical * 6,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF3F8BFD), Color(0xFF07D0F2)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0.94, -1),
                              end: AlignmentDirectional(-0.94, 1),
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              SizeConfig.blockSizeVertical * 1.5,
                              0,
                              0,
                            ),
                            child: Text(
                              'Update',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                fontSize: SizeConfig.blockSizeVertical * 2.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
