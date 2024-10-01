import 'package:flutter_apis/post_api/post_api_service.dart';

class PostApiRepository {
  static Future<bool> submitUserData(String userName, email, gender) async {
    try {
      final result = await PostApiService.postUserData({
        'userName': userName,
        'email': email,
        'gender': gender,
      });

      if (result) {
        return true;
      } else {
        return false;
      }
    } catch (c) {
      print('Error in Repository $c');
      return false;
    }
  }
}
