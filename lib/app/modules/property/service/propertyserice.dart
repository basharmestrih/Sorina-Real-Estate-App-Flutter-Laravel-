import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/data/services/token_service.dart';

class ProperttService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

static Future<List<HomeModel>> fetchHouses({String? location}) async {
  final tokenService = TokenService();
  final token = await tokenService.token;

  if (token == null) {
    throw Exception('Token not found. User may not be logged in.');
  }

  final uri = Uri.parse('$baseUrl/houses');
  final query = <String, String>{
    'per_page': '10',
    if (location != null && location.toLowerCase() != 'all') 'location': location,
  };

  final finalUri = uri.replace(queryParameters: query);

  final response = await http.get(
    finalUri,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  print('FetchHouses Response: ${response.body}');

  if (response.statusCode == 200) {
    final decoded = json.decode(response.body);
    final List<dynamic> houses = decoded['data']['data'];
    return houses.map((json) => HomeModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load houses: ${response.statusCode}');
  }
}


}
