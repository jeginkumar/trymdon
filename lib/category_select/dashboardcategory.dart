// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:trymd_partner/dashboard/dashboard.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/repository/selections.dart';
import 'package:trymd_partner/sizer.dart';
import 'package:trymd_partner/specality_select/cached_image.dart';
import 'package:trymd_partner/specality_select/speciality_multiselect.dart';
import 'package:trymd_partner/specality_select/speciality_selection_widget.dart';
// import 'package:trymd_partner/vendor/vendor_widget.dart';
import '../global_widget/trymd_partner_theme.dart';
// import '../freelancer/freelancer_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DashboardCategoryWidget extends StatefulWidget {
  final vendorType;
  DashboardCategoryWidget({this.vendorType});

  @override
  _DashboardCategoryWidgetState createState() =>
      _DashboardCategoryWidgetState();
}

class _DashboardCategoryWidgetState extends State<DashboardCategoryWidget> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final LocalStorage storage = new LocalStorage('localstorage_app');
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> categorylist = [];
  dynamic selectedCategoryId = "";
  List like = [];
  bool selected = false;

  @override
  void initState() {
    super.initState();
    List data = storage.getItem("category");
    if (data.length != 0) {
      categorylist = data;
      selectedCategoryId = storage.getItem("selected_cat_id");
    }
    categories();
  }

  @override
  void dispose() {
    super.dispose();
    categories();
  }

  Future<bool> _onBackButtonPressed() async {
    if (widget.vendorType == "professional") {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => DashboardScreen(),
          transitionDuration: Duration(
            seconds: 0,
          ),
        ),
      );
    } else if (widget.vendorType == "vendor") {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => DashboardScreen(),
          transitionDuration: Duration(
            seconds: 0,
          ),
        ),
      );
    }

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
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
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
                  Icons.keyboard_arrow_left,
                  color: Color(0xFF0D0D0D),
                  size: SizeConfig.blockSizeVertical * 3,
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
                  'Category Selection',
                  style: TrymdPartnerTheme.of(context).bodyText1.override(
                        fontFamily: 'geometric sans-serif',
                        color: Color(
                          0xFF000000,
                        ),
                        fontSize: SizeConfig.blockSizeVertical * 2,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0,
            ),
            backgroundColor: Color(0xFFF5F5F5),
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
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
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
                                'Select your Profession',
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
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                            SizeConfig.blockSizeHorizontal * 2,
                            SizeConfig.blockSizeVertical * 2,
                            SizeConfig.blockSizeHorizontal * 2,
                            0,
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: categorylist.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 6.0,
                              // childAspectRatio:
                              //     (MediaQuery.of(context).size.width / 2) /
                              //         (MediaQuery.of(context).size.height / 10,),
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return categoriesList(
                                context,
                                categorylist[index],
                              );
                            },
                          )),
                      // Padding(
                      //     padding: EdgeInsetsDirectional.fromSTEB(
                      //         SizeConfig.blockSizeHorizontal * 75,
                      //         SizeConfig.blockSizeVertical * 0,
                      //         0,
                      //         0,),
                      //     child: InkWell(
                      //         onTap: () async {
                      //           await Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) =>
                      //                   SpecialityMultiSelect(),
                      //             ),
                      //           );
                      //         },
                      //         child: Container(
                      //           width: double.infinity,
                      //           height: 30,
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //           ),
                      //         ),),),
                      // Padding(
                      //     padding: EdgeInsets.fromLTRB(
                      //         SizeConfig.blockSizeHorizontal * 75,
                      //         SizeConfig.blockSizeVertical * 5,
                      //         0,
                      //         0,),
                      //     child: TextButton(
                      //         onPressed: () {
                      //           moveToNext();
                      //         },
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.end,
                      //           children: [
                      //             Text(
                      //               'NEXT',
                      //               style: TrymdPartnerTheme.of(context)
                      //                   .bodyText1
                      //                   .override(
                      //                     fontFamily: 'geometric sans-serif',
                      //                     color: Color(0xFF000000,),
                      //                     fontSize:
                      //                         SizeConfig.blockSizeVertical *
                      //                             2.5,
                      //                     fontWeight: FontWeight.w700,
                      //                     useGoogleFonts: false,
                      //                   ),
                      //             ),
                      //             SizedBox(width: 10,),
                      //             FaIcon(
                      //               FontAwesomeIcons.longArrowAltRight,
                      //               color: Color(0xFF000000,),
                      //               size: SizeConfig.blockSizeVertical * 2.5,
                      //             ),
                      //           ],
                      //         ),),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ));
    });
  }

  Widget categoriesList(context, data) {
    return InkWell(
      onTap: () {
        setState(() {
          if (selectedCategoryId == data["category_id"]) {
            selectedCategoryId = "";
          } else if (selectedCategoryId != data["category_id"]) {
            selectedCategoryId = data["category_id"];
          }
          print(selectedCategoryId);
          storage.setItem("selected_cat_id", selectedCategoryId);
        });
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: HexColor(data['color']),
              // gradient: LinearGradient(
              //   colors: selectedCategoryId == data["category_id"]
              //       ? [Color(0xFF3F8BFD), Color(0xFF07D0F2)]
              //       : [Colors.white, Colors.white],
              //   stops: [0, 1],
              //   begin: AlignmentDirectional(1, -1),
              //   end: AlignmentDirectional(-1, 1),
              // ),
              border: Border.all(
                width: SizeConfig.blockSizeVertical * 0.01,
                // color: selectedCategoryId == data["category_id"]
                //     ? Color(0xFFFE418A)
                //     : Color(0XFFE5E5E5)
                // color: Color(0XFFE5E5E5)
                // color: selectedCategoryId == data["category_id"]
                //     ? Color(0xFF00000000)
                //     : Color(0XFFE5E5E5)
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                0,
                SizeConfig.blockSizeVertical * 0.5,
                0,
                0,
              ),
              child: Row(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.14,
                      width: MediaQuery.of(context).size.height * 0.08,
                      child: CustomCacheImage(
                          imageUrl: data["category_image"], radius: 3.0)),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.0066),
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.height * 0.112,
                    child: Center(
                        child: Text(
                      data["category_name"].toUpperCase(),
                      textAlign: TextAlign.start,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TrymdPartnerTheme.of(context).bodyText1.override(
                            fontFamily: 'geometric sans-serif',
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 1.4,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    )),
                  )
                ],
              ),
            ),
          )),
          if (selectedCategoryId == data["category_id"])
            Icon(
              Icons.check_circle_sharp,
              color: Colors.red,
              size: SizeConfig.blockSizeVertical * 3,
            ),
        ],
      ),
    );
  }

  // Functions **************************************************************************

  categories() async {
    var response = await VendorSelectedCategories().getCategoryResponse();
    if (response['status'] == 1) {
      categorylist = response["result"];
      storage.setItem(
        "category",
        response["result"],
      );
    }
    setState(() {});
  }

  moveToNext() async {
    if (selectedCategoryId == null ||
        selectedCategoryId.length == 0 ||
        selectedCategoryId.isEmpty) {
      _globalWidget.toastMessage('Please select atleast one category');
    } else {
      print(categorylist);
      categorylist.forEach((element) {
        if (element['category_id'] == selectedCategoryId) {
          element['isSelected'] = true;
        } else {
          element['isSelected'] = false;
        }
      });
      storage.setItem("selectedCategoryAllItems", categorylist);
      if (widget.vendorType == "professional") {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                SpecialitySelectionWidget(
              vendorType: "professional",
            ),
            transitionDuration: Duration(
              seconds: 0,
            ),
          ),
        );
      } else if (widget.vendorType == "vendor") {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                SpecialityMultiSelect(
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
}
