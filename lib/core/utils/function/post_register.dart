import 'package:dio/dio.dart';
import 'package:hezma_app/features/home/data/models/register_model/register_model.dart';

class RegisterService {
  Future<RegisterModel> registerService({
    required String name,
    required String phone,
    required String password,
    required String email,
    required String fcm,
  }) async {
    final String _baseUrl =
        'https://hezma-traning.eltamiuz.net/api/v1/register';
    Dio dio = Dio();

    try {
      Response response = await dio.post(
        _baseUrl,
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
          'fcm': fcm,
        },
      );
      print('Full response: ${response.data}'); // Log the full response

      if (response.statusCode == 200) {
        // Dio automatically decodes JSON, no need for jsonDecode
        final Map<String, dynamic> data = response.data;

        final token = data['token'] as String?;
        final userData = data['data'];

        if (userData != null) {
          // Assuming RegisterModel has a 'token' property
          // Extract OTP from response
          print('User data: $userData');
          final otp = userData['otp'] as int?; // Assuming OTP is an integer
// Log the extracted OTP
          print('Extracted OTP: $otp');
          // Return RegisterModel with the extracted OTP and token
          return RegisterModel.fromJson(userData)
            ..token = token!
            ..otp = otp;
        } else {
          throw Exception('No user data found in response');
        }
      } else if (response.statusCode == 422) {
        final Map<String, dynamic> data = response.data;
        throw Exception('Validation error: ${data['errors']}');
      } else {
        throw Exception(
            'Failed to register user. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception('Dio error: ${e.response?.data}');
      } else {
        throw Exception('Dio error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<String> resendOtp(String token) async {
    final String _baseUrl =
        'https://hezma-traning.eltamiuz.net/api/v1/send_otp';
    Dio dio = Dio();

    try {
      // Adding the token in the Authorization header
      Response response = await dio.post(
        _baseUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Pass the token in the headers
          },
        ),
      );
      if (response.statusCode == 200) {
        // Get the success message from the response
        return response.data['message'];
      } else {
        throw Exception('Failed to resend OTP');
      }
    } on DioError catch (e) {
      throw Exception('Dio error: ${e.response?.data ?? e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
