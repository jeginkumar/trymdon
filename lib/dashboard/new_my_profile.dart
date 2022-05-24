// import 'package:trymd_partner/SplashScreen.dart';
import 'package:trymd_partner/accountsetup/accountsetup1.dart';
// import 'package:trymd_partner/accountsetup/dashboardcancel.dart';
// import 'package:trymd_partner/accountsetup/dashaccount.dart';
// import 'package:trymd_partner/accountsetup/dashbank.dart';
// import 'package:trymd_partner/accountsetup/dashboardcancel.dart';
// import 'package:trymd_partner/category_select/category_selection.dart';
// import 'package:trymd_partner/category_select/dashboardcategory.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_icon_button.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:trymd_partner/fda_screens/screens/appointment.dart';
import 'package:trymd_partner/fda_screens/screens/bank_details.dart';
import 'package:trymd_partner/fda_screens/screens/bussiness_setting.dart';
// import 'package:trymd_partner/fda_screens/screens/cancellation.dart';
import 'package:trymd_partner/fda_screens/screens/cancel.dart';
import 'package:trymd_partner/fda_screens/screens/partner_bio.dart';
import 'package:trymd_partner/fda_screens/screens/order_summary.dart';
import 'package:trymd_partner/fda_screens/screens/payment_history.dart';
import 'package:trymd_partner/fda_screens/screens/profile_setting.dart';
import 'package:trymd_partner/fda_screens/screens/search.dart';
import 'package:trymd_partner/fda_screens/screens/servicedetails.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';

// import 'package:trymd_partner/freelancer/freelancer_widget.dart';
// import 'package:trymd_partner/freelancer/fulltime.dart';
// import 'package:trymd_partner/freelancer/home.dart';
// import 'package:trymd_partner/operation_details/operational_details_widget.dart';
// import 'package:trymd_partner/operation_details/operationaldash.dart';
import 'package:trymd_partner/sizer.dart';

// import '../trymd_flow/trymd_theme.dart' as tt;
// import '../trymd_flow/util.dart';
// import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';

// import 'expand.dart';
// import 'package:google_fonts/google_fonts.dart';

class PartnerProfileWidget extends StatefulWidget {
  const PartnerProfileWidget({Key key}) : super(key: key);

  @override
  _PartnerProfileWidgetState createState() => _PartnerProfileWidgetState();
}

class _PartnerProfileWidgetState extends State<PartnerProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // initialize global widget
  final _globalWidget = GlobalWidget();

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
                          'http://moneyinc.com/wp-content/uploads/2016/06/Dr-Oz.jpg'),
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
                        "Trym'd User ",
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
                      SizeConfig.blockSizeVertical * 2,
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
                        height: SizeConfig.blockSizeVertical * 70,
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
                                  0,
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
                                          SizeConfig.blockSizeHorizontal * 8,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Profile Settings',
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
                                          SizeConfig.blockSizeHorizontal * 27,
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
                                  0,
                                  SizeConfig.blockSizeVertical * 1,
                                  0,
                                  0,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CancelWidget(),
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
                                            Icons.schedule,
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
                                          SizeConfig.blockSizeHorizontal * 8,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Cancellation Details',
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
                                          SizeConfig.blockSizeHorizontal * 18,
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
                                                    CancelWidget(),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
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
                                            PartnerBioWidget(),
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
                                            Icons.category_sharp,
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
                                          SizeConfig.blockSizeHorizontal * 8,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'My biography',
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
                                                    PartnerBioWidget(),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 1,
                                  0,
                                  0,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    // await Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         BusinessSettingWidget(),
                                    //   ),
                                    // );
                                    _globalWidget.toastMessage(
                                        'Business settings clicked');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 2.4,
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
                                            Icons.build,
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
                                          SizeConfig.blockSizeHorizontal * 8,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Business setting',
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
                                                    BusinessSettingWidget(),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
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
                                            BankDetailsWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 2.4,
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
                                            Icons.account_balance,
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
                                          SizeConfig.blockSizeHorizontal * 8,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Bank Details',
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
                                          SizeConfig.blockSizeHorizontal * 31,
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
                                                    BankDetailsWidget(),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
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
                                            PaymentHistoryWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 2.4,
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
                                            Icons.payment_outlined,
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
                                          SizeConfig.blockSizeHorizontal * 8,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Payment history',
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
                                          SizeConfig.blockSizeHorizontal * 24,
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
                                                    PaymentHistoryWidget(),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 1,
                                  0,
                                  0,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 2.4,
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
                                            Icons.search,
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
                                          SizeConfig.blockSizeHorizontal * 8,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Search',
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
                                          SizeConfig.blockSizeHorizontal * 41,
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
                                                    SearchWidget(),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
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
                                            AppointmentWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 2.4,
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
                                            Icons.work,
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
                                          SizeConfig.blockSizeHorizontal * 8,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Appointment',
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
                                                    AppointmentWidget(),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
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
                                            OrderSummaryWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 2.4,
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
                                            Icons.account_box,
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
                                          SizeConfig.blockSizeHorizontal * 8,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Order summary',
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
                                          SizeConfig.blockSizeHorizontal * 25,
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
                                                    OrderSummaryWidget(),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
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
                                            ServicedetailsWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 2.4,
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
                                            Icons.medical_services,
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
                                          SizeConfig.blockSizeHorizontal * 8,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          'Service list',
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
                                          SizeConfig.blockSizeHorizontal * 33,
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
                                                    ServicedetailsWidget(),
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
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 6,
                    width: double.infinity,
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
