import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  final baseUrl = 'https://covid-19.dataflowkit.com/v1';

  fetchWorldwideData(String apiUrl) async {
    try {
      http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

      if (response.statusCode == 200) {
        final finalResponse = json.decode(response.body);

        return finalResponse;
      }
    } catch (error) {
      rethrow;
    }
  }
  // https://covid-19-tracking.p.rapidapi.com/v1

  fetchCountryData() async {
    try {
      http.Response response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final finalResponse = json.decode(response.body);

        return finalResponse;
      }
    } catch (error) {
      rethrow;
    }
  }

  fetchSlots(String pinCode, String date, String month) async {
    try {
      String selectDate = "$date-$month-2022";
      http.Response response = await http.get(Uri.parse(
          "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=$pinCode&date=$selectDate"));

      if (response.statusCode == 200) {
        final finalResponse = json.decode(response.body);

        return finalResponse;
      }
    } catch (error) {
      rethrow;
    }
  }
}
