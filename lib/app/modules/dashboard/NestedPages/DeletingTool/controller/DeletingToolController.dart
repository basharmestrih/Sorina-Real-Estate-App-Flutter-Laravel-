import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_house_app/app/data/services/token_service.dart';

class DeletingToolController extends GetxController {
  final TextEditingController idcontroller = TextEditingController();

  // Observable loading state
  var isLoading = false.obs;

  // Base API URL
  final String baseUrl = "http://192.168.1.103:8000/api/houses";
  

  Future<void> deleteProperty() async {
    final tokenService = TokenService();
    final token = await tokenService.token;
    final id = idcontroller.text.trim();

    if (id.isEmpty) {
      Get.snackbar('Error', 'Please enter the property ID');
      return;
    }

    final url = Uri.parse('$baseUrl/$id');

    try {
      isLoading.value = true;

      final response = await http.delete(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },);

      if (response.statusCode == 200 || response.statusCode == 204) {
        // Success response
        Get.snackbar('Success', 'Property deleted successfully');
        idcontroller.clear();
      } else {
        // Parse error message if any
        String message = 'Failed to delete property.';
        try {
          final body = jsonDecode(response.body);
          if (body is Map<String, dynamic> && body.containsKey('message')) {
            message = body['message'];
          }
        } catch (_) {}
        Get.snackbar('Error', message);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    idcontroller.dispose();
    super.onClose();
  }
}
