import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostApiController extends GetxController {
  final usernameController = TextEditingController(),
      emailController = TextEditingController();
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
        borderColor: const Color.fromARGB(255, 255, 0, 0),
      );
    }

    
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
