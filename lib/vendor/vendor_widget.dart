import 'dart:convert';
import 'dart:io';
// import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:trymd_partner/category_select/category_selection.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/repository.dart';
// import 'package:trymd_partner/freelancer/home.dart';
import 'package:trymd_partner/repository/vendorupdate.dart';
import '../global_widget/trymd_partner_theme.dart';
// import '../get_started/get_started_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../sizer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class VendorWidget extends StatefulWidget {
  const VendorWidget({Key key}) : super(key: key);

  @override
  _VendorWidgetState createState() => _VendorWidgetState();
}

class _VendorWidgetState extends State<VendorWidget> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final LocalStorage storage = new LocalStorage('localstorage_app');

  TextEditingController vendorName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController addressOne = TextEditingController();
  TextEditingController addressTwo = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController personName = TextEditingController();
  TextEditingController personDesignation = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String showAvailableContent = "";
  num employeeStrength = 0;
  String selectedYear = "Select Year";
  String currentLocation = "Pin Your Location";
  Position _currentPosition;
  GoogleMapController mapController;
  String facility = "";
  String _currentAddress;
  dynamic namelistoffda;
  List<dynamic> listoffda = [];
  final picker = ImagePicker();
  Future<XFile> pickedFile = Future.value(null);
  List classificationList = [];
  String cityName = "";
  List cityList = [];
  String selectImage = "";
  String cityTown = "";
  List facilityList = [];
  List selectedFacilityList = [];
  List localityList = [];
  String selectedLocality = "";

  @override
  void initState() {
    super.initState();
    finallistfda();
    getClassification();
    getCityList();
    getFacilityList();
    getLocalityList();

    String dd = storage.getItem('vendor_name');
    if (dd != null) {
      vendorName.text = storage.getItem('vendor_name');
      showAvailableContent = storage.getItem('vendor_calssification');
      employeeStrength = storage.getItem('employee_strength');
      description.text = storage.getItem('vendor_description');
      addressOne.text = storage.getItem('address1');
      addressTwo.text = storage.getItem('address2');
      cityTown = storage.getItem('city_town');

      selectedLocality = storage.getItem('locality');
      pinCode.text = storage.getItem('pincode');
      selectedFacilityList = storage.getItem('facility');
      emailId.text = storage.getItem('contact_email');
      contactNumber.text = storage.getItem('contact_mobile');
      personName.text = storage.getItem('contact_person');
      personDesignation.text = storage.getItem('person_designation');
    }
  }

  // Future<bool> _onBackButtonPressed() async {
  // Navigator.pushReplacement(
  //   context,
  //   PageRouteBuilder(
  //     pageBuilder: (context, animation1, animation2) => GetStartedWidget(),
  //     transitionDuration: Duration(seconds: 0,),
  //   ),
  // );
  // return false;
  // }

  DateTime preBackPress = DateTime.now();
  Future<bool> _onBackButtonPressed() async {
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
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                0,
                0,
                0,
                0,
              ),
              child: Text(
                'Vendor',
                style: TextStyle(
                  fontFamily: 'geometric sans-serif',
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          body: Form(
            key: _formkey,
            child: SafeArea(
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
                            SizeConfig.blockSizeHorizontal * 4,
                            SizeConfig.blockSizeVertical * 2,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 0,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'ABOUT YOU',
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                          child: TextFormField(
                            controller: vendorName,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Vendor Name',
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 3,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'VENDOR CLASSIFICATION',
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            // selected: selectedIndex == index ? true : false,
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: classificationList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return classificationName(
                                context,
                                classificationList[index],
                              );
                            }),
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
                              SizeConfig.blockSizeVertical * 2,
                              SizeConfig.blockSizeHorizontal * 3,
                              0,
                            ),
                            child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        'LIST OF FDA',
                                        style: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                ])),
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 4,
                              SizeConfig.blockSizeVertical * 0,
                              SizeConfig.blockSizeHorizontal * 0,
                              0,
                            ),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(color: Colors.white),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: ScrollPhysics(),
                                itemCount: (namelistoffda == null)
                                    ? 0
                                    : namelistoffda.length,
                                itemBuilder: (context, index) {
                                  return listfda(context, index);
                                },
                              ),
                            )),

                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 3,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'EMPLOYEE STRENGTH',
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                  child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (employeeStrength > 0) {
                                          employeeStrength -= 1;
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: SizeConfig.blockSizeHorizontal * 5,
                                      height:
                                          SizeConfig.blockSizeVertical * 2.6,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC7DDFE),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          SizeConfig.blockSizeHorizontal * 1,
                                          SizeConfig.blockSizeVertical * 0.5,
                                          0,
                                          0,
                                        ),
                                        child: FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: Colors.black,
                                          size: SizeConfig.blockSizeVertical *
                                              1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  Text(
                                    employeeStrength.toString(),
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        employeeStrength += 1;
                                      });
                                    },
                                    child: Container(
                                      width: SizeConfig.blockSizeHorizontal * 5,
                                      height:
                                          SizeConfig.blockSizeVertical * 2.6,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF3F8BFD),
                                            Color(0xFF07D0F2)
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(0.94, -1),
                                          end: AlignmentDirectional(-0.94, 1),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: TrymdPartnerTheme.of(context)
                                            .tertiaryColor,
                                        size:
                                            SizeConfig.blockSizeVertical * 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 3,
                            SizeConfig.blockSizeHorizontal * 3,
                            0,
                          ),
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 95,
                            height: SizeConfig.blockSizeVertical * 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              border: Border.all(
                                color: Color(0xFFE5E5E5),
                              ),
                            ),
                            child: Stack(
                              children: [
                                TextFormField(
                                  controller: description,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Description',
                                    hintStyle: TextStyle(color: Colors.black),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                      SizeConfig.blockSizeHorizontal * 4,
                                      SizeConfig.blockSizeVertical * 4,
                                      SizeConfig.blockSizeHorizontal * 4,
                                      SizeConfig.blockSizeVertical * 3,
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2),
                                  maxLines: 20,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 85,
                                    SizeConfig.blockSizeVertical * 1,
                                    0,
                                    0,
                                  ),
                                  child: Icon(
                                    Icons.info_outline,
                                    color: Color(0xFFE5E5E5),
                                    size: SizeConfig.blockSizeVertical * 2.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
                              SizeConfig.blockSizeVertical * 3,
                              SizeConfig.blockSizeHorizontal * 3,
                              0,
                            ),
                            child: Container(
                              height: 50,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  DateTime pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(
                                        1000,
                                      ),
                                      lastDate: DateTime(4000));
                                  if (pickedDate != null) {
                                    print(pickedDate);
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);
                                    print(formattedDate);

                                    setState(() {
                                      selectedYear = formattedDate;
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedYear,
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.8,
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.black,
                                      size: SizeConfig.blockSizeVertical * 3,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 4,
                            SizeConfig.blockSizeVertical * 2,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'IMAGE',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  10,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  '(240 px X 1080 px)',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.6,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 1,
                                    SizeConfig.blockSizeVertical * 0,
                                    0,
                                    0,
                                  ),
                                  child: FutureBuilder<XFile>(
                                    future: pickedFile,
                                    builder: (context, snap) {
                                      if (snap.hasData) {
                                        var s = File(snap.data.path);
                                        var idx = s.toString().split("/");
                                        int dd = idx.length;
                                        selectImage =
                                            idx[dd - 1].replaceAll("'", "");
                                        return Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  35,
                                          height:
                                              SizeConfig.blockSizeVertical * 13,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.file(
                                            File(snap.data.path),
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }
                                      return Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 35,
                                        height:
                                            SizeConfig.blockSizeVertical * 13,
                                        // height: SizeConfig.blockSizeVertical * 70,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/User.png',
                                          fit: BoxFit.contain,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 25,
                                    SizeConfig.blockSizeVertical * 8,
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
                                          1,
                                          1,
                                          0,
                                          0,
                                        ),
                                        child: InkWell(
                                          onTap: () => getgallery(),
                                          child: Icon(
                                            Icons.photo_camera_outlined,
                                            color: Color(0xF2080808),
                                            size: SizeConfig.blockSizeVertical *
                                                3,
                                          ),
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
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 3,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'ADDRESS DETAILS',
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
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
                            width: SizeConfig.blockSizeHorizontal * 95,
                            height: SizeConfig.blockSizeVertical * 6,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F4F7),
                              borderRadius: BorderRadius.circular(39),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 3,
                                0,
                                0,
                                0,
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
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 75,
                                      child: Text(
                                        currentLocation,
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontFamily: 'geometric sans-serif',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.4,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      getCurrentLoacation();
                                    },
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        SizeConfig.blockSizeHorizontal * 5,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: Color(0xFF3F8BFD),
                                        size: SizeConfig.blockSizeVertical * 3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //     padding:
                        //         EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0,),
                        //     child: Container(
                        //       height: SizeConfig.blockSizeVertical * 40,
                        //       width: SizeConfig.blockSizeHorizontal * 90,
                        //       decoration: BoxDecoration(
                        //         color: Color(0XFFFFFFFF),
                        //       ),
                        //       child: GoogleMapWidget(),
                        //     )),
                        // Padding(
                        //   padding:
                        //       EdgeInsetsDirectional.fromSTEB(6, 20, 0, 0,),
                        //   child: Row(
                        //     mainAxisSize: MainAxisSize.max,
                        //     children: [
                        //       Padding(
                        //         padding: EdgeInsetsDirectional.fromSTEB(
                        //             40, 0, 0, 0,),
                        //         child: Container(
                        //           width: SizeConfig.blockSizeVertical * 15,
                        //           height: 1,
                        //           decoration: BoxDecoration(
                        //             color: Color(0xFFEEEEEE),
                        //           ),
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: EdgeInsetsDirectional.fromSTEB(
                        //             10, 0, 0, 0,),
                        //         child: Text(
                        //           'OR',
                        //           style: TextStyle(
                        //             fontFamily: 'geometric sans-serif',
                        //             color: Color(0xFFD9D7D7),
                        //             fontSize: 11,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: EdgeInsetsDirectional.fromSTEB(
                        //             10, 0, 0, 0,),
                        //         child: Container(
                        //           width: SizeConfig.blockSizeVertical * 15,
                        //           height: 1,
                        //           decoration: BoxDecoration(
                        //             color: Color(0xFFEEEEEE),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 3,
                            SizeConfig.blockSizeHorizontal * 3,
                            0,
                          ),
                          child: TextFormField(
                            controller: addressOne,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Address 1',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 2),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 3,
                            0,
                          ),
                          child: TextFormField(
                            controller: addressTwo,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Address 2',
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 2),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
                              SizeConfig.blockSizeVertical * 1.9,
                              SizeConfig.blockSizeHorizontal * 3,
                              0,
                            ),
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 8,
                              width: SizeConfig.blockSizeHorizontal * 95,
                              child: DropdownButtonFormField(
                                  dropdownColor: Colors.white,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(
                                          10.0,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(0xFFE5E5E5),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  items: localityList.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item['locality'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily:
                                                  'geometric sans-serif',
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2)),
                                      value: item['locality'].toString(),
                                    );
                                  }).toList(),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconEnabledColor: Colors.black,
                                  isExpanded: true,
                                  onChanged: (newVal) {
                                    setState(() {
                                      selectedLocality = newVal;
                                    });
                                  },
                                  value: selectedLocality,
                                  style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2)),
                            )),
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 3,
                              SizeConfig.blockSizeVertical * 1.9,
                              SizeConfig.blockSizeHorizontal * 3,
                              0,
                            ),
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 8,
                              width: SizeConfig.blockSizeHorizontal * 95,
                              child: DropdownButtonFormField(
                                  dropdownColor: Colors.white,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(
                                          10.0,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(0xFFE5E5E5),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  items: cityList.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item['city'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily:
                                                  'geometric sans-serif',
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2)),
                                      value: item['city'].toString(),
                                    );
                                  }).toList(),
                                  onChanged: (newVal) {
                                    setState(() {
                                      cityName = newVal;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconEnabledColor: Colors.black,
                                  value: cityName,
                                  isExpanded: true,
                                  style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2)),
                            )),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 3,
                            0,
                          ),
                          child: TextFormField(
                            controller: pinCode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Pincode',
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 2),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'FACILITIES AVAILABLE',
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 2,
                            SizeConfig.blockSizeVertical * 0.5,
                            0,
                            0,
                          ),
                          // child: Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          child: Container(
                            // height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: facilityList.length,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio:
                                    (MediaQuery.of(context).size.width / 2) /
                                        (MediaQuery.of(context).size.height /
                                            20),
                                crossAxisSpacing: 6.0,
                                mainAxisSpacing: 10.0,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return facilityWidget(
                                  facilityList[index],
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  'CONTACT DETAILS',
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 3,
                            SizeConfig.blockSizeHorizontal * 3,
                            0,
                          ),
                          child: TextFormField(
                            controller: emailId,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email ID',
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 3,
                            0,
                          ),
                          child: TextFormField(
                            controller: contactNumber,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(
                                10,
                              ),
                            ],
                            decoration: InputDecoration(
                              labelText: 'Contact Number',
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 3,
                            0,
                          ),
                          child: TextFormField(
                            controller: personName,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Person Name',
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 3,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 3,
                            0,
                          ),
                          child: TextFormField(
                            controller: personDesignation,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Person Designation',
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            SizeConfig.blockSizeHorizontal * 75,
                            SizeConfig.blockSizeVertical * 5,
                            0,
                            0,
                          ),
                          child: TextButton(
                            onPressed: () {
                              updateVendor();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'NEXT',
                                  style: TrymdPartnerTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'geometric sans-serif',
                                        color: Color(
                                          0xFF000000,
                                        ),
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2.5,
                                        fontWeight: FontWeight.w700,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.longArrowAltRight,
                                  color: Color(
                                    0xFF000000,
                                  ),
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget classificationName(context, data) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        SizeConfig.blockSizeHorizontal * 4,
        SizeConfig.blockSizeVertical * 1.4,
        SizeConfig.blockSizeHorizontal * 4,
        0,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            // selectedIndex = index;
            if (showAvailableContent.length == 0 ||
                showAvailableContent != data['vendor_classification']) {
              showAvailableContent = data['vendor_classification'];
            } else if (showAvailableContent == data['vendor_classification']) {
              showAvailableContent = "";
            }
          });
        },
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 95,
          height: SizeConfig.blockSizeVertical * 7,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: showAvailableContent == data['vendor_classification']
                  ? [Color(0xFF0085FF), Color(0xFF07D0F2)]
                  : [Colors.white, Colors.white],
              stops: [0, 1],
              begin: AlignmentDirectional(1, 1),
              end: AlignmentDirectional(
                0,
                0,
              ),
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
            border: Border.all(
              color: Color(0xFFE5E5E5),
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              SizeConfig.blockSizeHorizontal * 5,
              SizeConfig.blockSizeVertical * 2,
              0,
              0,
            ),
            child: Text(
              data["vendor_classification"],
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'geometric sans-serif',
                color: showAvailableContent == data['vendor_classification']
                    ? Colors.white
                    : Colors.black,
                fontSize: SizeConfig.blockSizeVertical * 1.7,
                // fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget facilityWidget(data) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedFacilityList.contains(data["facility"]) == true) {
            selectedFacilityList.remove(
              data["facility"],
            );
            // selectcount = selectedFacilityList.length;
          } else if (selectedFacilityList.contains(data["facility"]) == false) {
            selectedFacilityList.add(
              data["facility"],
            );
            // selectcount = selectedFacilityList.length;
          }
        });
        print(selectedFacilityList);
        // print(selectcount);
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              40,
              0,
              0,
              0,
            ),
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: selectedFacilityList.contains(data["facility"])
                      ? Color(0xFF3F8BFD)
                      : Color(0xFFE5E5E5),
                  // color: Color(0xFF3F8BFD),
                  width: 1,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              10,
              0,
              0,
              0,
            ),
            child: Text(
              data["facility"],
              style: TrymdPartnerTheme.of(context).bodyText1.override(
                    fontFamily: 'geometric sans-serif',
                    useGoogleFonts: false,
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeVertical * 1.9,
                    fontWeight: selectedFacilityList.contains(data["facility"])
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  // Functions *************************************************************************************************

  getCurrentLoacation() async {
    print("Get Current location");
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    print(permission.toString());
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 14.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {
      print('Error: ' + e.toString());
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      print(p);
      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
      });
      print(_currentAddress);
      setState(() {
        currentLocation = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  void getgallery() async {
    try {
      pickedFile = picker.pickImage(source: ImageSource.gallery);
      // pickedFile = picker.getImage(
      //   source: ImageSource.gallery,
      // );
      setState(() {});
    } catch (e) {
      return e;
    }
  }

  getClassification() async {
    // classification
    var classificationResponse =
        await VendorClassificationGet().getClassification();
    if (classificationResponse['status'] == 1) {
      classificationList = classificationResponse['data'];
    }
    setState(() {});
  }

  getCityList() async {
    // city
    var cityResponse = await VendorClassificationGet().getCity();
    if (cityResponse['status'] == 1) {
      cityList = cityResponse['data'];
      cityName = cityList[0]['city'];
    }
    setState(() {});
  }

  getFacilityList() async {
    // facility
    var facilityResponse = await VendorClassificationGet().getFacility();
    if (facilityResponse['status'] == 1) {
      facilityList = facilityResponse['data'];
    }
    setState(() {});
  }

  getLocalityList() async {
    // locality
    var localityResponse = await VendorClassificationGet().getLocality();
    if (localityResponse['status'] == 1) {
      localityList = localityResponse['data'];
      selectedLocality = localityList[0]['locality'];
    }
    setState(() {});
  }

  updateVendor() async {
    if (_formkey.currentState.validate()) {
      if (showAvailableContent.length == 0) {
        _globalWidget.toastMessage("Please select vendor classification");
      } else if (selectedYear.length == 0) {
        _globalWidget.toastMessage("Please select year");
      } else if (selectedFacilityList.length == 0) {
        _globalWidget.toastMessage("Please select facility");
      } else {
        var json = jsonEncode({
          "vendor_name": vendorName.text,
          "vendor_calssification": showAvailableContent,
          "employee_strength": employeeStrength,
          "vendor_description": description.text,
          "vendor_image": selectImage,
          "pin_location": currentLocation,
          "address1": addressOne.text,
          "address2": addressTwo.text,
          "city_town": cityTown,
          "locality": selectedLocality,
          "pincode": pinCode.text,
          "facility": selectedFacilityList,
          "vendor_code": "BT-1",
          "user_type": "vendor",
          "contact_email": emailId.text,
          "contact_mobile": contactNumber.text,
          "contact_person": personName.text,
          "person_designation": personDesignation.text,
          "disabled": ""
        });
        print(json);
        var response = await VendorClassificationGet().updateVendorInfo(json);
        print(response);
        if (response['status'] == 1) {
          storage.setItem('vendor_name', vendorName.text);
          storage.setItem('vendor_calssification', showAvailableContent);
          storage.setItem('employee_strength', employeeStrength);
          storage.setItem('vendor_description', description.text);
          storage.setItem('address1', addressOne.text);
          storage.setItem('address2', addressTwo.text);
          storage.setItem('city_town', cityTown);

          storage.setItem('locality', selectedLocality);
          storage.setItem('pincode', pinCode.text);
          storage.setItem('facility', selectedFacilityList);
          storage.setItem('contact_email', emailId.text);
          storage.setItem('contact_mobile', contactNumber.text);
          storage.setItem('contact_person', personName.text);
          storage.setItem('person_designation', personDesignation.text);

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  CategorySelectionWidget(vendorType: "vendor"),
              transitionDuration: Duration(
                seconds: 0,
              ),
            ),
          );
        } else {
          _globalWidget.toastMessage(
              'Could not update your details.\n Please Contact admin');
        }
      }
    }
  }

  Widget listfda(context, index) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFF1F4F7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          namelistoffda[index]["image"],
                        ).image,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 6, 0, 0),
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Color(0xFF468630),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Text(
                namelistoffda[index]["nameoffda"],
                style: TextStyle(
                  fontFamily: 'geometric sans-serif',
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  finallistfda() async {
    var response = Listoffda();
    Map<String, dynamic> value = await response.fdalist();
    namelistoffda = value["listoffda"];
    print('Access Control: ' + namelistoffda.toString());
    setState(() {});
  }
}
