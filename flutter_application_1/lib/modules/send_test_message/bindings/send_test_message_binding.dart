import 'package:get/get.dart';
import '../controllers/send_test_message_controller.dart';

class SendTestMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendTestMessageController>(() => SendTestMessageController());
  }
}
