import 'package:trymd_partner/accountsetup/accountsetup1.dart';
import 'package:trymd_partner/accountsetup/dashaccount.dart';
import 'package:trymd_partner/accountsetup/dashbank.dart';
import 'package:trymd_partner/accountsetup/dashboardcancel.dart';
// import 'package:trymd_partner/category_select/category_selection.dart';
import 'package:trymd_partner/category_select/dashboardcategory.dart';
import 'package:trymd_partner/dashboard/fee_slab.dart';
import 'package:trymd_partner/dashboard/view_prescription.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_icon_button.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:trymd_partner/fda_screens/screens/profile_setting.dart';
// import 'package:trymd_partner/freelancer/freelancer_widget.dart';
import 'package:trymd_partner/freelancer/fulltime.dart';
// import 'package:trymd_partner/freelancer/home.dart';
// import 'package:trymd_partner/operation_details/operational_details_widget.dart';
import 'package:trymd_partner/operation_details/operational_dash.dart';
import 'package:trymd_partner/sizer.dart';

// import '../trymd_flow/trymd_theme.dart' as tt;
// import '../trymd_flow/util.dart';
// import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({Key key}) : super(key: key);

  @override
  _MyProfileWidgetState createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      //   leading: Icon(
      //     Icons.arrow_back_ios,
      //     color: Colors.black,
      //     size: 24,
      //   ),
      //   title: Text(
      //     'My Profile',
      //     style: tt.TrymdTheme.of(context).bodyText1.override(
      //           fontFamily: 'Harmonia Bold',
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //           useGoogleFonts: false,
      //         ),
      //   ),
      //   actions: [],
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      backgroundColor: Colors.white,
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
                      SizeConfig.blockSizeVertical * 4,
                      0,
                      0,
                    ),
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                          'https://moneyinc.com/wp-content/uploads/2016/06/Dr-Oz.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 1,
                      SizeConfig.blockSizeVertical * 1,
                      0,
                      0,
                    ),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountSetupWidget(),
                          ),
                        );
                      },
                      child: Text(
                        "Trym'd Partner",
                        style: TrymdPartnerTheme.of(context).bodyText1.override(
                              fontFamily: 'Harmonia Bold',
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 8,
                      0,
                      0,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 86,
                        height: SizeConfig.blockSizeVertical * 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileSettingWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 2,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: TrymdPartnerIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 10,
                                          borderWidth: 1,
                                          buttonSize:
                                              SizeConfig.blockSizeVertical * 5,
                                          fillColor: Color(0XFF599AF6),
                                          icon: Icon(
                                            Icons.person_sharp,
                                            color: Color(0xFFFFFFFF),
                                            size: SizeConfig.blockSizeVertical *
                                                3,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 7.5,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Profile Setting',
                                          style: TrymdPartnerTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Harmonia Bold',
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
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
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileSettingWidget(),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.black,
                                            size: SizeConfig.blockSizeVertical *
                                                3,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 1.5,
                                  SizeConfig.blockSizeVertical * 1,
                                  0,
                                  0,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileSettingWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 2,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: TrymdPartnerIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 10,
                                          borderWidth: 1,
                                          buttonSize:
                                              SizeConfig.blockSizeVertical * 5,
                                          fillColor: Color(0XFF599AF6),
                                          icon: Icon(
                                            Icons.person_sharp,
                                            color: Color(0xFFFFFFFF),
                                            size: SizeConfig.blockSizeVertical *
                                                3,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 7.5,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Business Setup',
                                          style: TrymdPartnerTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Harmonia Bold',
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 27.5,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileSettingWidget(),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.black,
                                            size: SizeConfig.blockSizeVertical *
                                                3,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 1.5,
                                  SizeConfig.blockSizeVertical * 1,
                                  0,
                                  0,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FeeslabWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 2,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: TrymdPartnerIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 10,
                                          borderWidth: 1,
                                          buttonSize:
                                              SizeConfig.blockSizeVertical * 5,
                                          fillColor: Color(0XFF599AF6),
                                          icon: Icon(
                                            Icons.person_sharp,
                                            color: Color(0xFFFFFFFF),
                                            size: SizeConfig.blockSizeVertical *
                                                3,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 7.5,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Fee Slab',
                                          style: TrymdPartnerTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Harmonia Bold',
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 40.5,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    FeeslabWidget(),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.black,
                                            size: SizeConfig.blockSizeVertical *
                                                3,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 1.5,
                                  SizeConfig.blockSizeVertical * 1,
                                  0,
                                  0,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ViewPrescriptionWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 2,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: TrymdPartnerIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 10,
                                          borderWidth: 1,
                                          buttonSize:
                                              SizeConfig.blockSizeVertical * 5,
                                          fillColor: Color(0XFF599AF6),
                                          icon: Icon(
                                            Icons.person_sharp,
                                            color: Color(0xFFFFFFFF),
                                            size: SizeConfig.blockSizeVertical *
                                                3,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 7.5,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'View Prescription',
                                          style: TrymdPartnerTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Harmonia Bold',
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
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
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewPrescriptionWidget(),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.black,
                                            size: SizeConfig.blockSizeVertical *
                                                3,
                                          ),
                                        ),
                                      )
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
