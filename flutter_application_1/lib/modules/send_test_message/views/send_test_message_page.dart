import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/send_test_message_controller.dart';

class SendTestMessagePage extends GetView<SendTestMessageController> {
  const SendTestMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send a Test Message'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Caption
            const Text(
              'Your AI Personal Assistant Ready to Serve You',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 40),
            
            // Send a Test Message button
            ElevatedButton(
              onPressed: controller.sendTestMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Send a Test Message',
                style: TextStyle(fontSize: 18),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Start AI Assistant button (hidden initially)
            Obx(() => Visibility(
              visible: controller.hasClickedSendMessage.value,
              child: AnimatedOpacity(
                opacity: controller.hasClickedSendMessage.value ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: ElevatedButton(
                  onPressed: controller.startAIAssistant,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Start AI Assistant',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
