import 'package:get/get.dart';
import '../modules/home/views/home_page.dart';
import '../modules/login/views/login_page.dart';
import '../modules/knowledge_base/views/knowledge_base_page.dart';
import '../modules/send_test_message/views/send_test_message_page.dart';
import '../modules/home/controllers/home_controller.dart';
import '../modules/login/controllers/login_controller.dart';
import '../modules/knowledge_base/bindings/knowledge_base_binding.dart';
import '../modules/send_test_message/bindings/send_test_message_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      name: Routes.knowledgeBase,
      page: () => const KnowledgeBasePage(),
      binding: KnowledgeBaseBinding(),
    ),
    GetPage(
      name: Routes.sendTestMessage,
      page: () => const SendTestMessagePage(),
      binding: SendTestMessageBinding(),
    ),
  ];
}
