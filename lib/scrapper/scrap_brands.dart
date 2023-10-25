import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> scrapBrands() async {
  const url = 'http://desired-car.glitch.me/brands';
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return {
        'statusCode': data['statusCode'] as int,
        'data': data['data'] as List<dynamic>,
        'error': data['error'] as String,
      };
    } else {
      throw Exception(
          'Request failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

// }
