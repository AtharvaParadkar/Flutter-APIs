import 'package:flutter/material.dart';
import 'package:flutter_apis/post_api/post_api_controller.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PostApiCallScreen extends StatelessWidget {
  PostApiCallScreen({super.key});

  final _postController = Get.put(PostApiController());

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
              controller: _postController.usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _postController.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            DropdownButtonFormField<String>(
              value: _postController.selectGender.value,
              items: ['Male', 'Female']
                  .map(
                    (gender) => DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                _postController.selectGender.value = value!;
              },
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
            const Gap(10),
            ElevatedButton(
              onPressed: () async {
                await _postController.submitForm();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
