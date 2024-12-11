// import 'package:dio/dio.dart';
// import 'package:get/get.dart';

// class HomeController extends GetxController {
//   var isLoading = false.obs;
//   var companyName = ''.obs;
//   var contactPerson = ''.obs;
//   var phone = ''.obs;
//   var uploadedFile = ''.obs;
//   var referralCode = ''.obs;
//   var cashbackAmount = ''.obs;

//   final Dio dio = Dio();

//   Future<void> fetchData(String phone) async {
//     isLoading.value = true;
//     try {
//       final response = await dio.get(
//         'https://btobapi-production.up.railway.app/api/business_user/$phone',
//       );

//       if (response.statusCode == 200) {
//         final data = response.data;
//         companyName.value = data['company_name'] ?? 'N/A';
//         contactPerson.value = data['contact_person'] ?? 'N/A';
//         this.phone.value = data['phone'] ?? 'N/A';
//         uploadedFile.value = data['uploaded_file'] ?? 'N/A';
//         referralCode.value = data['referral_code'] ?? 'N/A';
//         cashbackAmount.value = data['cashback_amount'] ?? '0.00';
//       } else {
//         Get.snackbar('Error', 'Failed to fetch data');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'An error occurred: ${e.toString()}');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var companyName = ''.obs;
  var contactPerson = ''.obs;
  var phone = ''.obs;
  var uploadedFile = ''.obs;
  var referralCode = ''.obs;
  var cashbackAmount = ''.obs;

  final Dio dio = Dio();

  Future<void> fetchData(String phone) async {
    isLoading.value = true;
    try {
      final response = await dio.get(
        'https://btobapi-production.up.railway.app/api/business_user/$phone',
      );

      if (response.statusCode == 200) {
        final data = response.data;

        // Ensure the fields exist and are not null, set fallback value if they are.
        companyName.value = data['company_name']?.toString() ?? 'N/A';
        contactPerson.value = data['contact_person']?.toString() ?? 'N/A';
        // If cashbackAmount is numeric but might be returned as a string, parse it properly
      } else {
        Get.snackbar('Error', 'Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
