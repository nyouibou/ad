import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  final Dio dio = Dio();
  final TextEditingController phoneController = TextEditingController();

  Future<void> login() async {
    final phone = phoneController.text.trim();

    if (phone.isEmpty) {
      Get.snackbar('Error', 'Phone number cannot be empty');
      return;
    }

    isLoading.value = true;

    try {
      final response = await dio.get(
        'https://btobapi-production.up.railway.app/api/business_user/$phone',
      );

      if (response.statusCode == 200) {
        // Assuming the response contains user details
        Get.snackbar('Success', 'Login successful');
        Get.offNamed('/home',
            arguments: response.data); // Navigate to home page with user data
      } else {
        Get.snackbar('Error', 'User not found');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
