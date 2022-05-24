import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trymd_partner/config/api_config.dart';

class VendorClassificationGet {
  // initialize API URL config
  // final String AppConfig().baseUrl = AppConfig().baseUrl;
  // get Locality
  Future getLocality() async {
    final response =
        await http.get(Uri.parse(AppConfig().baseUrl + "/getLocality"));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // get Facility
  Future getFacility() async {
    final response =
        await http.get(Uri.parse(AppConfig().baseUrl + "/getFacility"));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // get City
  Future getCity() async {
    final response =
        await http.get(Uri.parse(AppConfig().baseUrl + "/getCity"));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // get Classification
  Future getClassification() async {
    final response =
        await http
        .post(Uri.parse(AppConfig().baseUrl + "/getvendorClassification"));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // Update vendor information
  Future updateVendorInfo(jsonBody) async {
    final response = await http
        .post(
        Uri.parse(AppConfig().baseUrl + "/postsaveVendorinfo"),
        body: jsonBody);
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

// Update Profile information
  Future updateProfileInfo(jsonBody) async {
    final response = await http.post(
        Uri.parse(AppConfig().baseUrl + "/postsaveProfessionalinfo"),
        body: jsonBody);
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // update vendor preferences
  Future updateVendorPreferences(jsonBody) async {
    final response = await http.post(
        Uri.parse(AppConfig().baseUrl + "/professionalInfo"),
        body: jsonBody);
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }
}
