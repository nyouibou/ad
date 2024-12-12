import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'usermodel.dart'; // Import the UserModel class

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the UserModel instance passed from the LoginController
    final userModel = Get.arguments as UserModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${userModel.contactPerson ?? 'User'}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            if (userModel.companyName != null)
              Text(
                'Company: ${userModel.companyName}',
                style: TextStyle(fontSize: 18),
              ),
            if (userModel.phone != null)
              Text(
                'Phone: ${userModel.phone}',
                style: TextStyle(fontSize: 18),
              ),
            if (userModel.cashbackAmount != null)
              Text(
                'Cashback: ${userModel.cashbackAmount}',
                style: TextStyle(fontSize: 18),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Example: Logout or perform another action
                Get.offAllNamed('/login'); // Navigate back to login
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
