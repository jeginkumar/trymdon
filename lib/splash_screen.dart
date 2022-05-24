import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localstorage/localstorage.dart';
import 'package:trymd_partner/dashboard/dashboard.dart';

// import 'package:trymd_partner/fda_screens/fdahome.dart';
import 'package:trymd_partner/fda_screens/screens/fda_dashboard.dart';
import 'package:trymd_partner/freelancer/freelancer_widget.dart';
import 'package:trymd_partner/get_started/get_started_widget.dart';
import 'package:trymd_partner/sizer.dart';
import 'package:trymd_partner/vendor/vendor_widget.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final LocalStorage storage = new LocalStorage('localstorage_app');
  Timer _timer;
  int _second = 3; // set timer for 3 second and then direct to next page

  void _startTimer() {
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      if (mounted)
        setState(() {
          _second--;
        });
      if (_second == 0) {
        _cancelFlashsaleTimer();
        // storage.setItem("category", []);
        // storage.setItem("speciality", []);
        // storage.setItem("labelsList", []);
        // storage.setItem("serviceList", []);
        // storage.setItem("spData", []);
        // storage.setItem("newList", []);
        // storage.setItem("newListTwo", []);
        // storage.setItem("serviceSPData", []);
        // storage.setItem("servicenewList", []);
        // storage.setItem("servicenewListTwo", []);
        // storage.setItem("localOperationalData", []);
        // storage.setItem("lbCount", 0);
        // storage.setItem("selectedlabelList", []);

        if (storage.getItem("successStatus") != null) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  DashboardScreen(),
              transitionDuration: Duration(
                seconds: 0,
              ),
            ),
          );
        } else if (storage.getItem("user_type") == null) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  GetStartedWidget(),
              transitionDuration: Duration(
                seconds: 0,
              ),
            ),
          );
        } else if (storage.getItem("user_type") != null) {
          if (storage.getItem("user_type") == "vendor") {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    VendorWidget(),
                transitionDuration: Duration(
                  seconds: 0,
                ),
              ),
            );
          } else if (storage.getItem("user_type") == "professional") {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    FreelancerWidget(),
                transitionDuration: Duration(
                  seconds: 0,
                ),
              ),
            );
          } else if (storage.getItem("user_type") == "fda") {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    FDADashboardWidget(),
                transitionDuration: Duration(
                  seconds: 0,
                ),
              ),
            );
          }
        }
      }
    });
  }

  void _cancelFlashsaleTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    super.initState();
    // set status bar color to transparent and navigation bottom color to black21
    SystemChrome.setSystemUIOverlayStyle(
      Platform.isIOS
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.black,
              systemNavigationBarIconBrightness: Brightness.light),
    );
    if (_second != 0) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _cancelFlashsaleTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        body: WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Container(
            color: Colors.white,
            child: Center(
              child: SvgPicture.asset(
                "assets/images/logo_1.svg",
                width: SizeConfig.blockSizeHorizontal * 30,
                height: SizeConfig.blockSizeVertical * 30,
                fit: BoxFit.cover,
              ),

              // Image.asset('assets/images/splashimg.png',),
            ),
          ),
        ),
      );
    });
  }
}
