import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/knowledge_base_controller.dart';

class KnowledgeBasePage extends GetView<KnowledgeBaseController> {
  const KnowledgeBasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Knowledge Base'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress indicator
            Obx(() => LinearProgressIndicator(
                  value: (controller.currentQuestionIndex.value + 1) / 4,
                  backgroundColor: Colors.grey[300],
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.purple),
                )),
            const SizedBox(height: 20),

            // Question and answer section
            Expanded(
              child: Obx(() {
                switch (controller.currentQuestionIndex.value) {
                  case 0:
                    return _buildPersonaQuestion();
                  case 1:
                    return _buildBusinessQuestion();
                  case 2:
                    return _buildSpecificInfoQuestion();
                  case 3:
                    return _buildFileUploadQuestion();
                  default:
                    return const SizedBox.shrink();
                }
              }),
            ),

            // Navigation buttons
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button (hidden on first question)
                    controller.currentQuestionIndex.value > 0
                        ? ElevatedButton(
                            onPressed: controller.previousQuestion,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            child: const Text('Previous'),
                          )
                        : const SizedBox(width: 100),

                    // Next/Finish button
                    ElevatedButton(
                      onPressed: controller.currentQuestionIndex.value < 3
                          ? controller.nextQuestion
                          : controller.finishAndGoToHome,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      child: Text(
                        controller.currentQuestionIndex.value < 3
                            ? 'Next'
                            : 'Finish',
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  // Question 1: Persona selection
  Widget _buildPersonaQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Question 1 of 4',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Persona apa yang akan saya bawakan?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        // Persona selection cards
        Obx(() => _buildPersonaCard(
              'Professional',
              'Formal and business-oriented communication',
              controller.selectedPersona.value == 'Professional',
              () => controller.setPersona('Professional'),
            )),
        const SizedBox(height: 10),
        Obx(() => _buildPersonaCard(
              'Playful',
              'Casual and friendly communication',
              controller.selectedPersona.value == 'Playful',
              () => controller.setPersona('Playful'),
            )),
        const SizedBox(height: 10),
        Obx(() => _buildPersonaCard(
              'Formal',
              'Strictly formal and traditional communication',
              controller.selectedPersona.value == 'Formal',
              () => controller.setPersona('Formal'),
            )),
      ],
    );
  }

  // Persona selection card
  Widget _buildPersonaCard(
      String title, String description, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.purple : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? Colors.purple : Colors.grey,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Question 2: Business information
  Widget _buildBusinessQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Question 2 of 4',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Bisnis apa yang sedang dijalankan?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: controller.businessInfoController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Jelaskan tentang bisnis Anda...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.purple, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  // Question 3: Specific information
  Widget _buildSpecificInfoQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Question 3 of 4',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Apakah ada informasi spesifik yang perlu saya ketahui? Jam buka? Product? Harga?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: controller.specificInfoController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Masukkan informasi spesifik tentang bisnis Anda...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.purple, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  // Question 4: File upload
  Widget _buildFileUploadQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Question 4 of 4',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Apakah ada file tertentu yang bisa saya pelajari?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        // File upload button
        Obx(() => controller.hasUploadedFile.value
            ? _buildUploadedFileCard()
            : _buildUploadButton()),
      ],
    );
  }

  // Upload button
  Widget _buildUploadButton() {
    return InkWell(
      onTap: controller.uploadFile,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_upload_outlined,
              size: 48,
              color: Colors.grey.shade600,
            ),
            const SizedBox(height: 10),
            const Text(
              'Click to upload files',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'PDF, DOC, DOCX, TXT up to 10MB',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Uploaded file card
  Widget _buildUploadedFileCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade50,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.insert_drive_file,
            color: Colors.blue,
            size: 36,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(
                      controller.uploadedFileName.value,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Text(
                  'PDF Document - 2.4 MB',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              controller.hasUploadedFile.value = false;
              controller.uploadedFileName.value = '';
            },
            icon: const Icon(Icons.delete_outline, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
