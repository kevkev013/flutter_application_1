import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class KnowledgeBaseController extends GetxController {
  // Current question index
  final currentQuestionIndex = 0.obs;
  
  // Selected persona
  final selectedPersona = Rx<String?>(null);
  
  // Text controllers for text fields
  final businessInfoController = TextEditingController();
  final specificInfoController = TextEditingController();
  
  // File upload (dummy)
  final hasUploadedFile = false.obs;
  final uploadedFileName = ''.obs;
  
  // Method to go to next question
  void nextQuestion() {
    if (currentQuestionIndex.value < 3) {
      currentQuestionIndex.value++;
    }
  }
  
  // Method to go to previous question
  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
    }
  }
  
  // Method to set selected persona
  void setPersona(String persona) {
    selectedPersona.value = persona;
  }
  
  // Method to simulate file upload
  void uploadFile() {
    hasUploadedFile.value = true;
    uploadedFileName.value = 'company_info.pdf';
  }
  
  // Method to finish and go back to home
  void finishAndGoToHome() {
    Get.offNamed(Routes.home);
  }
  
  @override
  void onClose() {
    businessInfoController.dispose();
    specificInfoController.dispose();
    super.onClose();
  }
}
