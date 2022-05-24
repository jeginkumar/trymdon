import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trymd_partner/config/api_config.dart';
// import 'package:trymd_partner/config/api_config.dart';

class BookingFDA {
  Future slotoverview() async {
    final response = await http.get(
      Uri.parse(AppConfig().baseUrl +
          "/slotOverview?professional_id=-MxTD--V38Oafzj7uMAw"),
    );
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(response.bodyBytes),
    );

    return responseMap;
  }
}
