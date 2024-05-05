import 'package:dio/dio.dart';
import '../../core/network/dio.dart';

// network class that take base url for api , end point and query
class NetworkRepository {
  NetworkRepository();

  Future<Response> fetchData(String baseUrl,String url, {Map<String, dynamic>? query}) async {
    return await DioHelper.getDate(baseUrl: baseUrl,url: url);
  }

}
