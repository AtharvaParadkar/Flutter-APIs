import 'package:flutter/material.dart';
import 'package:flutter_apis/post_api_login/post_api_login_repository.dart';
import 'package:get/get.dart';

class PostApiLoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> submitEmailLogin() async {
    String email = emailController.text;
    String phone = phoneController.text;

    if (email.isEmpty || phone.isEmpty) {
      Get.snackbar(
        'Error',
        'Fill all the Fields',
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color.fromARGB(255, 255, 0, 0).withOpacity(0.1),
        duration: const Duration(seconds: 5),
        isDismissible: true,
      );
      return;
    }

    final isSuccess =
        await PostApiLoginRepository.submitUserEmailPhone(email, phone);

    if (isSuccess) {
      Get.snackbar(
        'Success',
        'Data Submitted successfully',
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color.fromARGB(255, 0, 250, 8).withOpacity(0.1),
        duration: const Duration(seconds: 5),
        isDismissible: true,
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to Submit Data',
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color.fromARGB(255, 255, 0, 0).withOpacity(0.1),
        duration: const Duration(seconds: 5),
        isDismissible: true,
      );
    }
  }

  @override
  void onClose() {
    print('Disposing Controllers');
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
