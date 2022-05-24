import 'package:flutter/services.dart';
import 'package:trymd_partner/auth_screens/registration/registration_widget.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/global_widget/trymd_partner_theme.dart';
import 'package:trymd_partner/freelancer/freelancer_widget.dart';
// import 'package:trymd_partner/freelancer/!freelancer_widget.dart';
// import 'package:trymd_partner/freelancer/freelancer_widget.dart';
import 'package:trymd_partner/repository/auth.dart';
import '../../sizer.dart';
import '../otpverification/otpverification_widget.dart';
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LoginPageScreen extends StatefulWidget {
  final userType;
  LoginPageScreen({this.userType});

  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  TextEditingController mobileNumberController = TextEditingController();
  String mnum = "";
  final _form = GlobalKey<FormState>();
  dynamic value = "";

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onBackButtonPressed() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => RegistrationScreen(),
        transitionDuration: Duration(
          seconds: 0,
        ),
      ),
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return WillPopScope(
        onWillPop: _onBackButtonPressed,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xFF0D0D0D),
                size: SizeConfig.blockSizeVertical * 3,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        RegistrationScreen(),
                    transitionDuration: Duration(
                      seconds: 0,
                    ),
                  ),
                );
              },
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          SizeConfig.blockSizeVertical * 10,
                          0,
                          0,
                        ),
                        child: Image.asset(
                          'assets/images/logo_final.png',
                          width: SizeConfig.blockSizeHorizontal * 40,
                          height: SizeConfig.blockSizeVertical * 16,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            SizeConfig.blockSizeVertical * 4,
                            0,
                            0,
                          ),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FreelancerWidget(),
                                ),
                              );
                            },
                            child: Text(
                              'Login to account',
                              textAlign: TextAlign.center,
                              style: TrymdPartnerTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'geometric sans-serif',
                                    color: Color(
                                      0xFF000000,
                                    ),
                                    fontSize: SizeConfig.blockSizeVertical * 3,
                                    fontWeight: FontWeight.w700,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          SizeConfig.blockSizeVertical * 4,
                          0,
                          0,
                        ),
                        child: Text(
                          'Enter your mobile number, we will send\nyou OTP to verify',
                          textAlign: TextAlign.center,
                          style: TrymdPartnerTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'geometric sans-serif',
                                color: Color(
                                  0xFF000000,
                                ),
                                fontSize: SizeConfig.blockSizeVertical * 1.8,
                                fontWeight: FontWeight.w700,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          SizeConfig.blockSizeVertical * 4,
                          0,
                          0,
                        ),
                        child: Container(
                          // width: 315,
                          // height: 172,
                          width: SizeConfig.blockSizeHorizontal * 90,
                          // height: SizeConfig.blockSizeVertical * 30,
                          constraints:
                              BoxConstraints(maxHeight: double.infinity),
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F7),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 3,
                                  SizeConfig.blockSizeVertical * 2,
                                  SizeConfig.blockSizeHorizontal * 3,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        onSaved: (value) {
                                          mnum = value.toString();
                                        },
                                        controller: mobileNumberController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: '+91',
                                          hintStyle:
                                              TrymdPartnerTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'geometric sans-serif',
                                                    color: Color(
                                                      0xFF000000,
                                                    ),
                                                    fontSize: SizeConfig
                                                            .blockSizeVertical *
                                                        1.8,
                                                    fontWeight: FontWeight.w700,
                                                    useGoogleFonts: false,
                                                  ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(
                                                0x00000000,
                                              ),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          errorStyle: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(
                                                0x00000000,
                                              ),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      2,
                                                  SizeConfig.blockSizeVertical *
                                                      2.5,
                                                  SizeConfig
                                                          .blockSizeHorizontal *
                                                      2,
                                                  SizeConfig.blockSizeVertical *
                                                      2),
                                        ),
                                        style: TrymdPartnerTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  'geometric sans-serif',
                                              color: Color(
                                                0xFF000000,
                                              ),
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              fontWeight: FontWeight.w700,
                                              useGoogleFonts: false,
                                            ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          new LengthLimitingTextInputFormatter(
                                            10,
                                          ),
                                        ],
                                        validator: (val) {
                                          String pattern =
                                              r'(^[6789][0-9]{9}$)';
                                          RegExp regExp = RegExp(pattern);

                                          if (!regExp.hasMatch(val)) {
                                            return "Please Enter a Valid mobile number";
                                          } else if (val.isEmpty) {
                                            return "Please provide a number";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 3,
                                  0,
                                  0,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                        child: Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  80,
                                          height:
                                              SizeConfig.blockSizeVertical * 8,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: <Color>[
                                                Color(0xFF07D0F2),
                                                Color(0xFF3F8BFD),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 95, vertical: 18),
                                          primary: Colors.white,
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_form.currentState.validate()) {
                                            gotoLogin();
                                          }
                                        },
                                        child: Text(
                                          'VERIFY WITH OTP',
                                          textAlign: TextAlign.center,
                                          style: TrymdPartnerTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    'geometric sans-serif',
                                                color: Color(0xFFFFFFFF),
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                                fontWeight: FontWeight.w700,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //  InkWell(
                                //   onTap: () {
                                //     {
                                //       // if (_form.currentState.validate()) {
                                //       gotoLogin();
                                //       // }
                                //     }
                                //   },
                                //   child: Container(
                                //     width:
                                //         SizeConfig.blockSizeHorizontal * 70,
                                //     height:
                                //         SizeConfig.blockSizeVertical * 5.5,
                                //     decoration: BoxDecoration(
                                //       gradient: LinearGradient(
                                //         colors: [
                                //           Color(0xFF95EBF9),
                                //           Color(0xFF07D0F2)
                                //         ],
                                //         stops: [0, 1],
                                //         begin:
                                //             AlignmentDirectional(0.87, -1),
                                //         end: AlignmentDirectional(-0.87, 1),
                                //       ),
                                //       borderRadius:
                                //           BorderRadius.circular(10,),
                                //     ),
                                //     child: Padding(
                                //       padding:
                                //           EdgeInsetsDirectional.fromSTEB(
                                //               0,
                                //               SizeConfig.blockSizeVertical *
                                //                   1.5,
                                //               0,
                                //               0,),
                                //       child: AutoSizeText(
                                //         'VERIFY WITH OTP',
                                //         textAlign: TextAlign.center,
                                //         style: TextStyle(
                                //           fontFamily:
                                //               'Harmonia Sans W01 Bold',
                                //           color: Colors.white,
                                //           letterSpacing: 0.2,
                                //           fontSize:
                                //               SizeConfig.blockSizeVertical *
                                //                   2.5,
                                //           fontWeight: FontWeight.bold,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ),

                              SizedBox(
                                height: SizeConfig.blockSizeVertical * 2,
                              )
                              // height: SizeConfig.blockSizeVertical * 30,,)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          SizeConfig.blockSizeVertical * 14,
                          0,
                          0,
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
                              child: Text(
                                'New user? ',
                                style: TrymdPartnerTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'geometric sans-serif',
                                      color: Color(0xFF979797),
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.8,
                                      fontWeight: FontWeight.w700,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                RegistrationScreen(),
                                        transitionDuration: Duration(
                                          seconds: 0,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Create account',
                                    style: TrymdPartnerTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'geometric sans-serif',
                                          color: Color(
                                            0xFF000000,
                                          ),
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          fontWeight: FontWeight.w700,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 2),
                                  child: Container(
                                    width: 110,
                                    height: 2,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF979797),
                                    ),
                                  ),
                                ),
                              ],
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
        ),
      );
    });
  }

  gotoLogin() async {
    // for demo purpose only
    if (mobileNumberController.text == "9876543210" &&
        widget.userType != null) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => RegOTPVerify(
            mobileNumber: mobileNumberController.text,
            userType: widget.userType,
            loginType: "login",
          ),
          transitionDuration: Duration(
            seconds: 0,
          ),
        ),
      );
    } else {
      var response = await Authentications()
          .getLoginResponse(mobileNumberController.text, widget.userType);
      if (response['status'] == 1) {
        _globalWidget.toastMessage(response['message']);
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => RegOTPVerify(
              mobileNumber: mobileNumberController.text,
              userType: widget.userType,
              loginType: "login",
            ),
            transitionDuration: Duration(
              seconds: 0,
            ),
          ),
        );
      } else {
        _globalWidget.toastMessage(response['message']);
      }
    }
  }
}
