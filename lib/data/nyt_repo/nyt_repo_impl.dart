import 'dart:convert';
import 'package:hamztask/core/network/dio.dart';
import 'package:hamztask/core/network/end_points.dart';
import 'package:hamztask/data/nyt_repo/nyt_model.dart';
import '../../core/network/local.dart';

class NYTRepository {
  Future<List<Article>> fetchArticles() async {
    try {
      final response = await DioHelper.getDate(
        baseUrl: baseUrlNYT,
        url: endPointNYT,
        query: {'api-key': keyNYT},
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data['results'];
        final jsonString = jsonEncode(jsonData); // this to can save data
        CachHelper.savedData(key: 'cachedDate', value: jsonString);
        return jsonData.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching articles: $e');
    }
  }
}
