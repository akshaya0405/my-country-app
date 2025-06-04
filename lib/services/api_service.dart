import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country.dart';

class ApiService {
  static const String baseUrl = "https://restcountries.com/v2";

  Future<List<Country>> fetchCountriesByRegion(String region) async {
    final response = await http.get(Uri.parse("$baseUrl/region/$region"));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load countries");
    }
  }
}
