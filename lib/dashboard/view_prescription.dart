import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:trymd_partner/dashboard/recorder.dart';

import 'package:trymd_partner/global_widget/trymd_partner_theme.dart';
import 'package:trymd_partner/sizer.dart';

import 'my_profile.dart';

class ViewPrescriptionWidget extends StatefulWidget {
  const ViewPrescriptionWidget({Key key}) : super(key: key);

  @override
  _ViewPrescriptionWidgetState createState() => _ViewPrescriptionWidgetState();
}

class _ViewPrescriptionWidgetState extends State<ViewPrescriptionWidget> {
  bool switchListTileValue;
  TextEditingController textController1;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AudioRecorder(),
                  ),
                );
              },
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
                size: SizeConfig.blockSizeVertical * 3,
              )),
          title: Text(
            'View Prescription',
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
        backgroundColor: TrymdPartnerTheme.of(context).primaryBackground,
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
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Customer Info',
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 2.2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: TextFormField(
                        controller: textController1,
                        onChanged: (_) => EasyDebounce.debounce(
                          'textController1',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Customer Name',
                          labelStyle: TextStyle(
                            fontFamily: 'geometric sans-serif',
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 1.8,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF1F4F7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF1F4F7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        ),
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeVertical * 1.8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: TextFormField(
                        controller: textController2,
                        onChanged: (_) => EasyDebounce.debounce(
                          'textController2',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Customer Age',
                          labelStyle: TextStyle(
                            fontFamily: 'geometric sans-serif',
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 1.8,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF1F4F7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF1F4F7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        ),
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeVertical * 1.8,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                              child: Text(
                                'Appointment Remarks',
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 2.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: 355,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F4F7),
                          borderRadius: BorderRadius.circular(56),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 20, 0, 0),
                                  child: LinearPercentIndicator(
                                    percent: 0.05,
                                    width: 220,
                                    lineHeight: 6,
                                    animation: true,
                                    progressColor: Color(0xFF3B6FF9),
                                    backgroundColor: Colors.white,
                                    barRadius: Radius.circular(14),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      180, 6, 0, 0),
                                  child: Text(
                                    '00:28',
                                    style:
                                        TrymdPartnerTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 10, 0, 0),
                                    child: ClipOval(
                                      child: Image.network(
                                        'https://www.itsecpc.co.uk/wp-content/uploads/2021/05/richard.jpg',
                                        height: 36,
                                        width: 36,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 20, 0, 0),
                                    child: Icon(
                                      Icons.keyboard_voice_outlined,
                                      color: Colors.black,
                                      size: SizeConfig.blockSizeVertical * 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                      color: Color(0xFFF1F4F7),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(1, 0, 1, 0),
                              child: SwitchListTile(
                                value: switchListTileValue ??= false,
                                onChanged: (newValue) => setState(
                                    () => switchListTileValue = newValue),
                                title: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 20, 0),
                                    child: Text(
                                      'Follow-Up Appointment',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2.2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                tileColor: Color(0xFFD8D8D8),
                                activeColor: Color(0xFFFFFFFF),
                                activeTrackColor: Color(0xFFD8D8D8),
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: 355,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFF1F4F7),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Text(
                                '19 JAN 08:30 - 09:30 AM',
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeVertical * 1.6,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(144, 0, 0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.calendarAlt,
                                color: Colors.black,
                                size: SizeConfig.blockSizeVertical * 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Medicine List',
                              style: TextStyle(
                                fontFamily: 'geometric sans-serif',
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 2.2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: 353,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFE0E0E0),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 353,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFB),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color(0xFFE0E0E0),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      '1. Paracetamol (500mg)',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        64, 0, 0, 0),
                                    child: Text(
                                      '17/01/21 - 20/02/21',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Morning | Afternoon | Evening',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      '(After Food)',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        22, 0, 0, 0),
                                    child: Text(
                                      'x 3 Days',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        26, 0, 0, 0),
                                    child: Text(
                                      '   1      |       0          |      1',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        120, 0, 0, 0),
                                    child: Text(
                                      '6 Tablets',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
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
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: 353,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFE0E0E0),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 353,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFB),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color(0xFFE0E0E0),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      '1. Paracetamol (500mg)',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        64, 0, 0, 0),
                                    child: Text(
                                      '17/01/21 - 20/02/21',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Morning | Afternoon | Evening',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      '(After Food)',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        22, 0, 0, 0),
                                    child: Text(
                                      'x 3 Days',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        26, 0, 0, 0),
                                    child: Text(
                                      '   1      |       0          |      1',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        120, 0, 0, 0),
                                    child: Text(
                                      '6 Tablets',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
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
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: 353,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFE0E0E0),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 353,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFB),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color(0xFFE0E0E0),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      '1. Paracetamol (500mg)',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        64, 0, 0, 0),
                                    child: Text(
                                      '17/01/21 - 20/02/21',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Morning | Afternoon | Evening',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      '(After Food)',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        22, 0, 0, 0),
                                    child: Text(
                                      'x 3 Days',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        26, 0, 0, 0),
                                    child: Text(
                                      '   1      |       0          |      1',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        120, 0, 0, 0),
                                    child: Text(
                                      '6 Tablets',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
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
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 50),
                      child: Container(
                        width: 353,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFE0E0E0),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 353,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFB),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color(0xFFE0E0E0),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      '1. Paracetamol (500mg)',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        64, 0, 0, 0),
                                    child: Text(
                                      '17/01/21 - 20/02/21',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Morning | Afternoon | Evening',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      '(After Food)',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        22, 0, 0, 0),
                                    child: Text(
                                      'x 3 Days',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        26, 0, 0, 0),
                                    child: Text(
                                      '   1      |       0          |      1',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        120, 0, 0, 0),
                                    child: Text(
                                      '6 Tablets',
                                      style: TextStyle(
                                        fontFamily: 'geometric sans-serif',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.6,
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget medicine(context, index) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: Container(
        width: 353,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 353,
              height: 39,
              decoration: BoxDecoration(
                color: Color(0xFFFAFAFB),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                border: Border.all(
                  color: Color(0xFFE0E0E0),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      '1. Paracetamol (500mg)',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 1.6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(64, 0, 0, 0),
                    child: Text(
                      '17/01/21 - 20/02/21',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 1.6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Morning | Afternoon | Evening',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 1.6,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      '(After Food)',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 1.6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                    child: Text(
                      'x 3 Days',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 1.6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(26, 0, 0, 0),
                    child: Text(
                      '   1      |       0          |      1',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 1.6,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(120, 0, 0, 0),
                    child: Text(
                      '6 Tablets',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 1.6,
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
    );
  }
}
