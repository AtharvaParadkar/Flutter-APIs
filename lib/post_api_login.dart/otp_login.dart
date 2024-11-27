import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpLogin extends StatelessWidget {
  const OtpLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final phoneController = TextEditingController(),
        otpController = TextEditingController();
    final focusNode = FocusNode();

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(color: Colors.white, fontSize: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 60, 70, 80),
          width: 3,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Login'),
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const Gap(25),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: otpController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 20),
                  validator: (value) => value == '0000' ? '✔️' : '❌',
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 25,
                        height: 2.5,
                        color: const Color.fromARGB(255, 60, 70, 80),
                      )
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 90, 100, 110),
                        width: 3,
                      ),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 255, 0),
                      ),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(25),
              ElevatedButton(
                onPressed: () {
                  focusNode.unfocus();
                  formKey.currentState!.validate();
                },
                // style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 60,70,80))),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 60, 70, 80)),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
