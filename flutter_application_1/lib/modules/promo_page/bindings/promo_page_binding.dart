import 'package:get/get.dart';
import '../controllers/promo_page_controller.dart';

class PromoPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromoPageController>(() => PromoPageController());
  }
}
