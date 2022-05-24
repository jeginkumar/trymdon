// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
// import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:trymd_partner/fda_screens/fda_repository/auth.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
import 'package:trymd_partner/repository/fda_booking.dart';
// import 'package:google_fonts/google_fonts.dart';

class SlotsoverviewWidget extends StatefulWidget {
  final slotData;
  const SlotsoverviewWidget({this.slotData});

  @override
  _SlotsoverviewWidgetState createState() => _SlotsoverviewWidgetState();
}

class _SlotsoverviewWidgetState extends State<SlotsoverviewWidget> {
  final LocalStorage storage = new LocalStorage('localstorage_app');
  List slotdetails = [];

  @override
  void initState() {
    super.initState();
    slotdetails = widget.slotData;
    // overviewslots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  'SLOTS OVERVIEW',
                  style: TrymdPartnerTheme.of(context).bodyText1.override(
                        fontFamily: 'geometric sans-serif',
                        color: Color(0xFF3F8BFD),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    physics: ScrollPhysics(),
                    itemCount: slotdetails.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio:
                          (MediaQuery.of(context).size.width / 10) /
                              (MediaQuery.of(context).size.height / 85),
                    ),
                    itemBuilder: (BuildContext context, dynamic index) {
                      return slots(
                        context,
                        slotdetails[index],
                      );
                    },
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                      width: double.infinity,
                      height: 39,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      )))
            ],
          ),
        ));
  }

  Widget slots(context, index) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
      child: Container(
        width: 102,
        height: 39,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: Text(
            index,
            textAlign: TextAlign.center,
            style: TrymdPartnerTheme.of(context).bodyText1.override(
                  fontFamily: 'geometric sans-serif',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
        ),
      ),
    );
  }

  overviewslots() async {
    var response = await BookingFDA().slotoverview();
    print(response);
    if (response['status'] == 1) {
      // slotdetails = response["slot-details"][3]["time"];
    }

    setState(() {});
  }
}
