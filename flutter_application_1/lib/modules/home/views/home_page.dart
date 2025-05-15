import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.navigateToKnowledgeBase,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Knowledge Base'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.navigateToSendTestMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Send a Test Message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.navigateToPromoPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Special Offers'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.navigateToLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Go to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
