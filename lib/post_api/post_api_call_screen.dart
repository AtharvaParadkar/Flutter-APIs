import 'package:flutter/material.dart';
import 'package:flutter_apis/post_api/post_api_controller.dart';
import 'package:get/get.dart';

class PostApiCallScreen extends StatelessWidget {
  PostApiCallScreen({super.key});

  final _postController= Get.put(PostApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Date to Backend'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            DropdownButtonFormField(
              items: ['Male', 'Female']
                  .map(
                    (gender) => DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
