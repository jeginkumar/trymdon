import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MakePayment {
  Future payment() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/makepayment.json");
    final constvalue = jsonDecode(response);
    return constvalue;
  }
}

class Bookingid {
  Future booking() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/bookingid.json");
    final value = jsonDecode(response);
    return value;
  }
}

class Fdabooking {
  Future fdabooking() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/bookingscreen.json");
    final value = jsonDecode(response);
    return value;
  }
}

class Availablebooking {
  Future availablebooking() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/availablebooking.json");
    final value = jsonDecode(response);
    return value;
  }
}

class Trymdbooking {
  Future trymdbooking() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/trymdbooking.json");
    final value = jsonDecode(response);
    return value;
  }
}

class Revenue {
  Future revenue() async {
    final String must =
        await rootBundle.loadString("assets/jsonfile/revenue.json");
    final mustdo = jsonDecode(must);
    return mustdo;
  }
}
