
import 'package:dio/dio.dart';

class ApiService{

final Dio _dio;
final String _baseUrl="https://www.googleapis.com/books/v1/";

  ApiService(this._dio);

  Future<Map<dynamic,String>> get({required String endPoint})async{

 var response = await _dio.get("$_baseUrl$endPoint");
    return response.data;

  }

}