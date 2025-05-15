import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SendTestMessageController extends GetxController {
  // Observable to track if the "Send a Test Message" button has been clicked
  final hasClickedSendMessage = false.obs;

  // Method to handle the "Send a Test Message" button click
  void sendTestMessage() {
    hasClickedSendMessage.value = true;
  }

  // Method to handle the "Start AI Assistant" button click
  void startAIAssistant() {
    // Navigate to the Promo Page
    Get.toNamed(Routes.promoPage);
  }
}
