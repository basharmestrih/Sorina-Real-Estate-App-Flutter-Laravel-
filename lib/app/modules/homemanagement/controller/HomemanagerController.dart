import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_house_app/app/data/services/token_service.dart';

class PropertyManagerController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final bedroomsController = TextEditingController();
  final bathroomsController = TextEditingController();
  final areaController = TextEditingController();
  final addressController = TextEditingController();
  final locationController = TextEditingController();
  final floorsNumberController = TextEditingController();
  final groundDistanceController = TextEditingController();
  final buildingAgeController = TextEditingController();
  final feature1Controller = TextEditingController();
  final feature2Controller = TextEditingController();
  final feature3Controller = TextEditingController();

  File? selectedImage; // You need to let user pick an image and assign it here

  Future<void> submitProperty() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/houses');
    final Admintoken = '4|Bkeo1INlmFktUQdiXycKpHaxFpxVrXrv8tmFVBm7672b9846';

   

    final request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $Admintoken';
    request.headers['Accept'] = 'application/json';

    request.fields['title'] = titleController.text.trim();
    request.fields['description'] = descriptionController.text.trim();
    request.fields['price'] = priceController.text.trim();
    request.fields['rooms_number'] = bedroomsController.text.trim();
    request.fields['baths_number'] = bathroomsController.text.trim();
    request.fields['area'] = areaController.text.trim();
    request.fields['address'] = addressController.text.trim();
    request.fields['location'] = locationController.text.trim();
    request.fields['floors_number'] = floorsNumberController.text.trim();
    request.fields['ground_distance'] = groundDistanceController.text.trim();
    request.fields['building_age'] = buildingAgeController.text.trim();

    request.fields['main_features[]'] = feature1Controller.text.trim();
    request.fields['main_features[]'] = feature2Controller.text.trim();
    request.fields['main_features[]'] = feature3Controller.text.trim();

   
    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Property added successfully');
        clearFields();
      } else {
        Get.snackbar('Error', 'Failed: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Exception: $e');
    }
  }

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    bedroomsController.clear();
    bathroomsController.clear();
    areaController.clear();
    addressController.clear();
    locationController.clear();
    floorsNumberController.clear();
    groundDistanceController.clear();
    buildingAgeController.clear();
    feature1Controller.clear();
    feature2Controller.clear();
    feature3Controller.clear();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    bedroomsController.dispose();
    bathroomsController.dispose();
    areaController.dispose();
    addressController.dispose();
    locationController.dispose();
    floorsNumberController.dispose();
    groundDistanceController.dispose();
    buildingAgeController.dispose();
    feature1Controller.dispose();
    feature2Controller.dispose();
    feature3Controller.dispose();
    super.onClose();
  }
}