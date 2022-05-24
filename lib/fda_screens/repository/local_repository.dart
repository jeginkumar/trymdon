import 'dart:convert';
import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

class Dashboard {
  Future home() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/demo.json");
    final response1 = jsonDecode(response);
    return response1;
  }
}
