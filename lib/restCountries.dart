import 'dart:convert';
import 'package:http/http.dart' as http;
import 'country.dart'; // Importez la classe Country

class RestCountries {
  static const apiEndpoint = 'https://restcountries.com/v3.1/all/';

  static Future<List<Country>> getCountries() async {
    final response = await http.get(Uri.parse(apiEndpoint));

    if (response.statusCode == 200) {
      final countriesJson = json.decode(response.body) as List;

      return countriesJson.map((countryJson) {
        // Mise à jour pour inclure le drapeau, la superficie et la langue officielle
        return Country.fromJson(countryJson);
      }).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
