import 'package:dio/dio.dart';
import 'package:hezma_app/features/home/data/models/register_model/register_model.dart';

class ApiService {
  final _baseUrl = 'https://hezma-traning.eltamiuz.net/api/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');

    return response.data;
  }
}
