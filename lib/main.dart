import 'package:flutter/material.dart';
import 'package:flutter_apis/get_api_call_screen.dart';
import 'package:flutter_apis/get_api_categories_screen.dart';
import 'package:flutter_apis/get_multiple_API_call/multiple_api_call_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      title: 'API',
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()),
                );
              },
              child: const Text(
                'Show List API Data!',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryDetailScreen()),
                );
              },
              child: const Text(
                'Show List Categories Data',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MultipleApiCallScreen()),
                );
              },
              child: const Text(
                'Show Multiple Api Data',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
