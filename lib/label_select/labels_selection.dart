// import 'package:accordion/accordion.dart';
// import 'package:accordion/controllers.dart';
import 'package:localstorage/localstorage.dart';
import 'package:trymd_partner/accountsetup/colorLoader.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:trymd_partner/global_widget/trymd_partner_drop_down.dart';
import 'package:trymd_partner/repository/selections.dart';
import 'package:trymd_partner/service/service_selection_widget.dart';
import 'package:trymd_partner/sizer.dart';
import 'package:trymd_partner/specality_select/speciality_multiselect.dart';
import 'package:trymd_partner/specality_select/speciality_selection_widget.dart';
import '../global_widget/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:uuid/uuid.dart';
// import 'package:uuid/uuid_util.dart';
import 'dart:math';

class LabelsSelectionWidget extends StatefulWidget {
  final vendorType;
  LabelsSelectionWidget({
    this.vendorType,
  });

  @override
  _LabelsSelectionWidgetState createState() => _LabelsSelectionWidgetState();
}

class _LabelsSelectionWidgetState extends State<LabelsSelectionWidget> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final LocalStorage storage = new LocalStorage('localstorage_app');
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int alllabelcount = 0;
  int selectcount = 0;
  String labelname = "";
  List newList = [];
  List newListTwo = [];
  dynamic uuid;
  List selectedLabels = [];
  List<dynamic> labelsList = [];
  List<dynamic> dumss = [];
  TextEditingController textController = TextEditingController();
  Icon cicon = Icon(Icons.search);
  String catId = "";
  List speId = [];
  List<String> spData = [];
  List allSpeides = [];
  String specialtyIdDP = "";
  List<Widget> filterChips = [];

  @override
  void initState() {
    super.initState();
    catId = storage.getItem("selected_cat_id");
    speId = storage.getItem("selected_spe_id");

    List dummyData = storage.getItem("labelsList");

    if (dummyData != null) {
      // spData = storage.getItem("spData");
      dumss = dummyData;
      alllabelcount = storage.getItem("alllabelcount");
      if (storage.getItem("newList") != null) {
        newList = storage.getItem("newList");
      }

      if (storage.getItem("newListTwo") != null) {
        newListTwo = storage.getItem("newListTwo");
      }

      if (storage.getItem("selectedlabelList") != null) {
        selectedLabels = storage.getItem("selectedlabelList");
        if (storage.getItem("lbCount") != null) {
          selectcount = selectedLabels.length;
        }
      }
    }

    labelsOnLoad();
  }

  Widget csearchbar = Padding(
    padding: EdgeInsets.only(
      left: 30,
    ),
    child: Text(
      'Label Selection',
      style: TextStyle(
        fontFamily: 'geometric sans-serif',
        fontSize: SizeConfig.blockSizeVertical * 3,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Future<bool> _onBackButtonPressed() async {
    if (widget.vendorType == "professional") {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              SpecialitySelectionWidget(vendorType: "professional"),
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
              SpecialityMultiSelect(vendorType: "vendor"),
          transitionDuration: Duration(
            seconds: 0,
          ),
        ),
      );
    }
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
                  if (widget.vendorType == "professional") {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            SpecialitySelectionWidget(
                                vendorType: "professional"),
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
                            SpecialityMultiSelect(vendorType: "vendor"),
                        transitionDuration: Duration(
                          seconds: 0,
                        ),
                      ),
                    );
                  }
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
                              textInputAction: TextInputAction.go,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 2,
                              ),
                            );
                          } else {
                            this.cicon = Icon(Icons.search);
                            this.csearchbar = Padding(
                              padding: EdgeInsets.only(
                                left: 40,
                              ),
                              child: Text(
                                'Labels selection',
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }
                        });
                      },
                      icon: cicon,
                      color: Color(0xFF767F9D),
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
                                      'Filter by',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Color(0XFF3F8BFD),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                              Divider(
                                height: 6,
                                thickness: 2,
                                indent: 5,
                                endIndent: 5,
                                color: Color(0xFFF1F4F7),
                              ),
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
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            labelsList.sort((a, b) {
                                              //sorting in ascending order
                                              print(b);
                                              return a["labelname"].compareTo(
                                                b["labelname"],
                                              );
                                            });
                                          });
                                        },
                                        child: Text(
                                          'Sort A-Z',
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            letterSpacing: 0.2,
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        0,
                                        SizeConfig.blockSizeHorizontal * 2,
                                        0,
                                      ),
                                      child: FaIcon(
                                        FontAwesomeIcons.longArrowAltDown,
                                        color: Colors.black,
                                        size:
                                            SizeConfig.blockSizeVertical * 2.5,
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
                                            labelsList.sort((a, b) {
                                              //sorting in ascending order
                                              print(b);
                                              return b["labelname"].compareTo(
                                                a["labelname"],
                                              );
                                            });
                                          });
                                        },
                                        child: Text(
                                          'Sort Z-A',
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            letterSpacing: 0.2,
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
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
                                        size:
                                            SizeConfig.blockSizeVertical * 2.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    5,
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
                                child: Text('Most Recommened',
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      letterSpacing: 0.2,
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                      child: Icon(
                        Icons.tune_sharp,
                        color: Color(0xFF0B2F45),
                        size: SizeConfig.blockSizeVertical * 3,
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
                  // height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            10,
                            0,
                            0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 0,
                                  0,
                                  0,
                                  0,
                                ),
                                child: Text('Select Labels',
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      letterSpacing: 0.2,
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2.5,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  SizeConfig.blockSizeHorizontal * 0,
                                  0,
                                  0,
                                  0,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          addlabel(),
                                    );
                                  },
                                  child: Text(
                                    '+ ADD OTHER',
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      letterSpacing: 0.2,
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.8,
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
                            child:

                                //       Accordion(
                                // maxOpenSections: 1,
                                // scrollIntoViewOfItems: ScrollIntoViewOfItems.fast,
                                // disableScrolling: true,
                                // headerPadding:
                                //     EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                                // children: [
                                //   for (int i = 0; i < dumss.length; i++)
                                //     accord(context, dumss[i],i)
                                // ])

                                ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: ScrollPhysics(),
                              itemCount: dumss.length,
                              itemBuilder: (context, index1) {
                                this.filterChips = dumss[index1]['labeltags']
                                    .map<Widget>((dynamic name) {
                                  return FilterChip(
                                    backgroundColor: Colors.white,
                                    key: ValueKey<String>(name['lbname']),
                                    label: Text(
                                      name['lbname'],
                                      style: TextStyle(
                                        color:
                                            selectedLabels.contains(name['lid'])
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
                                        if (selectedLabels
                                                .contains(name['lid']) ==
                                            true) {
                                          selectedLabels.remove(
                                            name['lid'],
                                          );
                                          storage.setItem("selectedlabelList",
                                              selectedLabels);
                                          selectcount -= 1;
                                          storage.setItem(
                                              "lbCount", selectcount);
                                        } else if (selectedLabels
                                                .contains(name['lid']) ==
                                            false) {
                                          selectedLabels.add(
                                            name['lid'],
                                          );
                                          storage.setItem("selectedlabelList",
                                              selectedLabels);
                                          selectcount += 1;
                                          storage.setItem(
                                              "lbCount", selectcount);
                                        }
                                      });
                                    },
                                  );
                                }).toList();

                                return Column(
                                  children: [
                                    ExpansionTile(
                                      backgroundColor: Colors.grey[100],
                                      collapsedBackgroundColor:
                                          Colors.grey[200],
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
                                        //     itemCount: dumss[index1]
                                        //             ['labeltags']
                                        //         .length,
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
                                        //       return labels(
                                        //         dumss[index1]['labeltags']
                                        //             [index],
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

                                //  Column(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.start,
                                //     children: [
                                //       Text(spData[index1],
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
                                //                 [spData[index1]]
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
                                //         itemBuilder: (BuildContext context,
                                //             int index) {
                                //           return labels(dumss[index1]
                                //               [spData[index1]][index],);
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
                                  return addedLabelsList(
                                    newList[index],
                                  );
                                },
                              )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                // '$selectcount/$alllabelcount Selected',
                                selectcount.toString() +
                                    "/" +
                                    alllabelcount.toString() +
                                    " Selected",
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  letterSpacing: 0.2,
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 2,
                                  fontWeight: FontWeight.bold,
                                )),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                SizeConfig.blockSizeHorizontal * 2,
                                SizeConfig.blockSizeVertical * 1,
                                0,
                                0,
                              ),
                              child: Text(
                                  'Note : Selected Labels will be presented in your',
                                  style: TextStyle(
                                    fontFamily: 'geometric sans-serif',
                                    letterSpacing: 0.2,
                                    color: Colors.black,
                                    fontSize: SizeConfig.blockSizeVertical * 2,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Text(
                              'Label selection',
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 2,
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
                        SizedBox(height: 40)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
    });
  }

  // Widget accord(context, data, i) {
  //   return AccordionSection(
  //     isOpen: false,
  //     rightIcon: Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 27),
  //     header: Text(spData[i],
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
  //         itemCount: dumss[i][spData[i]].length,
  //         physics: ScrollPhysics(),
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             childAspectRatio: (MediaQuery.of(context).size.width / 2) /
  //                 (MediaQuery.of(context).size.height / 20,),
  //             crossAxisSpacing: 8.0,
  //             mainAxisSpacing: 10.0,),
  //         itemBuilder: (BuildContext context, int index) {
  //           return labels(dumss[i][spData[i]][index],);
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

  Widget labels(labelName) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (selectedLabels.contains(labelName['lid']) == true) {
              selectedLabels.remove(
                labelName['lid'],
              );
              storage.setItem("selectedlabelList", selectedLabels);
              selectcount -= 1;
              storage.setItem("lbCount", selectcount);
            } else if (selectedLabels.contains(labelName['lid']) == false) {
              selectedLabels.add(
                labelName['lid'],
              );
              storage.setItem("selectedlabelList", selectedLabels);
              selectcount += 1;
              storage.setItem("lbCount", selectcount);
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
                color: selectedLabels.contains(labelName['lid'])
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
            child: Text(labelName['lbname'],
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

  Widget addlabel() {
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
                    child: Text('+ ADD OTHER LABELS',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          letterSpacing: 0.2,
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeVertical * 2,
                          fontWeight: FontWeight.bold,
                        )),
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
                        Text('SELECT LABEL',
                            style: TextStyle(
                              fontFamily: 'geometric sans-serif',
                              letterSpacing: 0.2,
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: TrymdPartnerDropDown(
                        options: spData,
                        onChanged: (val) => setState(() => specialtyIdDP = val),
                        height: SizeConfig.blockSizeVertical * 6,
                        width: SizeConfig.blockSizeHorizontal * 60,
                        textStyle: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          letterSpacing: 0.2,
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeVertical * 2,
                          fontWeight: FontWeight.bold,
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
                              hintText: 'Label Name',
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
                              letterSpacing: 0.2,
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              fontWeight: FontWeight.bold,
                            )),
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
                        addLabel();
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
                            child: Text('ADD',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  letterSpacing: 0.2,
                                  color: Colors.white,
                                  fontSize: SizeConfig.blockSizeVertical * 2,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        }));
  }

  Widget addedLabelsList(data) {
    return GestureDetector(
        onTap: () {
          // setState(() {
          //   if (newListTwo.contains(data) == true) {
          //     newListTwo.remove(data);
          //     selectcount -= 1;
          //     storage.setItem("lbCount", selectcount);
          //   } else if (newListTwo.contains(data) == false) {
          //     newListTwo.add(data);
          //     selectcount += 1;
          //     storage.setItem("lbCount", selectcount);
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
              data['lbname'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                color: Colors.black,
                fontSize: SizeConfig.blockSizeVertical * 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }

  //Function **************************************************************************

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

  labelsOnLoad() async {
    var response =
        await VendorSelectedCategories().getSpecialityResponse(catId);
    List<String> sp = [];
    List d = [];
    if (response['status'] == 1) {
      List tags = response["result"];
      List data = storage.getItem("selected_spe_id");
      data.forEach((selectedId) {
        tags.forEach((allData) {
          if (selectedId == allData['speciality_id']) {
            d.add(allData);
            allSpeides.add(allData);
            sp.add(allData['speciality_name'].toString());
          }
        });
      });
      spData = sp;
      dumss = d;
      //   print(allSpeides);
      //   List<dynamic> dum = [];
      //   allSpeides.forEach((e) {
      //     var data1 = e['labeltags'];
      //     data1 = data1.split(',');
      //     data1.forEach((ele) {
      //       labelsList.add(ele);
      //       uuid = generateRandomString(6);
      //       dum.add({
      //         "speciality_id ": e['speciality_id'],
      //         "label_name": ele,
      //         "sp_name": e['speciality_name'],
      //         "uid": getRandomString(8)
      //       });
      //     });
      //   });

      //   dumss = dum.groupBy('sp_name');
      alllabelcount = 0;
      for (int i = 0; i < dumss.length; i++) {
        alllabelcount += dumss[i]['labeltags'].length;
      }
      // print(dumss);
      //   // labelsList = response["result"];
      //   // print(labelsList);
      storage.setItem("spData", spData);
      storage.setItem("labelsList", dumss);

      storage.setItem("alllabelcount", alllabelcount);
    }
    setState(() {});
  }

  void searchfilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      results = labelsList;
    } else {
      results = labelsList
          .where((labels) => labels["labelname"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      labelsList = results;
    });
  }

  addLabel() async {
    Navigator.pop(context);
    String id = "";
    allSpeides.forEach((element) {
      if (element['speciality_name'] == specialtyIdDP) {
        id = element['speciality_id'];
      }
    });
    var response = await VendorSelectedCategories()
        .addLabelsResponse(catId, id, textController.text);
    print(response);
    if (response['status'] == 1) {
      setState(() {
        newList.add({
          "speciality_id ": id,
          "label_status": true,
          "lbname": textController.text,
          "sp_name": specialtyIdDP,
          "lid": getRandomString(8)
        });
        newListTwo.add({
          "speciality_id ": id,
          "lbname": textController.text,
          "label_status": true,
          "sp_name": specialtyIdDP,
          "lid": getRandomString(8)
        });
        selectcount += 1;
        alllabelcount += 1;
        storage.setItem("newList", newList);
        storage.setItem("newListTwo", newListTwo);
        storage.setItem("lbCount", selectcount);
        storage.setItem("alllabelcount", alllabelcount);

        print(newList);
      });
      textController.text = '';
    } else {
      _globalWidget.toastMessage('Could not add label');
    }
  }

  moveNext() {
    if (selectedLabels.length != 0) {
      dumss.forEach((element) {
        selectedLabels.forEach((element1) {
          element['labeltags'].forEach((element2) {
            if (element1 == element2['lid']) {
              element2['label_status'] = true;
            }
          });
        });
      });

      storage.setItem("newListTwo", newListTwo);
      newListTwo.forEach((element) {
        selectedLabels.add(element);
        dumss.add(element);
        // print(element);
      });
      storage.setItem("newList", newList);
      storage.setItem("selectedlabelList", selectedLabels);

      // print(selectedLabels);

      storage.setItem("selectedLablesAll", dumss);

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              ServiceSelectionWidget(
            vendorType: widget.vendorType,
          ),
          transitionDuration: Duration(
            seconds: 0,
          ),
        ),
      );
    } else {
      _globalWidget.toastMessage('Please select atleast one label');
    }
  }
}

extension UtilListExtension on List {
  groupBy(String key) {
    try {
      List<Map<String, dynamic>> result = [];
      List<String> keys = [];

      this.forEach(
        (f) => keys.add(
          f[key],
        ),
      );

      [...keys.toSet()].forEach((k) {
        List data = [...this.where((e) => e[key] == k)];
        result.add({k: data});
      });

      return result;
    } catch (e) {
      return this;
    }
  }
}
