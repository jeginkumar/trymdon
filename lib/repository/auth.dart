import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trymd_partner/config/api_config.dart';

class Authentications {
  // initialize API URL config
  // final String AppConfig().baseUrl = AppConfig().baseUrl;

  // Login
  Future getLoginResponse(String mobileNumber, String type) async {
    final response = await http.get(
      Uri.parse(
        AppConfig().baseUrl +
            "/vendorLogin?mobile_number=" +
            mobileNumber +
            "&user_type=" +
            type,
      ),
    );
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // Registration
  Future registrationVendorResponse(
      String vendorType, String vendorName, String mobileNumber) async {
    final response = await http.get(Uri.parse(AppConfig().baseUrl +
        "/appRegistration?user_type=" +
        vendorType +
        "&name=" +
        vendorName +
        "&mobile_number=" +
        mobileNumber));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // OTP verification
  Future getOtpVerificationResponse(
      String userType, String otp, String mobileNumber) async {
    final response = await http.get(Uri.parse(AppConfig().baseUrl +
        "/vendorloginConfirmotp?user_type=" +
        userType +
        "&otp=" +
        otp +
        "&mobile_number=" +
        mobileNumber));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // resend OTP verification
  Future resendOtpResponse(String mobileNumber, String userType) async {
    final response = await http.get(Uri.parse(AppConfig().baseUrl +
        "/resendOtp?mobile_number=" +
        mobileNumber +
        "&user_type=" +
        userType));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // FDA Registration
  Future registrationFDA(jsonBody) async {
    final response = await http.post(
        Uri.parse(AppConfig().baseUrl + "/fdaRegistration"),
        body: jsonBody,
        headers: {'Content-type': 'application/json'});
    Map<String, dynamic> responsewaste = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responsewaste;
  }

  //FDA customer booking
  Future bookingFDA(jsonBody) async {
    final response = await http.post(
      Uri.parse(AppConfig().baseUrl + "/postsaveUser"),
      body: jsonBody,
    );
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }
}
