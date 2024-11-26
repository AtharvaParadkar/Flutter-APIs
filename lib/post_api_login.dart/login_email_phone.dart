import 'package:flutter/material.dart';
import 'package:flutter_apis/post_api_login.dart/login_phone_psw.dart';
import 'package:gap/gap.dart';

class LoginEmailPhone extends StatelessWidget {
  const LoginEmailPhone({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController(),
        phoneController = TextEditingController();
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
                    controller: emailController,
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
                    controller: phoneController,
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
                    onPressed: () {
                      final isValid = formKey.currentState!.validate();
                      if (isValid) {
                        formKey.currentState!.save();
                        print("${emailController.text} ${phoneController.text}");
                        final snacks = SnackBar(
                          content: Center(
                            child: Text(
                              '${emailController.text} ${phoneController.text}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          backgroundColor: const Color.fromARGB(255, 90, 100, 110),
                          shape: const StadiumBorder(),
                          animation: const AlwaysStoppedAnimation(10),
                          duration: const Duration(seconds: 5),
                          behavior: SnackBarBehavior.floating,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snacks);
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
