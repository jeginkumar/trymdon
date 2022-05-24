import 'package:localstorage/localstorage.dart';
// import 'package:trymd_partner/fda_screens/fda_repository/auth.dart';
import 'package:trymd_partner/fda_screens/screens/makepayment_widget.dart';

// import '../components/bookingsuccessfull_widget.dart';
// import '../global_widget/flutter_flow_theme.dart';
// import '../global_widget/flutter_flow_util.dart';
import 'package:trymd_partner/fda_screens/global_widgets/trymd_partner_theme.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class InvoiceWidget extends StatefulWidget {
  final serviceName;
  final startT;
  final endTime;
  final delaySt;
  final delayEnd;
  final userData;
  const InvoiceWidget(
      {this.serviceName,
      this.startT,
      this.endTime,
      this.delaySt,
      this.delayEnd,
      this.userData});

  @override
  _InvoiceWidgetState createState() => _InvoiceWidgetState();
}

class _InvoiceWidgetState extends State<InvoiceWidget> {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  double applicableTax = 0;
  int total = 0;

  @override
  void initState() {
    super.initState();
    widget.serviceName.forEach((ele) {
      double tax = double.parse(ele['tax']);
      double fee = double.parse(ele['fee']);
      double tat = (tax / 100) * (fee);
      applicableTax += tat;
      total += int.parse(ele['total']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 320,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              color: Color(0x2F1D2429),
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Invoice',
                  style: TrymdPartnerTheme.of(context).bodyText1.override(
                        fontFamily: 'Harmonia Sans W01 Bold',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: widget.serviceName.length,
                      itemBuilder: (context, index) {
                        return rowService(
                            context, widget.serviceName[index], index);
                      },
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(70, 0, 0, 0),
                        child: Text(
                          'Applicable Taxes',
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 Regular',
                                    color: Colors.black,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(75, 0, 0, 0),
                        child: Text(
                          '\$ ' + applicableTax.toString(),
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 Bold',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 30,
                  thickness: 1,
                  color: Color(0xFFD0DEEB),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(70, 0, 0, 0),
                      child: Text(
                        'TOTAL',
                        style: TrymdPartnerTheme.of(context).bodyText1.override(
                              fontFamily: 'Harmonia Sans W01 Bold',
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(135, 0, 0, 0),
                      child: Text(
                        '\$ ' + total.toString(),
                        style: TrymdPartnerTheme.of(context).bodyText1.override(
                              fontFamily: 'Harmonia Sans W01 Bold',
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      Map<String, dynamic> body = {
                        "user_booking_id": storage.getItem("booking_id"),
                        "current_slot": widget.startT + " " + widget.endTime,
                        "next_slot": "09:21 AM - 09:40 AM",
                        "service": widget.serviceName.toString(),
                        "payment_mode": "",
                        "payment_status": "",
                        "total": total.toString()
                      };

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MakePaymentWidget(
                              jsonBody: body,
                              userData: widget.userData,
                              start: widget.startT,
                              end: widget.endTime,
                              delayS: widget.delaySt,
                              delayE: widget.delayEnd),
                        ),
                      );
                    },
                    child: Container(
                      width: 280,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF3F8BFD), Color(0xFF07D0F2)],
                          stops: [0, 1],
                          begin: AlignmentDirectional(0.94, -1),
                          end: AlignmentDirectional(-0.94, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style:
                              TrymdPartnerTheme.of(context).bodyText1.override(
                                    fontFamily: 'Harmonia Sans W01 Bold',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rowService(context, name, index) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Color(0xFFDFE1E7),
              borderRadius: BorderRadius.circular(3),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: Text(
                index.toString(),
                textAlign: TextAlign.center,
                style: TrymdPartnerTheme.of(context).bodyText1.override(
                      fontFamily: 'Harmonia Sans W01 Bold',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
            child: Icon(
              Icons.close,
              color: Color(0xFFCCD2E3),
              size: 16,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: Text(
              name['service_name'],
              style: TrymdPartnerTheme.of(context).bodyText1.override(
                    fontFamily: 'Harmonia Sans W01 Regular',
                    color: Colors.black,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(106, 0, 0, 0),
            child: Text(
              '\$ ' + name['fee'],
              style: TrymdPartnerTheme.of(context).bodyText1.override(
                    fontFamily: 'Harmonia Sans W01 Bold',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
