import 'package:bep/Api/Response/googleLoginResponse.dart';
import 'package:bep/Api/dioSetting.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  Dio dio = createDioClient();

  Future<googleLoginResponse?> googleLogin(GoogleSignInAccount user) async {
    Map<String, String> userInfo = {
      'email': user.email,
      'name': user.displayName ?? user.email,
      'password': "google",
      'provider': "google",
    };

    try {
      var response = await dio.post(
        '/login/google',
        data: userInfo,
        options: Options(contentType: Headers.jsonContentType),
      );
      return googleLoginResponse(token: response.data['accessToken']);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
