import 'package:trymd_partner/dashboard/dashboard.dart';

// import '../global_widget/flutter_flow_drop_down.dart';
// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
// import '../global_widget/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_drop_down.dart';
// import 'package:trymd_partner/fda_screens/global_widgets/flutter_flow_theme.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_widgets.dart';
import 'package:trymd_partner/sizer.dart';

class BusinessSettingWidget extends StatefulWidget {
  const BusinessSettingWidget({Key key}) : super(key: key);

  @override
  _BusinessSettingWidgetState createState() => _BusinessSettingWidgetState();
}

class _BusinessSettingWidgetState extends State<BusinessSettingWidget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFE5E5E5),
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
          'Business settings',
          style: TextStyle(
            fontFamily: 'geometric sans-serif',
            fontSize: SizeConfig.blockSizeVertical * 3,
            color: Colors.black,
            fontWeight: FontWeight.w600,
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
              color: Color(0xFFE5E5E5),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 1.5,
                      0,
                      0,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 96,
                        height: SizeConfig.blockSizeVertical * 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
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
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      SizeConfig.blockSizeVertical * 2.4,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Category Selection',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      SizeConfig.blockSizeVertical * 0.5,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'doctor out patient',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 17,
                                0,
                                0,
                                0,
                              ),
                              child: TrymdButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Change',
                                options: TrymdButtonOptions(
                                  width: SizeConfig.blockSizeHorizontal * 33,
                                  height: SizeConfig.blockSizeVertical * 6,
                                  color: Color(0xFF3F8BFD),
                                  textStyle: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    fontSize: SizeConfig.blockSizeVertical * 2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 1.5,
                      0,
                      0,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 96,
                        height: SizeConfig.blockSizeVertical * 26,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
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
                                      SizeConfig.blockSizeHorizontal * 8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Speciality Selection',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 50,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Color(0xFF3F8BFD),
                                      size: SizeConfig.blockSizeVertical * 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: SizeConfig.blockSizeVertical * 2.5,
                              thickness: 1,
                              indent: 16,
                              endIndent: 16,
                              color: Color(0xFFF1F4F7),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0,
                                SizeConfig.blockSizeVertical * 0.5,
                                0,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 4,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      height:
                                          SizeConfig.blockSizeVertical * 4.5,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/dermatalogy & cosmetology.png',
                                          ).image,
                                        ),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFFE418A),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 5,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Dermatology',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 30,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 22,
                                      height:
                                          SizeConfig.blockSizeVertical * 2.8,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 1,
                                          0,
                                          SizeConfig.blockSizeHorizontal * 0,
                                          0,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      0,
                                                  SizeConfig.blockSizeVertical *
                                                      0.2,
                                                  0,
                                                  SizeConfig.blockSizeVertical *
                                                      0.2),
                                              child: Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    6,
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    1.8,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: SizeConfig
                                                          .blockSizeVertical *
                                                      1.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      SizeConfig
                                                              .blockSizeVertical *
                                                          1,
                                                      0,
                                                      0,
                                                      SizeConfig
                                                              .blockSizeVertical *
                                                          0.2),
                                              child: Text(
                                                'Remove',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'geometric sans-serif',
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      1.5,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 4,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      height:
                                          SizeConfig.blockSizeVertical * 4.5,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/obsterics & gynecology.png',
                                          ).image,
                                        ),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFFE418A),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 5,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Gynecologists',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 28,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 22,
                                      height:
                                          SizeConfig.blockSizeVertical * 2.8,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 1,
                                          0,
                                          SizeConfig.blockSizeHorizontal * 0,
                                          0,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      0,
                                                  SizeConfig.blockSizeVertical *
                                                      0.2,
                                                  0,
                                                  SizeConfig.blockSizeVertical *
                                                      0.2),
                                              child: Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    6,
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    1.8,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: SizeConfig
                                                          .blockSizeVertical *
                                                      1.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      SizeConfig
                                                              .blockSizeVertical *
                                                          1,
                                                      0,
                                                      0,
                                                      SizeConfig
                                                              .blockSizeVertical *
                                                          0.2),
                                              child: Text(
                                                'Remove',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'geometric sans-serif',
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      1.5,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 4,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 10,
                                      height:
                                          SizeConfig.blockSizeVertical * 4.5,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                        image: DecorationImage(
                                          fit: BoxFit.fitHeight,
                                          image: Image.asset(
                                            'assets/images/radiology.png',
                                          ).image,
                                        ),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFFE418A),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 5.5,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Ophthalmologist',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 23,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 22,
                                      height:
                                          SizeConfig.blockSizeVertical * 2.8,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 1,
                                          0,
                                          SizeConfig.blockSizeHorizontal * 0,
                                          0,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      0,
                                                  SizeConfig.blockSizeVertical *
                                                      0.2,
                                                  0,
                                                  SizeConfig.blockSizeVertical *
                                                      0.2),
                                              child: Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    6,
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    1.8,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: SizeConfig
                                                          .blockSizeVertical *
                                                      1.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      SizeConfig
                                                              .blockSizeVertical *
                                                          1,
                                                      0,
                                                      0,
                                                      SizeConfig
                                                              .blockSizeVertical *
                                                          0.2),
                                              child: Text(
                                                'Remove',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'geometric sans-serif',
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      1.5,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
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
                      0,
                      SizeConfig.blockSizeVertical * 1.5,
                      0,
                      0,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 96,
                        height: SizeConfig.blockSizeVertical * 21,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 1.5,
                                SizeConfig.blockSizeVertical * 1,
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
                                      'Labels Selection',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 56,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Color(0xFF3F8BFD),
                                      size: SizeConfig.blockSizeVertical * 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: SizeConfig.blockSizeVertical * 2,
                              thickness: 1,
                              indent: 16,
                              endIndent: 16,
                              color: Color(0xFFF1F4F7),
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
                                      SizeConfig.blockSizeHorizontal * 5,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 11.3,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.7,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'ECG',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2.5,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 16,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.6,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Angio',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 16.5,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.6,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Fever',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 12,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.7,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'ECG',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 16.5,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.6,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Angio',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
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
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 11.3,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.7,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'ECG',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2.5,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 16,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.6,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Angio',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 16.5,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.6,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Fever',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 12,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.7,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'ECG',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 16.5,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.6,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Angio',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
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
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 11.3,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.7,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'ECG',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2.5,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 16,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.6,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Angio',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 16.5,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.6,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Fever',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 12,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.7,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'ECG',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 2,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 16.5,
                                      height: SizeConfig.blockSizeVertical * 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 0.6,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Angio',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.4,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 1.5,
                      0,
                      0,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 96,
                        height: SizeConfig.blockSizeVertical * 14,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
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
                                      SizeConfig.blockSizeHorizontal * 7,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Service Selection',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 54,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Icon(
                                      Icons.drive_file_rename_outline,
                                      color: Color(0xFF3F8BFD),
                                      size: SizeConfig.blockSizeVertical * 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: SizeConfig.blockSizeVertical * 2,
                              thickness: 1,
                              indent: 16,
                              endIndent: 16,
                              color: Color(0xFFF1F4F7),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0,
                                SizeConfig.blockSizeVertical * 0.5,
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
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 26,
                                      height: SizeConfig.blockSizeVertical * 4,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                        borderRadius: BorderRadius.circular(34),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 1,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Consultation',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.5,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 4,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 26,
                                      height: SizeConfig.blockSizeVertical * 4,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                        borderRadius: BorderRadius.circular(34),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 1,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Consultation',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.5,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 4,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 26,
                                      height: SizeConfig.blockSizeVertical * 4,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F7),
                                        borderRadius: BorderRadius.circular(34),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          SizeConfig.blockSizeVertical * 1,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Consultation',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.5,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 1.5,
                      0,
                      0,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 96,
                        height: SizeConfig.blockSizeVertical * 14,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
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
                                      SizeConfig.blockSizeHorizontal * 7,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Professional Work Start Year',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
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
                              child: TrymdPartnerDropDown(
                                options: [
                                  '1998',
                                  '2000',
                                  '2001',
                                  '2002',
                                  '2003'
                                ].toList(),
                                onChanged: (val) =>
                                    setState(() => dropDownValue = val),
                                width: 345,
                                height: 56,
                                textStyle: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                hintText: 'Please select...',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Colors.black,
                                  size: SizeConfig.blockSizeVertical * 2,
                                ),
                                fillColor: Color(0xFFF1F4F7),
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 10,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 6,
                                    SizeConfig.blockSizeVertical * 0.5,
                                    SizeConfig.blockSizeHorizontal * 5,
                                    SizeConfig.blockSizeVertical * 0.5),
                                hidesUnderline: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 18,
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 2,
                      0,
                      0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: SizeConfig.blockSizeVertical * 4,
                      decoration: BoxDecoration(
                        color: Color(0xFFE5E5E5),
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
  }
}
