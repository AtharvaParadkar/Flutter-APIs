import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apis/get_api_call_screen.dart';
import 'package:flutter_apis/get_api_categories_screen.dart';
import 'package:flutter_apis/get_multiple_API_call/multiple_api_call_screen.dart';
import 'package:flutter_apis/get_photos_api_call/get_photos_api_callscreen.dart';
import 'package:flutter_apis/get_products_api_call/get_products_api_callscreen.dart';
import 'package:flutter_apis/post_api/post_api_call_screen.dart';
import 'package:flutter_apis/post_api_login/login_email_phone.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LocalAuthentication auth;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    _authenticate();
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
      print('Authenticated : $authenticated');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 40, 50),
      ),
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
        backgroundColor: Colors.transparent,
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
            const Gap(10),
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryDetailScreen()),
                );
              },
              child: const Text(
                'Show List Categories Data',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Gap(10),
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MultipleApiCallScreen()),
                );
              },
              child: const Text(
                'Show Multiple Api Data',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Gap(10),
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GetPhotosApiCallscreen()),
                );
              },
              child: const Text(
                'Show Photos Api Data',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Gap(10),
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GetProductsApiCallscreen()),
                );
              },
              child: const Text(
                'Show Products Api Data',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Gap(10),
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostApiCallScreen()),
                );
              },
              child: const Text(
                'Post Api Data',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Gap(10),
            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginEmailPhone()),
                );
              },
              child: const Text(
                'Post Api Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
