import 'package:dio/dio.dart';

class GetSlider {
  Dio dio = Dio();

  Future<String> getSlider() async {
    try {
      Response response =
          await dio.get('https://hezma-traning.eltamiuz.net/api/v1/sliders');

      // Print the full response for debugging
      print('Response status: ${response.statusCode}');
      print('Response headers: ${response.headers}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        // Ensure the 'data' array exists and is not empty
        if (data.containsKey('data') && data['data'].isNotEmpty) {
          // Access the first slider's image URL
          return data['data'][0]['image'] as String;
        } else {
          throw Exception('No data found');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e'); // Print the actual error message
      throw Exception('Error occurred during the network request: $e');
    }
  }
}
