import 'package:trymd_partner/dashboard/dashboard.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';

// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
// import 'package:trymd_partner/fda_screens/global_widgets/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:trymd_partner/sizer.dart';
// import 'package:google_fonts/google_fonts.dart';

class PartnerBioWidget extends StatefulWidget {
  const PartnerBioWidget({Key key}) : super(key: key);

  @override
  _PartnerBioWidgetState createState() => _PartnerBioWidgetState();
}

class _PartnerBioWidgetState extends State<PartnerBioWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          'My Biography',
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
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 2,
                      0,
                      0,
                    ),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 90,
                      height: SizeConfig.blockSizeVertical * 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          color: Color(0xFFF1F4F7),
                        ),
                      ),
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
                                Text(
                                  'About Me',
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.2,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 58,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Icon(
                                    Icons.info_outlined,
                                    color: Color(0xFFE6EEFE),
                                    size: SizeConfig.blockSizeVertical * 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
                              SizeConfig.blockSizeVertical * 2,
                              SizeConfig.blockSizeHorizontal * 3,
                              0,
                            ),
                            child: Text(
                              "We champion equity, inclusion, and diversity and believe that the unique perspectives you'll find in your cohort will make you a more enlightened and empathetic professional. You'll also find comprehensive support to ensure your success, because we're committed to your future, at the school and beyond",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                fontSize: SizeConfig.blockSizeVertical * 1.8,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
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
    );
  }
}
