import 'package:flutter/material.dart';
import 'package:flutter_apis/post_api/post_api_repository.dart';
import 'package:get/get.dart';

class PostApiController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var selectGender = 'Male'.obs;

  Future<void> submitForm() async {
    String userName = usernameController.text,
        email = emailController.text,
        gender = selectGender.value;

    if (userName.isEmpty || email.isEmpty || gender.isEmpty) {
      Get.snackbar(
        'Error',
        'Fill all the Fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        duration: const Duration(seconds: 3),
      );
      return;
    }
    final isSuccess =
        await PostApiRepository.submitUserData(userName, email, gender);

    if (isSuccess) {
      // Get.snackbar('Successssssss', 'Data submitted successfully');

      Get.snackbar(
        'Success',
        'Data submitted successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      );
    } else {
      Get.snackbar(
        'Errorr',
        'Failed to submit data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  void onClose() {
    print("Disposing controllers");
    usernameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
