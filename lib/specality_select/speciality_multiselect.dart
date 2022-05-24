import 'package:localstorage/localstorage.dart';
import 'package:trymd_partner/accountsetup/colorLoader.dart';
import 'package:trymd_partner/category_select/category_selection.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/label_select/labels_selection.dart';
import 'package:trymd_partner/repository/selections.dart';
import 'package:trymd_partner/sizer.dart';
import '../global_widget/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cached_image.dart';

class SpecialityMultiSelect extends StatefulWidget {
  final vendorType;
  SpecialityMultiSelect({
    this.vendorType,
  });

  @override
  _SpecialityMultiSelectState createState() => _SpecialityMultiSelectState();
}

class _SpecialityMultiSelectState extends State<SpecialityMultiSelect> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final LocalStorage storage = new LocalStorage('localstorage_app');

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> specialtylist = [];
  List selectedSpeciality = [];
  List specialityLis = [];
  String catId = "";

  Future<bool> _onBackButtonPressed() async {
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
    return false;
  }

  @override
  void initState() {
    super.initState();
    catId = storage.getItem("selected_cat_id");
    List dummyData = storage.getItem("speciality");
    if (dummyData != null) {
      specialtylist = dummyData;
      if (storage.getItem("selectedSpList") != null) {
        selectedSpeciality = storage.getItem("selected_spe_id");
      }
    }
    specialityFunction();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return WillPopScope(
        onWillPop: _onBackButtonPressed,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
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
              },
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xFF0D0D0D),
                size: SizeConfig.blockSizeVertical * 5,
              ),
            ),
            title: Text(
              'Speciality Selection',
              style: TextStyle(
                fontFamily: 'geometric sans-serif',
                color: Colors.black,
                fontSize: SizeConfig.blockSizeVertical * 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: SizeConfig.blockSizeVertical * 7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
                                SizeConfig.blockSizeHorizontal * 2,
                                0,
                                0,
                                0,
                              ),
                              child: Text(
                                'Select your Speciality',
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: SizeConfig.blockSizeVertical * 60,
                  decoration: BoxDecoration(
                    color: TrymdPartnerTheme.of(context).tertiaryColor,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (specialtylist.length == 0)
                          Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.2),
                              child: ColorLoader()),
                        Padding(
                            padding: EdgeInsets.fromLTRB(
                              SizeConfig.blockSizeHorizontal * 2.6,
                              SizeConfig.blockSizeVertical * 2,
                              0,
                              0,
                            ),
                            child: GridView.builder(
                              shrinkWrap: true,
                              primary: true,
                              physics: ScrollPhysics(),
                              itemCount: specialtylist.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 2.0,
                                childAspectRatio:
                                    (MediaQuery.of(context).size.width / 10) /
                                        (MediaQuery.of(context).size.height /
                                            20),
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return containerWidget(
                                  context,
                                  specialtylist[index],
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height:SizeConfig.blockSizeVertical * 3),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFF1F4F7),
                ),
                Container(
                  width: double.infinity,
                  height: SizeConfig.blockSizeVertical * 22,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          SizeConfig.blockSizeHorizontal * 5,
                          SizeConfig.blockSizeVertical * 1,
                          0,
                          0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // Text(
                                //   '3/10 Selected',
                                //   style: TrymdPartnerTheme.of(context)
                                //       .bodyText1
                                //       .override(
                                //         fontFamily: 'Harmonia Sans W01 Bold',
                                //         color: Colors.black,
                                //         fontWeight: FontWeight.bold,
                                //         useGoogleFonts: false,
                                //       ),
                                // ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    SizeConfig.blockSizeHorizontal * 2,
                                    SizeConfig.blockSizeVertical * 1,
                                    0,
                                    0,
                                  ),
                                  child: Text(
                                    'Note : Selected Specialities will be presented in your',
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Speciality Selection',
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                            moveToNext();
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
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: SizeConfig.blockSizeVertical * 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget containerWidget(context, data) {
    return InkWell(
      onTap: () {
        setState(() {
          if (selectedSpeciality.contains(data["speciality_id"]) == true) {
            selectedSpeciality.remove(
              data["speciality_id"],
            );
            storage.setItem("selectedSpList", selectedSpeciality);
          } else if (selectedSpeciality.contains(data["speciality_id"]) ==
              false) {
            selectedSpeciality.add(
              data["speciality_id"],
            );
            storage.setItem("selectedSpList", selectedSpeciality);
          }
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              SizeConfig.blockSizeHorizontal * 1.8,
              0,
              0,
              SizeConfig.blockSizeVertical * 0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.6,
              height: MediaQuery.of(context).size.height * 0.12,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 0.6,
                      SizeConfig.blockSizeVertical * 1,
                      0,
                      0,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.24,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: Image.asset(
                        //     data["speimage"],
                        //   ).image,
                        // ),
                        borderRadius: BorderRadius.circular(6),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color:
                              selectedSpeciality.contains(data["speciality_id"])
                                  ? Color(0xFFFE418A)
                                  : Color(0xFFF1F4F7),
                          width: 1,
                        ),
                      ),
                      child: CustomCacheImage(
                        imageUrl: data["speciality_image"],
                        radius: 3.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 20.6,
                      0,
                      0,
                      SizeConfig.blockSizeVertical * 0,
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.solidCircle,
                      color: selectedSpeciality.contains(data["speciality_id"])
                          ? Color(0xFFFE418A)
                          : Colors.transparent,
                      size: SizeConfig.blockSizeVertical * 2.4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 21,
                      SizeConfig.blockSizeVertical * 0.12,
                      0,
                      0,
                    ),
                    child: Icon(
                      Icons.check_sharp,
                      color: selectedSpeciality.contains(data["speciality_id"])
                          ? Color(0xFFFFFFFF)
                          : Colors.transparent,
                      size: SizeConfig.blockSizeVertical * 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              0,
              SizeConfig.blockSizeVertical * 0,
              0,
              0,
            ),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.24,
                height: MediaQuery.of(context).size.height * 0.03,
                child: Text(
                  data["speciality_name"],
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeVertical * 1.4,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ],
      ),
    );
  }

// Function **********************************************************************************************************

  specialityFunction() async {
    var response =
        await VendorSelectedCategories().getSpecialityResponse(catId);
    if (response['status'] == 1) {
      specialtylist = response["result"];
      storage.setItem(
        "speciality",
        response["result"],
      );
      print(specialtylist);
    } else {
      specialtylist = [];
      storage.setItem(
        "speciality",
        [],
      );
    }
    setState(() {});
  }

  moveToNext() async {
    if (selectedSpeciality.length == 0) {
      _globalWidget.toastMessage('Please select atleast one speciality');
    } else {
      storage.setItem("selected_spe_id", selectedSpeciality);
      storage.setItem("selectedSpList", selectedSpeciality);
      specialtylist.forEach((element) {
        element['isSelected'] = false;
      });

      selectedSpeciality.forEach((element1) {
        specialtylist.forEach((element2) {
          if (element1 == element2['speciality_id']) {
            element2['isSelected'] = true;
          }
        });
      });

      storage.setItem("selectedSpecialtyAllItems", specialtylist);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              LabelsSelectionWidget(
            vendorType: "vendor",
          ),
          transitionDuration: Duration(
            seconds: 0,
          ),
        ),
      );
    }
  }
}
