import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PropertyManagerController extends GetxController {
  // Controllers for each input
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final bedroomsController = TextEditingController();
  final bathroomsController = TextEditingController();
  final areaController = TextEditingController();
  final addressController = TextEditingController();

  // Post property to API
  Future<void> submitProperty() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/houses');

    // Prepare data
    final data = {
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'price': priceController.text.trim(),
      'bedrooms': bedroomsController.text.trim(),
      'bathrooms': bathroomsController.text.trim(),
      'area': areaController.text.trim(),
      'address': addressController.text.trim(),
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Property added successfully');
        // Optionally clear inputs after success
        titleController.clear();
        descriptionController.clear();
        priceController.clear();
        bedroomsController.clear();
        bathroomsController.clear();
        areaController.clear();
        addressController.clear();
      } else {
        Get.snackbar('Error', 'Failed to add property: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    }
  }

  @override
  void onClose() {
    // Dispose controllers when done
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    bedroomsController.dispose();
    bathroomsController.dispose();
    areaController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
