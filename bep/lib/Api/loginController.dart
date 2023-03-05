import 'package:bep/Api/dioSetting.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

class googleLoginResponse {
  String? token = null;
  googleLoginResponse({required this.token});
}

class LoginController {
  Dio dio = createDioClient();

  Future<googleLoginResponse?> googleLogin(GoogleSignInAccount user) async {
    Map<String, String> userInfo = {};
    userInfo['email'] = user.email;
    userInfo['name'] = user.displayName ?? user.email;
    userInfo['password'] = "google";

    try {
      var response = await dio.post(
        '/login/google',
        data: userInfo,
        options: Options(contentType: Headers.jsonContentType),
      );
      print(response.data);
      return googleLoginResponse(token: response.data['accessToken']);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
