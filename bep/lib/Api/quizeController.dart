import 'package:bep/Api/dioSetting.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizeController {
  Dio dio = createDioClient();

  Future<List<Quize>?> getQuize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      dio.options.headers['Authorization'] = 'Bearer $token'; // 인증 토큰 추가

      final response = await dio.get('/main');
      List<dynamic> jsonList = response.data;
      List<Quize> quizes =
          jsonList.map((json) => Quize.fromJson(json)).toList();
      return quizes;
    } catch (e) {
      print(e);
    }
    return null;
  }
}

class Quize {
  final int id;
  final String question;
  final String category;
  final String latitude;
  final String longitude;
  final int miPoint;

  Quize(
      {required this.id,
      required this.question,
      required this.category,
      required this.latitude,
      required this.longitude,
      required this.miPoint});

  factory Quize.fromJson(Map<String, dynamic> json) {
    return Quize(
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
