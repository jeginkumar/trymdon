// import 'dart:ffi';

// import 'package:trymd_partner/dashboard/dashboard.dart';
// import 'package:trymd_partner/fda_screens/global_widgets/flutter_flow_icon_button.dart';
import 'package:trymd_partner/repository.dart';
import 'package:trymd_partner/sizer.dart';

// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
// import 'package:trymd_partner/fda_screens/global_widgets/flutter_flow_theme.dart';
// import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:expansion_tile_card/expansion_tile_card.dart';

class AccessControlWidget extends StatefulWidget {
  const AccessControlWidget({Key key}) : super(key: key);

  @override
  _AccessControlWidgetState createState() => _AccessControlWidgetState();
}

class _AccessControlWidgetState extends State<AccessControlWidget> {
  bool viewvalue = false;
  bool editvalue = false;
  bool deletevalue = false;
  bool allvalue = false;
  bool isChecked = false;
  bool animateTrailing = false;
  List<dynamic> onclick = [];
  List<dynamic> onclick1 = [];
  List<dynamic> onclick2 = [];
  dynamic screensofname;
  List<dynamic> controlaccess = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List iconList = [
    Icons.visibility,
    Icons.edit,
    Icons.delete,
  ];

  @override
  void initState() {
    super.initState();
    accesscontrol();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              SizeConfig.blockSizeHorizontal * 0,
              SizeConfig.blockSizeVertical * 4,
              0,
              0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: (screensofname == null) ? 0 : screensofname.length,
                  itemBuilder: (context, index) {
                    return listscreens(context, index);
                  },
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 4,
                  width: double.infinity,
                )
              ],
            ),
          ),
        ));
  }

  Widget listscreens(context, index) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        SizeConfig.blockSizeHorizontal * 3,
        SizeConfig.blockSizeVertical * 1,
        SizeConfig.blockSizeHorizontal * 3,
        0,
      ),
      child: Material(
        color: Colors.transparent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 96,
          height: SizeConfig.blockSizeVertical * 6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10,
            ),
            border: Border.all(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  width: SizeConfig.blockSizeHorizontal * 60,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      SizeConfig.blockSizeHorizontal * 3,
                      0,
                      0,
                      0,
                    ),
                    child: Text(
                      screensofname[index]["nameofscreens"],
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 3,
                  0,
                  0,
                  0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (onclick1.contains(index) == true) {
                        onclick1.remove(index);
                      } else if (onclick1.contains(index) == false) {
                        onclick1.add(index);
                      }
                    });
                  },
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 6,
                    height: SizeConfig.blockSizeVertical * 3,
                    decoration: BoxDecoration(
                      color: onclick1.contains(index)
                          ? Color(0xFF438DFD)
                          : Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        0,
                        0,
                        0,
                      ),
                      child: Icon(
                        Icons.visibility,
                        color: onclick1.contains(index)
                            ? Colors.white
                            : Colors.grey,
                        size: SizeConfig.blockSizeVertical * 2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  SizeConfig.blockSizeHorizontal * 6,
                  0,
                  0,
                  0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (onclick.contains(index) == true) {
                        onclick.remove(index);
                      } else if (onclick.contains(index) == false) {
                        onclick.add(index);
                      }
                    });
                  },
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 6,
                    height: SizeConfig.blockSizeVertical * 3,
                    decoration: BoxDecoration(
                      color: onclick.contains(index)
                          ? Color(0xFF438DFD)
                          : Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0,
                        0,
                        0,
                        0,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: onclick.contains(index)
                            ? Colors.white
                            : Colors.grey,
                        size: SizeConfig.blockSizeVertical * 2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  20,
                  0,
                  0,
                  0,
                ),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        if (onclick2.contains(index) == true) {
                          onclick2.remove(index);
                        } else if (onclick2.contains(index) == false) {
                          onclick2.add(index);
                        }
                      });
                    },
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 6,
                      height: SizeConfig.blockSizeVertical * 3,
                      decoration: BoxDecoration(
                        color: onclick2.contains(index)
                            ? Color(0xFF438DFD)
                            : Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0,
                          0,
                          0,
                          0,
                        ),
                        child: Icon(
                          Icons.delete,
                          color: onclick2.contains(index)
                              ? Colors.white
                              : Colors.grey,
                          size: SizeConfig.blockSizeVertical * 2,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  accesscontrol() async {
    var response = Access();
    Map<String, dynamic> value = await response.control();
    screensofname = value["controlaccess"];
    print('Access Control: ' + screensofname.toString());
    setState(() {});
  }
}
