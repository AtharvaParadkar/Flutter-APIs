import 'package:flutter/material.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged In'),
      ),
      body: const Center(
        child: Text(
          'Logged In',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
