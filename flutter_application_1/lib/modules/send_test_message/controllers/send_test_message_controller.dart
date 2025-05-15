import 'package:get/get.dart';

class SendTestMessageController extends GetxController {
  // Observable to track if the "Send a Test Message" button has been clicked
  final hasClickedSendMessage = false.obs;
  
  // Method to handle the "Send a Test Message" button click
  void sendTestMessage() {
    hasClickedSendMessage.value = true;
  }
  
  // Method to handle the "Start AI Assistant" button click
  void startAIAssistant() {
    // This would typically navigate to a chat interface or start the AI assistant
    // For now, we'll just show a snackbar
    Get.snackbar(
      'AI Assistant Started',
      'Your AI assistant is now ready to help you',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
