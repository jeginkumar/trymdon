import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trymd_partner/config/api_config.dart';

class AuthenticationsForFDA {
  // initialize API URL config
  // final String AppConfig().baseUrl = AppConfig().baseUrl;

  // Login
  Future getLoginResponseFDA(String mobileNumber, String type) async {
    final response = await http.get(Uri.parse(AppConfig().baseUrl +
        "/fdaLogin?mobile_number=" +
        mobileNumber +
        "&user_type=" +
        type));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // resend otp
  Future getResendOtpResponseFDA(String mobileNumber, String type) async {
    final response = await http.get(Uri.parse(AppConfig().baseUrl +
        "/fdaresendOtp?mobile_number=" +
        mobileNumber +
        "&user_type=" +
        type));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // verify OTP
  Future geterifyOTPResponseFDA(
      String userType, String otp, String mobileNumber) async {
    final response = await http.get(Uri.parse(AppConfig().baseUrl +
        "/verifyOtpfda?mobile_number=" +
        mobileNumber +
        "&user_type=" +
        userType +
        "&otp=" +
        otp));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // FDA DOCTOR DETAILS
  Future getDoctorDetails(String id) async {
    final response = await http
        .get(Uri.parse(AppConfig().baseUrl + "/doctorDetails?fdaid=" + id));
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );

    return responseMap;
  }

  // FDA IMPROMPTU USER REGISTRATION
  Future getUserRegistration(bodyjson) async {
    final response = await http
        .post(Uri.parse(AppConfig().baseUrl + "/postsaveUser"), body: bodyjson);
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // FDA BOOK SERVICE
  Future getBookService(bodyjson) async {
    final response = await http.post(
        Uri.parse(AppConfig().baseUrl + "/postserviceBooking"),
        body: bodyjson);
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }

  // FDA Default slots view
  Future getViewSlotsDefault(bodyjson) async {
    final response = await http
        .post(Uri.parse(AppConfig().baseUrl + "/slotOverview"), body: bodyjson);
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return responseMap;
  }
}
