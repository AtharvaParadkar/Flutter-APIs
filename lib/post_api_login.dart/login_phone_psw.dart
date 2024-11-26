import 'package:flutter/material.dart';
import 'package:flutter_apis/post_api_login.dart/otp_login.dart';
import 'package:gap/gap.dart';

class LoginPhonePsw extends StatelessWidget {
  const LoginPhonePsw({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final passwordController = TextEditingController(),
        phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Pwd'),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  maxLength: 10,
                  controller: phoneController,
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
                  keyboardType: TextInputType.phone,
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
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: const Color.fromARGB(255, 60, 70, 80),
                    filled: true,
                    label: const Text('Enter password'),
                    errorStyle: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length < 8) {
                      return 'Password must be greater than 8 characters';
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
                      print("${phoneController.text} ${passwordController.text}");
                      final snacks = SnackBar(
                        content: Center(
                          child: Text(
                            '${phoneController.text} ${passwordController.text}',
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
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 135,
            child: InkWell(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const OtpLogin())),
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'OTP ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
