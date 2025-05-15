import 'package:get/get.dart';
import '../controllers/knowledge_base_controller.dart';

class KnowledgeBaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KnowledgeBaseController>(() => KnowledgeBaseController());
  }
}
