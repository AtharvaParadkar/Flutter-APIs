import 'package:flutter/material.dart';
import 'package:flutter_apis/post_api_login.dart/otp_login.dart';
import 'package:flutter_apis/utils/custom_clipper.dart';
import 'package:gap/gap.dart';

class LoginPhonePsw extends StatefulWidget {
  const LoginPhonePsw({super.key});

  @override
  State<LoginPhonePsw> createState() => _LoginPhonePswState();
}

class _LoginPhonePswState extends State<LoginPhonePsw> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController(),
      phoneController = TextEditingController();
  bool showTorch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Pwd'),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
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
                  Stack(
                    children: [
                      Container(
                        height: 55,
                        width: 335,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 60, 70, 80),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {});
                          },
                          cursorColor: Colors.white,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  showTorch = !showTorch;
                                  print('Tapppeeeeddddddd');
                                });
                              },
                              child: Icon(showTorch
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
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
                      ),
                      showTorch
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  right: 40, left: 10, top: 5),
                              child: SizedBox(
                                height: 47,
                                width: 335,
                                child: ClipPath(
                                  clipper: MyClipper(),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    padding: const EdgeInsets.only(left: 10),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      passwordController.text,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.black),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  const Gap(15),
                  ElevatedButton(
                    onPressed: () {
                      final isValid = formKey.currentState!.validate();
                      if (isValid) {
                        formKey.currentState!.save();
                        print(
                            "${phoneController.text} ${passwordController.text}");
                        final snacks = SnackBar(
                          content: Center(
                            child: Text(
                              '${phoneController.text} ${passwordController.text}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 90, 100, 110),
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
