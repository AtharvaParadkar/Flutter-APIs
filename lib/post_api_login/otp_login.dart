import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apis/post_api_login/loggedin_screen.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpLogin extends StatefulWidget {
  const OtpLogin({super.key});

  @override
  State<OtpLogin> createState() => _OtpLoginState();
}

class _OtpLoginState extends State<OtpLogin> {
  String? _verificationId;
  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController otpController = TextEditingController();
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
      body:  Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                maxLength: 13,
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
              ),
              const Gap(25),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (phoneAuthCredential) {},
                    verificationFailed: (error) {
                      log('Verification Failed $error');
                    },
                    codeSent: (verificationId, forceResendingToken) {
                      setState(() {
                        _verificationId = verificationId;
                      });
                      log('Code Sent $verificationId');
                    },
                    codeAutoRetrievalTimeout: (verificationId) {
                      log('Auto Retrival Timeout');
                    },
                    phoneNumber: phoneController.text,
                    // phoneNumber: '+91${phoneController.text}',
                    // verificationCompleted: (PhoneAuthCredential credential) {},
                    // verificationFailed: (FirebaseAuthException ex) {
                    //   log('Verification Failed $ex');
                    // },
                    // codeSent: (String verificationid, int? resendToken) {
                    //   setState(() {
                    //     _verificationid = verificationid;
                    //   });
                    //   log('Code Sent $verificationid');
                    // },
                    // codeAutoRetrievalTimeout: (String verificationId) {},
                    // phoneNumber: phoneController.text.toString(),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 60, 70, 80)),
                child: const Text('Get OTP'),
              ),
              const Gap(35),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(length: 6,
                  controller: otpController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 7),
                  // validator: (value) => value == '0000' ? '✔️' : '❌',
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
                  // errorPinTheme: defaultPinTheme.copyWith(
                  //   decoration: defaultPinTheme.decoration!.copyWith(
                  //     border: Border.all(
                  //       color: const Color.fromARGB(255, 255, 0, 0),
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              const Gap(30),
              ElevatedButton(
                onPressed: () async {
                  focusNode.unfocus();
                    try {
                      final cred = PhoneAuthProvider.credential(
                        verificationId: _verificationId!,
                        smsCode: otpController.text,
                      );
                      await FirebaseAuth.instance.signInWithCredential(cred);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoggedInScreen(),
                        ),
                      );
                    } catch (c) {
                      log(c.toString());
                    }
                  
                },
                // style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 60,70,80))),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 60, 70, 80)),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      
    );
  }
}
