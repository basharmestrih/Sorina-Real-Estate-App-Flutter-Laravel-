import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:file_picker/file_picker.dart'; // Import file_picker
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/services/adding_engineer_service.dart';

class AddingEngineerController extends GetxController {
  final _service = AddingEngineerService(
    token: '2|YFs6XsiO6dfdXbJ1XanilYuk0GjnNNMSOHatmJlr5fbb6e2a',
  );

  final nameController = TextEditingController(text: '');
  final specializationController = TextEditingController(text: '');
  final universityController = TextEditingController(text: '');
  final countryController = TextEditingController(text: '');
  final cityController = TextEditingController(text: '');
  final experienceController = TextEditingController(text: '');
  final languagesController = TextEditingController(text: '');
  final yearsExperienceController = TextEditingController(text: '');
  final phoneController = TextEditingController(text: '');

  Rx<File?> selectedFile = Rx<File?>(null);

Future<void> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );

  if (result != null) {
    selectedFile.value = File(result.files.single.path!); // Update the observable
  }
}

  Future<void> submitProfile() async {
    final fields = {
      'name': nameController.text.trim(),
      'specialization': specializationController.text.trim(),
      'university': universityController.text.trim(),
      'country': countryController.text.trim(),
      'city': cityController.text.trim(),
      'experience': experienceController.text.trim(),
      'languages': languagesController.text.trim(),
      'years_experience': yearsExperienceController.text.trim(),
      'phone': phoneController.text.trim(),
    };

    final response = await _service.submitProfile(fields);
    if (response == null) {
      Get.snackbar('Error', 'No response from server');
      return;
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.body;
      final json = data.isNotEmpty ? jsonDecode(data) : {};
      Get.snackbar('Success', 'Profile added successfully');
    } else {
      Get.snackbar('Error', 'Failed: ${response.body}');
    }
  }

  void clearFields() {
    nameController.clear();
    specializationController.clear();
    universityController.clear();
    countryController.clear();
    cityController.clear();
    experienceController.clear();
    languagesController.clear();
    yearsExperienceController.clear();
    phoneController.clear();
    //selectedFile = null; // Clear selected file
  }

  @override
  void onClose() {
    clearFields();
    super.onClose();
  }
}
