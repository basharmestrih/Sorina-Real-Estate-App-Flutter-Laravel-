import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_house_app/app/data/models/home_model.dart';


class HomeService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  static Future<List<HomeModel>> fetchHouses() async {
    final response = await http.get(Uri.parse('$baseUrl/houses'));

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body)['data'];
      return body.map((json) => HomeModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load houses');
    }
  }
}
