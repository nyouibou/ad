import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homecontroller.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final phone = Get.arguments ??
        '1234567898'; // Use the passed phone or a default value
    homeController.fetchData(phone);

    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Company Name: ${homeController.companyName.value}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Contact Person: ${homeController.contactPerson.value}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Phone: ${homeController.phone.value}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Uploaded File: ${homeController.uploadedFile.value}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Referral Code: ${homeController.referralCode.value}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Cashback Amount: ${homeController.cashbackAmount.value}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      }),
    );
  }
}
