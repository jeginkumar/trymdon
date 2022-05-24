import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trymd_partner/config/api_config.dart';

class UpdateBankDetails {
  // initialize API URL config
  // final String AppConfig().baseUrl = AppConfig().baseUrl;

  // update bank details
  Future updateBankDetailsResponse(jsonBody) async {
    final response = await http.post(
      Uri.parse(AppConfig().baseUrl + "/bankDetails"),
      body: jsonBody,
    );
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // update slots details
  Future updateSlotsDetailsResponse(jsonBody) async {
    final response = await http.post(
        Uri.parse(AppConfig().baseUrl + "/serviceSlotupdate"),
        body: jsonBody,
        headers: {'Content-type': 'application/json'});
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // update cancellation details
  Future updateCancellationDetailsResponse(jsonBody) async {
    final response = await http.post(
        Uri.parse(AppConfig().baseUrl + "/serviceSlotupdate"),
        body: jsonBody,
        headers: {'Content-type': 'application/json'});
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  //get slots intervals from trymd
  Future getSlotTimeResponse() async {
    final response =
        await http.get(Uri.parse(AppConfig().baseUrl + "/slotDuration"));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  //get Tax details from trymd
  Future getTaxDetailsResponse() async {
    final response =
        await http.get(Uri.parse(AppConfig().baseUrl + "/taxtList"));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }
}
