import 'dart:async';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class PromoPageController extends GetxController {
  // Countdown timer variables
  final hours = 23.obs;
  final minutes = 59.obs;
  final seconds = 59.obs;
  Timer? countdownTimer;
  
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }
  
  @override
  void onClose() {
    countdownTimer?.cancel();
    super.onClose();
  }
  
  // Start countdown timer
  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      updateTimer();
    });
  }
  
  // Update countdown timer
  void updateTimer() {
    if (seconds.value > 0) {
      seconds.value--;
    } else {
      if (minutes.value > 0) {
        minutes.value--;
        seconds.value = 59;
      } else {
        if (hours.value > 0) {
          hours.value--;
          minutes.value = 59;
          seconds.value = 59;
        } else {
          // Timer finished
          countdownTimer?.cancel();
        }
      }
    }
  }
  
  // Navigate to home page
  void navigateToHome() {
    Get.offNamed(Routes.home);
  }
  
  // Navigate to page without promo (placeholder for now)
  void navigateToPageWithoutPromo() {
    // For now, just show a snackbar since the page doesn't exist yet
    Get.snackbar(
      'Coming Soon',
      'This page is under development',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
