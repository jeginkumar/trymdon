import 'package:flutter/material.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:trymd_partner/sizer.dart';

class FeeslabWidget extends StatefulWidget {
  const FeeslabWidget({Key key}) : super(key: key);

  @override
  _FeeslabWidgetState createState() => _FeeslabWidgetState();
}

class _FeeslabWidgetState extends State<FeeslabWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black,
          size: 24,
        ),
        title: Text(
          'Fee Slab',
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
            color: Color(0XFFF1F4F7),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 0.5,
                      SizeConfig.blockSizeVertical,
                      SizeConfig.blockSizeHorizontal * 2.25,
                      SizeConfig.blockSizeVertical * 10,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: 18,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 0.1,
                        childAspectRatio:
                            (MediaQuery.of(context).size.width / 3) /
                                (MediaQuery.of(context).size.height / 6.5),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return cardview(context, index);
                      },
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget cardview(context, index) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
      child: Material(
        color: Colors.transparent,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 180,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
              )
            ],
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Color(0xFFD8D8D8),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 0),
                child: Text(
                  'Consultation',
                  style: TextStyle(
                    fontFamily: 'geometric sans-serif',
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeVertical * 2.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(21, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Fee',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 1.7,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        ': 200',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeVertical * 1.7,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(21, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Walk-in',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 1.7,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        ': 6%',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeVertical * 1.7,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(21, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Trym\'d',
                      style: TextStyle(
                        fontFamily: 'geometric sans-serif',
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 1.7,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        ': 12',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeVertical * 1.7,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(110, 0, 0, 0),
                      child: Text(
                        '\$ 188',
                        style: TextStyle(
                          fontFamily: 'geometric sans-serif',
                          color: Color(0XFFFF7384),
                          fontSize: SizeConfig.blockSizeVertical * 2,
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
    );
  }
}
