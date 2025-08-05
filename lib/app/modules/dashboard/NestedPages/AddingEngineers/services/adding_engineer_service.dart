import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_house_app/app/data/services/api_endpoints.dart';

class AddingEngineerService {
  final String token;

  AddingEngineerService({required this.token});

  Future<http.Response?> submitProfile(Map<String, String> fields) async {
    final url = Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.engineers}');
    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer $token'
      ..headers['Accept'] = 'application/json';

    request.fields.addAll(fields);

    try {
      final streamedResponse = await request.send();
      return await http.Response.fromStream(streamedResponse);
    } catch (e) {
      print('Exception submitting profile: $e');
      return null;
    }
  }
}
