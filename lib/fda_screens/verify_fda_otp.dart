import 'package:flutter_svg/flutter_svg.dart';
// import 'package:trymd_partner/fda_screens/fdahome.dart';
import 'package:trymd_partner/fda_screens/fda_repository/auth.dart';
import 'package:trymd_partner/fda_screens/fda_login.dart';
// import 'package:trymd_partner/repository/auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:trymd_partner/fda_screens/screens/fda_dashboard.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import '../../sizer.dart';
import 'package:localstorage/localstorage.dart';

class OtpVerificationFDA extends StatefulWidget {
  final mobileNumber;
  final userType;
  OtpVerificationFDA({
    this.mobileNumber,
    this.userType,
  });

  @override
  _OtpVerificationFDAState createState() => _OtpVerificationFDAState();
}

class _OtpVerificationFDAState extends State<OtpVerificationFDA>
    with SingleTickerProviderStateMixin {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final LocalStorage storage = new LocalStorage('localstorage_app');
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController otpNumberController = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool animat = false;
  bool animatOne = false;

  @override
  void initState() {
    super.initState();
    otpNumberController = TextEditingController();
    // initSmsListener();
  }

  @override
  void dispose() {
    otpNumberController.dispose();
    // AltSmsAutofill().unregisterListener();
    super.dispose();
  }

  // String _comingSms = 'Unknown';

  // Future<void> initSmsListener() async {
  //   String comingSms;
  //   try {
  //     comingSms = await AltSmsAutofill().listenForSms;
  //   } on PlatformException {
  //     comingSms = 'Failed to get Sms.';
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     _comingSms = comingSms;
  //     // print("====>Message: ${_comingSms}");
  //     // print("${_comingSms[32]}");
  //     otpNumberController.text = _comingSms[10] +
  //         _comingSms[11] +
  //         _comingSms[12] +
  //         _comingSms[13] +
  //         _comingSms[14] +
  //         _comingSms[
  //             15]; //used to set the code in the message to a string and setting it to a textcontroller. message length is 38. so my code is in string index 32-37.
  //   });
  // }

  Future<bool> _onBackButtonPressed() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => LoginForFDA(),
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
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          body: Container(
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
                        'assets/images/Group_6.png',
                        width: SizeConfig.blockSizeHorizontal * 20,
                        height: SizeConfig.blockSizeVertical * 10,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        SizeConfig.blockSizeVertical * 2,
                        0,
                        0,
                      ),
                      child: Text(
                        'Verfication',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          letterSpacing: 0.2,
                          color: Color(0xFF0B2F45),
                          fontSize: SizeConfig.blockSizeVertical * 3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        SizeConfig.blockSizeHorizontal * 10,
                        SizeConfig.blockSizeVertical * 2,
                        SizeConfig.blockSizeHorizontal * 10,
                        0,
                      ),
                      child: Text(
                        'We have sent OTP to ${widget.mobileNumber}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Color(0xFF0B2F45),
                          letterSpacing: 0.2,
                          fontSize: SizeConfig.blockSizeVertical * 1.8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 8,
                        left: SizeConfig.blockSizeHorizontal * 0,
                        right: SizeConfig.blockSizeHorizontal * 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 100,
                            child: PinCodeTextField(
                                appContext: context,
                                controller: otpNumberController,
                                autoFocus: true,
                                length: 6,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.circle,
                                  activeColor: Color(0xFF0B2F45),
                                  inactiveColor: Color(0xFFF1F4F7),
                                  disabledColor: Colors.black,
                                  selectedColor: Colors.black,
                                  borderRadius: BorderRadius.circular(
                                    0,
                                  ),
                                  fieldHeight: 50,
                                  fieldWidth: 50,
                                ),
                                textStyle: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Color(0xFF0B2F45),
                                  letterSpacing: 0.2,
                                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                                  fontWeight: FontWeight.bold,
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {},
                                validator: (v) {
                                  if (v == null || v.length == 0) {
                                    return "";
                                  } else {
                                    return null;
                                  }
                                },
                                onCompleted: (v) {
                                  otpVerify(v);
                                }),
                          )
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              resendOTP();
                            },
                            child: Text(
                              "Resend OTP?",
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                color: Color(0xFF0B2F45),
                                letterSpacing: 0.2,
                                fontSize: SizeConfig.blockSizeVertical * 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),

                    if (animatOne == true)
                      Container(
                        child: Image.asset(
                          'assets/images/loading.gif',
                          width: SizeConfig.blockSizeHorizontal * 36,
                          height: SizeConfig.blockSizeVertical * 20,
                          fit: BoxFit.cover,
                        ),
                      ),

                    if (animat == true)
                      Container(
                        child: Column(
                          children: [
                            //      AnimatedCheck(
                            //   progress: _animation,
                            //   size: 100,
                            // )
                            SvgPicture.asset(
                              "assets/images/circle-check.svg",
                              width: SizeConfig.blockSizeHorizontal * 16,
                              height: SizeConfig.blockSizeVertical * 6,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Mobile number verified',
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                color: Color(0xFF0B2F45),
                                letterSpacing: 0.2,
                                fontSize: SizeConfig.blockSizeVertical * 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                    // TextButton(
                    //     child:
                    //     onPressed: _animationController.forward),
                    if (animat == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          SizeConfig.blockSizeVertical * 15,
                          0,
                          0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  width: SizeConfig.blockSizeHorizontal * 80,
                                  height: SizeConfig.blockSizeVertical * 8,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xFF07D0F2),
                                        Color(0xFF3F8BFD),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 18),
                                  primary: Colors.white,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              FDADashboardWidget(),
                                      transitionDuration: Duration(
                                        seconds: 0,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'ALL SET. LET’S  GET TRYM’D...!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    letterSpacing: 0.2,
                                    color: Colors.white,
                                    fontSize: SizeConfig.blockSizeVertical * 2,
                                    fontWeight: FontWeight.bold,
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
    });
  }

  //Functions ***************************************************************
  otpVerify(otp) async {
    setState(() {
      animatOne = true;
    });
    var response = await AuthenticationsForFDA()
        .geterifyOTPResponseFDA(widget.userType, otp, widget.mobileNumber);
    print(response);
    if (response['status'] == 1) {
      if (mounted)
        setState(() {
          animatOne = false;
        });
      if (mounted)
        setState(() {
          animat = true;
          storage.setItem("user_type", "fda");
          storage.setItem("fda_id", response['fda_id']);
          // String keyName = (response['vendor_details'].keys).toString();
          // keyName = keyName.replaceAll("(", "");
          // keyName = keyName.replaceAll(")", "");
          // localStorage(response['vendor_details'][keyName],);
        });
    } else {
      if (mounted)
        setState(() {
          animatOne = false;
        });
      _globalWidget.toastMessage('Invalid OTP');
    }
  }

  resendOTP() async {
    var response = await AuthenticationsForFDA()
        .getResendOtpResponseFDA(widget.mobileNumber, widget.userType);
    if (response['status'] == 1) {
      _globalWidget.toastMessage('OTP sent successfully');
    } else {
      _globalWidget.toastMessage('Could not send OTP');
    }
  }

  //Local Storage ***************************************************************
  localStorage(data) {
    storage.setItem("user_type", "fda");
    // if (data['user_type'] == 'professional') {
    //   storage.setItem("vendor_id", data['professional_id'],);
    //   storage.setItem("user_type", data['user_type'],);
    //   storage.setItem("mobile_number", data['professional_mobile'],);
    // } else {
    //   storage.setItem("vendor_id", data['vendor_id'],);
    //   storage.setItem("user_type", data['user_type'],);
    //   storage.setItem("mobile_number", data['mobile_number'],);
    // }
  }
}
