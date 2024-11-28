import 'package:flutter/material.dart';
import 'package:flutter_apis/post_api_login/login_phone_psw.dart';
import 'package:flutter_apis/post_api_login/post_api_login_controller.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginEmailPhone extends StatelessWidget {
  LoginEmailPhone({super.key});

  final _postLoginController = Get.put(PostApiLoginController());

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    maxLength: 50,
                    controller: _postLoginController.emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: const Color.fromARGB(255, 60, 70, 80),
                      filled: true,
                      label: const Text('Enter email'),
                      errorStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                  ),
                  const Gap(15),
                  TextFormField(
                    maxLength: 10,
                    controller: _postLoginController.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: const Color.fromARGB(255, 60, 70, 80),
                      filled: true,
                      label: const Text('Enter phone'),
                      errorStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1 ||
                          value.trim().length < 10) {
                        return 'Enter valid phone number';
                      }
                      return null;
                    },
                  ),
                  const Gap(15),
                  ElevatedButton(
                    onPressed: () async {
                      final isValid = formKey.currentState!.validate();
                      if (isValid) {
                        formKey.currentState!.save();
                        print(
                            "${_postLoginController.emailController.text} ${_postLoginController.phoneController.text}");
                        await _postLoginController.submitEmailLogin();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 60, 70, 80)),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 95,
              child: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginPhonePsw())),
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: ' Phone Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
