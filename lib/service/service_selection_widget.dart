import 'dart:convert';
// import 'package:accordion/accordion.dart';
// import 'package:accordion/controllers.dart';
import 'package:localstorage/localstorage.dart';
import 'package:trymd_partner/accountsetup/colorLoader.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/global_widget/trymd_partner_drop_down.dart';
import 'package:trymd_partner/label_select/labels_selection.dart';
import 'package:trymd_partner/operation_details/operational_details.dart';
import 'package:trymd_partner/repository/selections.dart';
import 'package:trymd_partner/repository/vendorupdate.dart';
import 'package:trymd_partner/sizer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_select_item/multi_select_item.dart';
// import 'package:uuid/uuid.dart';
// import 'package:uuid/uuid_util.dart';
import 'dart:math';

class ServiceSelectionWidget extends StatefulWidget {
  final vendorType;
  ServiceSelectionWidget({this.vendorType});

  @override
  _ServiceSelectionWidgetState createState() => _ServiceSelectionWidgetState();
}

class _ServiceSelectionWidgetState extends State<ServiceSelectionWidget> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final LocalStorage storage = new LocalStorage('localstorage_app');
  final scaffoldKey = GlobalKey<ScaffoldState>();
  MultiSelectController controller = new MultiSelectController();
  int selecting;
  List selectedService = [];
  int allservicecount = 0;
  int selectcount = 0;
  String servicename = "";
  final TextEditingController _filter = new TextEditingController();
  List names = []; // names we get from API
  List filteredNames = []; // names filtered by search text
  bool isSelected = false;
  List<dynamic> allService = [];
  TextEditingController textController;
  Icon cicon = Icon(Icons.search);
  String catId = "";
  List speId = [];
  List newList = [];
  List newListTwo = [];
  List<dynamic> labelsList = [];
  List<dynamic> spData = [];
  String specialtyIdDP = "";
  List allSpeides = [];
  dynamic uuid;
  List<dynamic> dumss = [];
  List<dynamic> serviceList = [];
  List<String> namesList = [];
  List<Widget> filterChips = [];
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    catId = storage.getItem("selected_cat_id");
    speId = storage.getItem("selected_spe_id");
    labelsList = storage.getItem("selectedlabelList");
    List dummyData = storage.getItem("serviceList");
    if (dummyData != null) {
      // spData = storage.getItem("serviceSPData");

      dumss = dummyData;
      // if (storage.getItem("namesList") != null) {
      //   namesList = storage.getItem("namesList");
      // }
      if (storage.getItem("selectedlservicesList") != null) {
        selectedService = storage.getItem("selectedlservicesList");
      }
      allservicecount = storage.getItem("allservicecount");
    }
    if (storage.getItem("sbCount") != null) {
      selectcount = selectedService.length + newList.length;
    }
    if (storage.getItem("servicenewList") != null) {
      newList = storage.getItem("servicenewList");
    }

    if (storage.getItem("servicenewListTwo") != null) {
      newListTwo = storage.getItem("servicenewListTwo");
    }

    serviceOnLoad();
  }

  dynamic csearchbar = Padding(
      padding: EdgeInsets.only(left: 16),
      child: Text(
        "Service Selection",
        style: TextStyle(
          fontFamily: 'geometric sans-serif',
          fontSize: SizeConfig.blockSizeVertical * 3,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ));

  Future<bool> _onBackButtonPressed() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => LabelsSelectionWidget(
          vendorType: widget.vendorType,
        ),
        transitionDuration: Duration(
          seconds: 0,
        ),
      ),
    );
    return false;
  }

  String generateRandomString(int length) {
    final _random = Random();
    const _availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length,
            (index) => _availableChars[_random.nextInt(_availableChars.length)])
        .join();

    return randomString;
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
                        LabelsSelectionWidget(vendorType: widget.vendorType),
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
            title: csearchbar,
            actions: [
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    0,
                    0,
                    0,
                    0,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (this.cicon.icon == Icons.search) {
                          this.cicon = Icon(Icons.cancel);
                          this.csearchbar = TextField(
                              onChanged: (value) => searchfilter(value),
                              controller: _filter,
                              decoration: InputDecoration(
                                hintText: 'Service selection',
                              ),
                              textInputAction: TextInputAction.go,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 2));
                        } else {
                          this.cicon = Icon(Icons.search);
                          this.csearchbar = Padding(
                            padding: EdgeInsets.only(
                              left: 40,
                            ),
                            child: Text(
                              "Service Selection",
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                fontSize: SizeConfig.blockSizeVertical * 3,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                          _filter.clear();
                        }
                      });
                    },
                    icon: cicon,
                    color: Colors.black,
                    iconSize: SizeConfig.blockSizeVertical * 3,
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    0,
                    0,
                    SizeConfig.blockSizeHorizontal * 3,
                    0,
                  ),
                  child: PopupMenuButton(
                    offset: Offset(
                      0,
                      40,
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0)),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  SizeConfig.blockSizeVertical * 3,
                                  0,
                                  0,
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Filter By',
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2,
                                      color: Color(0XFF3F8BFD),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  5,
                                  0,
                                  0,
                                ),
                                child: Divider(
                                  height: 6,
                                  thickness: 2,
                                  indent: 5,
                                  endIndent: 5,
                                  color: Color(0xFFF1F4F7),
                                )),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                5,
                                5,
                                0,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        allService.sort((a, b) {
                                          //sorting in ascending order
                                          print(b);
                                          return a["servicename"].compareTo(
                                            b["servicename"],
                                          );
                                        });
                                      });
                                    },
                                    child: Text(
                                      'Sort A-Z',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      0,
                                      5,
                                      0,
                                    ),
                                    child: FaIcon(
                                      FontAwesomeIcons.longArrowAltDown,
                                      color: Colors.black,
                                      size: SizeConfig.blockSizeVertical * 2.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  5,
                                  0,
                                  0,
                                ),
                                child: Divider(
                                  height: 6,
                                  thickness: 2,
                                  indent: 5,
                                  endIndent: 5,
                                  color: Color(0xFFF1F4F7),
                                )),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                5,
                                5,
                                0,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        allService.sort((a, b) {
                                          //sorting in ascending order
                                          print(b);
                                          return b["servicename"].compareTo(
                                            a["servicename"],
                                          );
                                        });
                                      });
                                    },
                                    child: Text(
                                      'Sort Z-A',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      0,
                                      5,
                                      0,
                                    ),
                                    child: FaIcon(
                                      FontAwesomeIcons.longArrowAltUp,
                                      color: Colors.black,
                                      size: SizeConfig.blockSizeVertical * 2.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  5,
                                  0,
                                  0,
                                ),
                                child: Divider(
                                  height: 6,
                                  thickness: 2,
                                  indent: 5,
                                  endIndent: 5,
                                  color: Color(0xFFF1F4F7),
                                )),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0,
                                5,
                                0,
                                10,
                              ),
                              child: Text(
                                'Most Recommened',
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 2,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                    child: Icon(
                      Icons.tune_sharp,
                      color: Color(0xFF0B2F45),
                      size: 20,
                    ),
                  )),
            ],
            centerTitle: false,
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
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0,
                                0,
                                0,
                                0,
                              ),
                              child: Text(
                                'Select Service',
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0,
                                0,
                                0,
                                0,
                              ),
                              child: InkWell(
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        addservice(),
                                  );
                                },
                                child: Text(
                                  '+ ADD OTHER',
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.8,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (dumss.length == 0)
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.2),
                          child: Container(
                            height: 80,
                            child: ColorLoader(),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          SizeConfig.blockSizeHorizontal * 3.5,
                          SizeConfig.blockSizeVertical * 2,
                          SizeConfig.blockSizeHorizontal * 3.5,
                          0,
                        ),
                        child: Container(
                          height: dumss.length == 0
                              ? SizeConfig.blockSizeVertical * 30
                              : SizeConfig.blockSizeVertical * 55,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: ScrollPhysics(),
                            itemCount: dumss.length,
                            itemBuilder: (context, index1) {
                              this.filterChips = dumss[index1]['service']
                                  .map<Widget>((dynamic name) {
                                return FilterChip(
                                  backgroundColor: Colors.white,
                                  key: ValueKey<String>(name['servicename']),
                                  label: Text(
                                    name['servicename'],
                                    style: TextStyle(
                                      color:
                                          selectedService.contains(name['sid'])
                                              ? Color(0xFF3F8BFD)
                                              : Colors.black,
                                      fontFamily: 'geometric sans-serif',
                                      letterSpacing: 0.2,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2,
                                    ),
                                  ),
                                  onSelected: (bool value) {
                                    setState(() {
                                      if (selectedService
                                              .contains(name['sid']) ==
                                          true) {
                                        selectedService.remove(
                                          name['sid'],
                                        );
                                        selectcount -= 1;
                                        storage.setItem("selectedlservicesList",
                                            selectedService);
                                        storage.setItem("sbCount", selectcount);
                                      } else if (selectedService
                                              .contains(name['sid']) ==
                                          false) {
                                        selectedService.add(
                                          name['sid'],
                                        );
                                        selectcount += 1;
                                        storage.setItem("selectedlservicesList",
                                            selectedService);
                                        storage.setItem("sbCount", selectcount);
                                      }
                                    });
                                  },
                                );
                              }).toList();

                              return Column(
                                children: [
                                  ExpansionTile(
                                    backgroundColor: Colors.grey[100],
                                    collapsedBackgroundColor: Colors.grey[200],
                                    iconColor: Colors.black,
                                    collapsedIconColor: Colors.black,
                                    title: Text(
                                      dumss[index1]['speciality_name'],
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        letterSpacing: 0.2,
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    children: [
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        runAlignment: WrapAlignment.start,
                                        children: filterChips
                                            .map<Widget>((Widget chip) {
                                          return InkWell(
                                              child: Padding(
                                                  padding: EdgeInsets.all(
                                                    2.0,
                                                  ),
                                                  child: chip),
                                              onTap: () {
                                                print('Chip Data: ' +
                                                    chip.toString());
                                              });
                                        }).toList(),
                                      ),

                                      // Padding(
                                      //   padding: EdgeInsets.symmetric(
                                      //       horizontal: 10,),
                                      //   child: GridView.builder(
                                      //     shrinkWrap: true,
                                      //     itemCount:
                                      //         dumss[index1]['service'].length,
                                      //     physics: ScrollPhysics(),
                                      //     gridDelegate:
                                      //         SliverGridDelegateWithFixedCrossAxisCount(
                                      //             crossAxisCount: 2,
                                      //             childAspectRatio:
                                      //                 (MediaQuery.of(context)
                                      //                             .size
                                      //                             .width /
                                      //                         2) /
                                      //                     (MediaQuery.of(
                                      //                                 context)
                                      //                             .size
                                      //                             .height /
                                      //                         20,),
                                      //             crossAxisSpacing: 8.0,
                                      //             mainAxisSpacing: 10.0,),
                                      //     itemBuilder: (BuildContext context,
                                      //         int index) {
                                      //       return services(
                                      //         dumss[index1]['service'][index],
                                      //       );
                                      //     },
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );

                              // Column(
                              //     crossAxisAlignment:
                              //         CrossAxisAlignment.start,
                              //     children: [
                              //       Text(spData[index1]['name'],
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //             fontFamily:
                              //                 'geometric sans-serif',
                              //             letterSpacing: 0.2,
                              //             color: Colors.black,
                              //             fontSize: SizeConfig
                              //                     .blockSizeVertical *
                              //                 2,
                              //             fontWeight: FontWeight.bold,
                              //           )),
                              //       SizedBox(
                              //         height: 10,
                              //       ),
                              //       GridView.builder(
                              //         shrinkWrap: true,
                              //         itemCount: dumss[index1]
                              //                 [spData[index1]['spId']]
                              //             .length,
                              //         physics: ScrollPhysics(),
                              //         gridDelegate:
                              //             SliverGridDelegateWithFixedCrossAxisCount(
                              //                 crossAxisCount: 2,
                              //                 childAspectRatio:
                              //                     (MediaQuery.of(context)
                              //                                 .size
                              //                                 .width /
                              //                             2) /
                              //                         (MediaQuery.of(
                              //                                     context)
                              //                                 .size
                              //                                 .height /
                              //                             20,),
                              //                 crossAxisSpacing: 8.0,
                              //                 mainAxisSpacing: 10.0,),
                              //         itemBuilder:
                              //             (BuildContext context,
                              //                 int index) {
                              //           return service(dumss[index1]
                              //                   [spData[index1]['spId']]
                              //               [index],);
                              //         },
                              //       ),
                              //       SizedBox(
                              //         height: 10,
                              //       ),
                              //     ],);
                            },
                          ),
                        ),
                      ),
                      Divider(
                        height: SizeConfig.blockSizeVertical * 8,
                        thickness: 3,
                        color: Color(0xFFF1F4F7),
                      ),
                      if (newList.length != 0)
                        Container(
                            // height: SizeConfig.blockSizeVertical * 55,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    SizeConfig.blockSizeHorizontal * 3.5,
                                vertical: SizeConfig.blockSizeVertical * 1),
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: newList.length,
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
                                return addedServiceList(
                                  newList[index],
                                );
                              },
                            )),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            selectcount.toString() +
                                "/" +
                                allservicecount.toString() +
                                " Selected",
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              SizeConfig.blockSizeHorizontal * 2,
                              SizeConfig.blockSizeVertical * 1,
                              0,
                              0,
                            ),
                            child: Text(
                              'Note : Selected Services will be presented in your',
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                fontSize: SizeConfig.blockSizeVertical * 2,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'Service Selection',
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
                            moveNext();
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
                      SizedBox(height: 30)
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

  // Widget accord(context, data, i) {
  //   return AccordionSection(
  //     isOpen: false,
  //     rightIcon: Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 27),
  //     header: Text(spData[i]['name'],
  //         textAlign: TextAlign.start,
  //         style: TextStyle(
  //           fontFamily: 'geometric sans-serif',
  //           letterSpacing: 0.2,
  //           color: Colors.black,
  //           fontSize: SizeConfig.blockSizeVertical * 2,
  //           fontWeight: FontWeight.bold,
  //         )),
  //     headerPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
  //     content: Container(
  //       child: GridView.builder(
  //         shrinkWrap: true,
  //         itemCount: dumss[i][spData[i]['spId']].length,
  //         physics: ScrollPhysics(),
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             childAspectRatio: (MediaQuery.of(context).size.width / 2) /
  //                 (MediaQuery.of(context).size.height / 20,),
  //             crossAxisSpacing: 8.0,
  //             mainAxisSpacing: 10.0,),
  //         itemBuilder: (BuildContext context, int index) {
  //           return service(dumss[i][spData[i]['spId']][index],);
  //         },
  //       ),
  //     ),
  //     contentHorizontalPadding: 20,
  //     contentVerticalPadding: 20,
  //     contentBorderColor: Color.fromRGBO(122, 170, 99, 0.06),
  //     contentBorderWidth: 1,
  //     headerBorderRadius: 3,
  //     contentBorderRadius: 3,
  //     headerBackgroundColor: Color.fromRGBO(122, 170, 99, 0.06),
  //   );
  // }

  Widget serviceselect(service) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (selectedService.contains(service['sid']) == true) {
              selectedService.remove(
                service['sid'],
              );
              // selectcount = selectedService.length;
              storage.setItem("selectedlservicesList", selectedService);
              // storage.setItem("lbCount", selectcount);
              selectcount -= 1;
              storage.setItem("selectcount", selectcount);
            } else if (selectedService.contains(service['sid']) == false) {
              selectedService.add(
                service['sid'],
              );
              // selectcount = selectedService.length;
              storage.setItem("selectedlservicesList", selectedService);
              // storage.setItem("lbCount", selectcount);
              selectcount += 1;
              storage.setItem("selectcount", selectcount);
            }
          });
          print(selectcount);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              50,
            ),
            border: Border.all(
                // color:  Color(0xFF3F8BFD)
                color: selectedService.contains(service['sid'])
                    ? Color(0xFF3F8BFD)
                    : Color(0xFFE5E5E5)),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              0,
              SizeConfig.blockSizeVertical * 0.8,
              0,
              0,
            ),
            child: Text(
              service['servicename'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'geometric sans-serif',
                fontSize: SizeConfig.blockSizeVertical * 2,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }

  Widget services(serviceName) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (selectedService.contains(serviceName['sid']) == true) {
              selectedService.remove(
                serviceName['sid'],
              );
              selectcount -= 1;
              storage.setItem("selectedlservicesList", selectedService);
              storage.setItem("sbCount", selectcount);
            } else if (selectedService.contains(serviceName['sid']) == false) {
              selectedService.add(
                serviceName['sid'],
              );
              selectcount += 1;
              storage.setItem("selectedlservicesList", selectedService);
              storage.setItem("sbCount", selectcount);
            }
          });
        },
        child: Container(
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              50,
            ),
            border: Border.all(
                color: selectedService.contains(serviceName['sid'])
                    ? Color(0xFF3F8BFD)
                    : Color(0xFFE5E5E5)),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              0,
              SizeConfig.blockSizeVertical * 0.8,
              0,
              0,
            ),
            child: Text(serviceName['servicename'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'geometric sans-serif',
                  letterSpacing: 0.2,
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeVertical * 2,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ));
  }

  Widget addservice() {
    return AlertDialog(
        backgroundColor: Colors.transparent,
        content: StatefulBuilder(// You need this, notice the parameters below:
            builder: (BuildContext context, StateSetter setState) {
          // content: Container(

          return Container(
            height: SizeConfig.blockSizeVertical * 40,
            width: SizeConfig.blockSizeHorizontal * 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    SizeConfig.blockSizeHorizontal * 0,
                    SizeConfig.blockSizeVertical * 0,
                    0,
                    0,
                  ),
                  child: Text(
                    '+ADD OTHER SPECIALITY',
                    style: TextStyle(
                      fontFamily: 'geometric sans-serif',
                      fontSize: SizeConfig.blockSizeVertical * 2,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    SizeConfig.blockSizeHorizontal * 4,
                    SizeConfig.blockSizeVertical * 2,
                    0,
                    0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'SELECT SPECIALTY',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          fontSize: SizeConfig.blockSizeVertical * 2,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: TrymdPartnerDropDown(
                      options: namesList,
                      onChanged: (val) => setState(() => specialtyIdDP = val),
                      height: SizeConfig.blockSizeVertical * 6,
                      width: SizeConfig.blockSizeHorizontal * 60,
                      textStyle: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        letterSpacing: 0.2,
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 2,
                        fontWeight: FontWeight.w500,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 22,
                        color: Colors.black,
                      ),
                      fillColor: Color(0xFFEEEEEE),
                      elevation: 0,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 5,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    )),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    0,
                    SizeConfig.blockSizeVertical * 3,
                    0,
                    0,
                  ),
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 60,
                    height: SizeConfig.blockSizeVertical * 6,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F7),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        10,
                        7,
                        0,
                        0,
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        controller: textController,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Speciality Name',
                          hintStyle: TextStyle(
                            fontFamily: 'geometric sans-serif',
                            letterSpacing: 0.2,
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 2,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          fontSize: SizeConfig.blockSizeVertical * 2,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    0,
                    0,
                    0,
                    0,
                  ),
                  child: InkWell(
                    onTap: () async {
                      addService();
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        20,
                        0,
                        0,
                      ),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 60,
                        height: SizeConfig.blockSizeVertical * 6,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF2BA4F9), Color(0xFF07D0F2)],
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
                            'ADD',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  Widget addedServiceList(data) {
    return GestureDetector(
        onTap: () {
          // setState(() {
          //   if (newListTwo.contains(data) == true) {
          //     newListTwo.remove(data);
          //     selectcount -= 1;
          //     storage.setItem("servicenewListTwo", newListTwo);
          //     storage.setItem("lbCount", selectcount);
          //   } else if (newListTwo.contains(data) == false) {
          //     newListTwo.add(data);
          //     selectcount += 1;
          //   }
          // });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              50,
            ),
            border: Border.all(color: Color(0xFF3F8BFD)),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              0,
              SizeConfig.blockSizeVertical * 0.8,
              0,
              0,
            ),
            child: Text(
              data['servicename'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'geometric sans-serif',
                fontSize: SizeConfig.blockSizeVertical * 2,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }

  //Function ***********************************************************************************
  String getRandomString(int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (_) => _chars.codeUnitAt(
            _rnd.nextInt(_chars.length),
          ),
        ),
      );

  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  serviceOnLoad() async {
    List spd = speId;
    String speid = speId.toString();
    speid = speid.replaceAll('[', '');
    speid = speid.replaceAll(']', '');
    speid = speid.replaceAll(' ', '');
    var response1 =
        await VendorSelectedCategories().getSpecialityResponse(catId);

    List tags = response1["result"];
    List data = storage.getItem("selected_spe_id");
    data.forEach((selectedId) {
      tags.forEach((allData) {
        if (selectedId == allData['speciality_id']) {
          allSpeides.add(allData);
        }
      });
    });

    var response2 =
        await VendorSelectedCategories().getServicesListResponse(catId, speid);

    if (response2['status'] == 1) {
      dynamic datum = response2["result"];
      List data1 = [];
      // print(response2["result"],);
      spd.forEach((element) {
        // datum[element].forEach((ele) {
        data1.add(
          datum[element][0],
        );
        // });
      });

      // List data2 = [];
      List data3 = data1;
      // List data4 = [];
      for (int i = 0; i < data3.length; i++) {
        for (int j = 1; j < data3[i]['service'].length; j++) {
          //  data1[i]['service'].add(data3[i]['service'][j],);
        }
      }
      // print(data1);
      // data1.forEach((element) {
      //   element['service'].forEach((ele) {
      //     element['service'].add(ele);
      //   });
      //   data2.add(element);
      // });

      List<String> np = [];
      List d = [];
      // print(tags);
      tags.forEach((element1) {
        data1.forEach((element2) {
          if (element1['speciality_id'] == element2['speciality_id']) {
            element2['speciality_name'] = element1['speciality_name'];
            np.add(
              element1['speciality_name'],
            );
            d.add(element2);
          }
        });

        //   datum[0].forEach((element2) {
        //     if (element1['speciality_id'] == element2['speciality_id']) {
        //       element2['speciality_name'] = element1['speciality_name'];
        //       np.add(element1['speciality_name'],);
        //       d.add(element2);
        //     }
        //   });
      });
      print(d);

      // List data = storage.getItem("selected_spe_id");
      // data.forEach((selectedId) {
      //   allSpeides.forEach((allData) {
      //     if (selectedId == allData['speciality_id']) {}
      //   });
      // });
      namesList = np;
      specialtyIdDP = namesList[0];
      dumss = d;
      // print(dumss);
      // print(namesList);
      allservicecount = 0;
      for (int i = 0; i < dumss.length; i++) {
        allservicecount += dumss[i]['service'].length;
      }

      storage.setItem("serviceList", dumss);
      storage.setItem("namesList", namesList);
      storage.setItem("allservicecount", allservicecount);
    }

    setState(() {});
  }

  void searchfilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allService;
      print(results);
    } else {
      results = allService
          .where((service) => service["servicename"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      print(results);
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      allService = results;
    });
  }

  addService() async {
    Navigator.pop(context);
    String id = "";

    allSpeides.forEach((element) {
      if (element['speciality_name'] == specialtyIdDP) {
        id = element['speciality_id'];
      }
    });
    var response = await VendorSelectedCategories()
        .addServicesResponse(catId, specialtyIdDP, textController.text);

    if (response['status'] == 1) {
      setState(() {
        newList.add({
          "speciality_id": id,
          "service_status": true,
          "servicename": textController.text,
          "sid": getRandomString(8)
        });
        newListTwo.add({
          "speciality_id": id,
          "service_status": true,
          "servicename": textController.text,
          "sid": getRandomString(8)
        });
      });
      textController.text = '';
      selectcount += 1;
      allservicecount += 1;
      storage.setItem("servicenewList", newList);
      storage.setItem("servicenewListTwo", newListTwo);
      storage.setItem("sbCount", selectcount);
      storage.setItem("allservicecount", allservicecount);
      setState(() {});
    } else {
      _globalWidget.toastMessage('Could not add service label');
    }
  }

  moveNext() async {
    if (selectedService.length != 0) {
      dumss.forEach((element) {
        selectedService.forEach((element1) {
          element['service'].forEach((element2) {
            if (element1 == element2['sid']) {
              element2['service_status'] = true;
            }
          });
        });
      });

      storage.setItem("servicenewListTwo", newListTwo);
      newListTwo.forEach((element) {
        selectedService.add(element);
        allSpeides.forEach((element1) {
          if (element1["speciality_id"] == element["speciality_id"]) {
            dumss.add({
              "service": [element],
              "speciality_id": element["speciality_id"],
              "speciality_name": element1["speciality_name"]
            });
          }
        });
      });
      storage.setItem("servicenewList", newList);
      storage.setItem("selectedlservicesList", selectedService);

      storage.setItem("selectedServicesAllItem", dumss);

      var jsonBody = jsonEncode({
        "professional_id": storage.getItem('vendor_id'),
        "category_id": storage.getItem("selectedCategoryAllItems"),
        "speciality_id": storage.getItem("selectedSpecialtyAllItems"),
        "labeltags": storage.getItem("selectedLablesAll"),
        "servicetags": dumss
      });

      var response =
          await VendorClassificationGet().updateVendorPreferences(jsonBody);

      if (response['status'] == 1) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                OperationalDetailsWidget(vendorType: widget.vendorType),
            transitionDuration: Duration(
              seconds: 0,
            ),
          ),
        );
      } else {
        _globalWidget.toastMessage('Could not update preferences');
      }
    } else {
      _globalWidget.toastMessage('Please select services');
    }
  }
}
