import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../modules/knowledge_base/views/knowledge_base_page.dart';
import '../../../modules/knowledge_base/controllers/knowledge_base_controller.dart';

class HomeController extends GetxController {
  void navigateToLogin() {
    Get.toNamed(Routes.login);
  }

  void navigateToKnowledgeBase() {
    // Create and initialize the controller
    final controller = KnowledgeBaseController();

    // Navigate directly to the page with the controller
    Get.to(
      () => const KnowledgeBasePage(),
      binding: BindingsBuilder(() {
        Get.put(controller);
      }),
    );
  }

  void navigateToSendTestMessage() {
    Get.toNamed(Routes.sendTestMessage);
  }

  void navigateToPromoPage() {
    Get.toNamed(Routes.promoPage);
  }
}
