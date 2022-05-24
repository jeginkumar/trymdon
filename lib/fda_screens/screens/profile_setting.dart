import 'package:trymd_partner/dashboard/dashboard.dart';

// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
import 'package:trymd_partner/sizer.dart';
// import 'package:google_fonts/google_fonts.dart';

class ProfileSettingWidget extends StatefulWidget {
  const ProfileSettingWidget({Key key}) : super(key: key);

  @override
  _ProfileSettingWidgetState createState() => _ProfileSettingWidgetState();
}

class _ProfileSettingWidgetState extends State<ProfileSettingWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
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
        title: Text(
          'Profile settings',
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
                            SizeConfig.blockSizeHorizontal * 4,
                            0,
                            0,
                            0,
                          ),
                          child: Text(
                            'Contact details',
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 2.2,
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
                      SizeConfig.blockSizeHorizontal * 4,
                      SizeConfig.blockSizeVertical * 2,
                      SizeConfig.blockSizeHorizontal * 4,
                      0,
                    ),
                    child: TextFormField(
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Proffessional name',
                        labelStyle: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          fontSize: SizeConfig.blockSizeVertical * 1.8,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
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
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        fontSize: SizeConfig.blockSizeVertical * 1.8,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 4,
                      SizeConfig.blockSizeVertical * 2,
                      SizeConfig.blockSizeHorizontal * 4,
                      0,
                    ),
                    child: TextFormField(
                      controller: textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Email id',
                        labelStyle: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          fontSize: SizeConfig.blockSizeVertical * 1.8,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
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
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        fontSize: SizeConfig.blockSizeVertical * 1.6,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 4,
                      SizeConfig.blockSizeVertical * 2,
                      SizeConfig.blockSizeHorizontal * 4,
                      0,
                    ),
                    child: TextFormField(
                      controller: textController3,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Contact no',
                        labelStyle: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          fontSize: SizeConfig.blockSizeVertical * 1.8,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
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
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 1,
                      SizeConfig.blockSizeVertical * 2,
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
                            'Image',
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
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
                            '(240 px X 1080 px)',
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 6,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 27,
                              height: SizeConfig.blockSizeVertical * 12,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/User.png',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 23,
                              SizeConfig.blockSizeVertical * 7,
                              0,
                              0,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2,
                              shape: const CircleBorder(),
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 8,
                                height: SizeConfig.blockSizeVertical * 5,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 0.5,
                                    SizeConfig.blockSizeVertical * 0.5,
                                    0,
                                    0,
                                  ),
                                  child: Icon(
                                    Icons.photo_camera_outlined,
                                    color: Colors.black,
                                    size: SizeConfig.blockSizeVertical * 2.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 24,
                      0,
                      0,
                    ),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardScreen(),
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
