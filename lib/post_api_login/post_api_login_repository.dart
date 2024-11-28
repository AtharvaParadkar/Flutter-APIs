import 'package:flutter_apis/post_api_login/post_api_login_service.dart';

class PostApiLoginRepository {
  static Future<bool> submitUserEmailPhone(String email, phone) async {
    try {
      final result = await PostApiLoginService.postUserEmailPhone({
        'email': email,
        'phone': phone,
      });

      if (result) {
        return true;
      } else {
        return false;
      }
    } catch (c) {
      print('Error in Repository: $c');
      return false;
    }
  }
}
