import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trymd_partner/config/api_config.dart';

class VendorSelectedCategories {
  // initialize API URL config
  // final String AppConfig().baseUrl = AppConfig().baseUrl;
  // Categories feom trymd
  Future getCategoryResponse() async {
    final response =
        await http.get(Uri.parse(AppConfig().baseUrl + "/categoryList"));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // Specialities from trymd
  Future getSpecialityResponse(String categotyId) async {
    final response = await http.get(Uri.parse(
        AppConfig().baseUrl +
        "/categoryspecialityList?category_id=" +
        categotyId));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // service list
  Future getServicesListResponse(String categotyId, String specialityId) async {
    final response = await http.get(Uri.parse(AppConfig().baseUrl +
        "/specialityserviceList?category_id=" +
        categotyId +
        "&speciality_id=" +
        specialityId));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // Add Labels
  Future addLabelsResponse(
      String categotyId, String specialityId, String labelName) async {
    final response = await http.get(Uri.parse(AppConfig().baseUrl +
        "/addLabels?category_id=" +
        categotyId +
        "&speciality_id=" +
        specialityId +
        "&add_label=" +
        labelName +
        "&status=0"));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // Add Services
  Future addServicesResponse(
      String categotyId, String specialityId, String serviceName) async {
    final response = await http.get(Uri.parse(AppConfig().baseUrl +
        "/addServices?category_id=" +
        categotyId +
        "&speciality_id=" +
        specialityId +
        "&add_services=" +
        serviceName +
        "&status=0"));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }
}
