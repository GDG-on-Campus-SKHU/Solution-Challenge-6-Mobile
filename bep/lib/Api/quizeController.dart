import 'package:bep/Api/dioSetting.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizController {
  Dio dio = createDioClient();

  Future<List<Quiz>?> getQuiz() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      dio.options.headers['Authorization'] = 'Bearer $token'; // 인증 토큰 추가

      final response = await dio.get('/main');
      List<dynamic> jsonList = response.data;
      List<Quiz> quizes = jsonList.map((json) => Quiz.fromJson(json)).toList();
      return quizes;
    } catch (e) {
      print(e);
    }
    return null;
  }
}

class Quiz {
  final int id;
  final String question;
  final String category;
  final String latitude;
  final String longitude;
  final int miPoint;

  Quiz(
      {required this.id,
      required this.question,
      required this.category,
      required this.latitude,
      required this.longitude,
      required this.miPoint});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
        id: json['id'],
        question: json['question'],
        category: json['category'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        miPoint: json['miPoint']);
  }

  void toPrint() {
    print("$id, $question, $category, $latitude, $longitude, $miPoint");
  }
}
