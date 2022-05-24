import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trymd_partner/config/api_config.dart';

class Fdainformationtool {
  // initialize API URL config
  // final String AppConfig().baseUrl = AppConfig().baseUrl;
  // FDA Registration
  Future fdain(jsonBody) async {
    final response = await http.post(
        Uri.parse(AppConfig().baseUrl + "/fdaRegistration"),
        body: jsonBody);
    Map<String, dynamic> responsewaste = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responsewaste;
  }
}
