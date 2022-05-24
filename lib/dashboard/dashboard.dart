import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:trymd_partner/SplashScreen.dart';
import 'package:trymd_partner/dashboard/my_profile.dart';
import 'package:trymd_partner/dashboard/access.dart';
// import 'package:trymd_partner/dashboard/expand.dart';
import 'package:trymd_partner/dashboard/new_my_profile.dart';
// import 'package:trymd_partner/dashboard/expand.dart';
// import 'package:trymd_partner/dashboard/accesscontrol.dart';
import 'package:trymd_partner/dashboard/pro_walkthrough.dart';
import 'package:trymd_partner/dashboard/professionalhome.dart';
import 'package:trymd_partner/dashboard/view_fda.dart';
import 'package:trymd_partner/get_started/get_started_widget.dart';
// import 'package:trymd_partner/global_widget/trymd_partner_theme.dart';
// import 'package:trymd_partner/main.dart';
// import 'package:trymd_partner/trymd_flow/trymd_theme.dart' as tt;

import '../fda_registration/fda_registration.dart';
import '../sizer.dart';
// import 'expand.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  final scaffoldKey = GlobalKey<ScaffoldState>();
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  bool generalTabActive = true;
  bool dynamicTabActive = false;
  bool sliverTabActive = false;
  int selectedIndex = 0;
  List screens = [
    ProfessionalDashBoardPage(),
    AccessControlWidget(),
    PartnerProfileWidget(),
    MyProfileWidget(),
  ];

  @override
  void initState() {
    super.initState();
  }

  DateTime preBackPress = DateTime.now();

  Future<bool> onBackButtonPressed() async {
    final timegap = DateTime.now().difference(preBackPress);
    final cantExit = timegap >= Duration(seconds: 2);
    preBackPress = DateTime.now();
    if (cantExit) {
      //show snackbar
      final snack = SnackBar(
        content: Text('Press Back again to Exit'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }

  void updateIndex(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return WillPopScope(
        onWillPop: onBackButtonPressed,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                scaffoldKey.currentState.openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Color.fromARGB(255, 12, 90, 192),
                size: SizeConfig.blockSizeVertical * 4,
              ),
            ),
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                0,
                0,
                0,
                0,
              ),
              child: Text(
                "TRYM'D",
                style: TextStyle(
                  fontFamily: 'geometric sans-serif',
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeVertical * 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          drawer: drawerMenu(context, storage),
          body: Center(child: screens.elementAt(selectedIndex)),
          //      Text(
          //   "COMING SOON",
          //   style: TextStyle(
          //     fontFamily: 'geometric sans-serif',
          //     color: Colors.grey[300],
          //     fontSize: SizeConfig.blockSizeVertical * 2,
          //     fontWeight: FontWeight.bold,
          //   ),
          // )),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 16,
                  spreadRadius: 0,
                  offset: Offset(
                    0,
                    0,
                  ),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: GNav(
                  hoverColor: Colors.grey[100],
                  color: Colors.black,
                  activeColor: Color(0XFF3F8BFD),
                  gap: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                  tabBackgroundColor: Colors.grey[100],
                  rippleColor: Colors.grey[300],
                  iconSize: 24,
                  tabs: const [
                    GButton(icon: Icons.home, text: 'HOME'),
                    GButton(icon: Icons.lock, text: 'FDA ACCESS'),
                    GButton(icon: Icons.book_online, text: 'BOOKINGS'),
                    GButton(icon: Icons.person, text: 'PROFILE'),
                  ],
                  selectedIndex: selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

Widget drawerMenu(BuildContext context, storage) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color(0XFF3F8BFD),
          ),
          accountName: Text("Trym'd Partner"),
          accountEmail: Text("partner@trymd.in"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Color(0XFF3F8BFD),
            child: Text(
              "P",
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
          ),
          otherAccountsPictures: [
            CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Color(0XFF3F8BFD),
              child: Text(
                "A",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Color(0XFF3F8BFD),
              child: Text(
                "B",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
        ListTile(
          title: Text('FDA Registration'),
          leading: Icon(Icons.person_add),
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    FDARegistrationScreen(),
                transitionDuration: Duration(
                  seconds: 0,
                ),
              ),
            );
          },
        ),
        ListTile(
          title: Text('View FDA Registration'),
          leading: Icon(Icons.settings_applications),
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    ViewFDAWidget(),
                transitionDuration: Duration(
                  seconds: 0,
                ),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Quick Walkthrough'),
          leading: Icon(Icons.nordic_walking),
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    ProfessionalWalkthrough(),
                transitionDuration: Duration(
                  seconds: 0,
                ),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Log out'),
          leading: Icon(Icons.logout),
          onTap: () {
            storage.clear();
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
          },
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.grey,
          indent: 20,
          endIndent: 20,
          thickness: 2.0,
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          title: Text('About Us'),
          leading: Icon(Icons.info),
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    FDARegistrationScreen(),
                transitionDuration: Duration(
                  seconds: 0,
                ),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Privacy Policy'),
          leading: Icon(Icons.privacy_tip),
          onTap: () {
            // URL Navigation should be added here
            //  https://trymd.in/privacy-policy.html
          },
        ),
        ListTile(
          title: Text('Terms of Use'),
          leading: Icon(Icons.new_releases),
          onTap: () {
            // URL Navigation should be added here
            //  https://trymd.in/terms-of-use.html
          },
        ),
        ListTile(
          title: Text('Contact Us'),
          leading: Icon(Icons.contact_page),
          onTap: () {
            // URL Navigation should be added here
            //  https://trymd.in/contact-us.html
          },
        ),
        ListTile(
          title: Text('FAQ'),
          leading: Icon(Icons.question_answer),
          onTap: () {
            // URL Navigation should be added here
            //  https://trymd.in/faq.html
          },
        ),
        ListTile(
          title: Text(
            'Version : 1.0.0',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
