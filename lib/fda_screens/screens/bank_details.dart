import 'package:trymd_partner/dashboard/dashboard.dart';

import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
import 'package:trymd_partner/fda_screens/screens/payment_history.dart';
import 'package:trymd_partner/sizer.dart';
// import 'package:google_fonts/google_fonts.dart';

class BankDetailsWidget extends StatefulWidget {
  const BankDetailsWidget({Key key}) : super(key: key);

  @override
  _BankDetailsWidgetState createState() => _BankDetailsWidgetState();
}

class _BankDetailsWidgetState extends State<BankDetailsWidget> {
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
                  ));
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: SizeConfig.blockSizeVertical * 3,
            )),
        title: Text(
          'Bank Details',
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
                            SizeConfig.blockSizeHorizontal * 6,
                            0,
                            0,
                            0,
                          ),
                          child: Text(
                            'Add Bank Details',
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 2.5,
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
                      SizeConfig.blockSizeVertical * 2,
                      0,
                      0,
                    ),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 90,
                      height: SizeConfig.blockSizeVertical * 7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFF1F4F7),
                          )
                        ],
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          color: Color(0xFFF1F4F7),
                        ),
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
                            child: Image.network(
                              'https://1000logos.net/wp-content/uploads/2018/03/SBI-Logo.png',
                              width: SizeConfig.blockSizeHorizontal * 12,
                              height: SizeConfig.blockSizeVertical * 2,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
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
                                    SizeConfig.blockSizeVertical * 1.5,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    'State Bank of India 2653',
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.7,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    SizeConfig.blockSizeHorizontal * 18,
                                    0,
                                  ),
                                  child: Text(
                                    'Savings Account',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.4,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 1.7,
                      0,
                      0,
                    ),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 90,
                      height: SizeConfig.blockSizeVertical * 7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFF1F4F7),
                          )
                        ],
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          color: Color(0xFFF1F4F7),
                        ),
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
                            child: Image.asset(
                              'assets/images/Group 33981.png',
                              width: SizeConfig.blockSizeHorizontal * 12,
                              height: SizeConfig.blockSizeVertical * 2.5,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
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
                                    SizeConfig.blockSizeVertical * 1.5,
                                    SizeConfig.blockSizeHorizontal * 18,
                                    0,
                                  ),
                                  child: Text(
                                    'HDFC Bank 3932',
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.7,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    SizeConfig.blockSizeHorizontal * 24,
                                    0,
                                  ),
                                  child: Text(
                                    'Savings Account',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.4,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0,
                      SizeConfig.blockSizeVertical * 1.5,
                      0,
                      0,
                    ),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 90,
                      height: SizeConfig.blockSizeVertical * 7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          color: Color(0xFF3F8BFD),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              0,
                              0,
                              0,
                            ),
                            child: Icon(
                              Icons.account_balance,
                              color: Color(0xFF3F8BFD),
                              size: SizeConfig.blockSizeVertical * 3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 6,
                              0,
                              0,
                              0,
                            ),
                            child: Text(
                              'Add bank account',
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                fontSize: SizeConfig.blockSizeVertical * 2.2,
                                color: Color(0XFF3F8BFD),
                                fontWeight: FontWeight.bold,
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
                      SizeConfig.blockSizeVertical * 36,
                      0,
                      0,
                    ),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentHistoryWidget(),
                            ));
                      },
                      child: Text(
                        'VIEW PAYMENT HISTORY',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          fontSize: SizeConfig.blockSizeVertical * 1.8,
                          color: Color(0XFF3F8BFD),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: SizeConfig.blockSizeVertical * 0.5,
                    thickness: 1.5,
                    indent: 117,
                    endIndent: 117,
                    color: Color(0xFF3F8BFD),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        SizeConfig.blockSizeVertical * 8,
                        0,
                        SizeConfig.blockSizeVertical * 5),
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
