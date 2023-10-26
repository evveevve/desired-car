import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> scrapProducts(final String uri) async {
  final String url = "https://desired-car.glitch.me/brand-products?url=$uri";
  print("inside scrapper");
  try {
    final response = await http.get(Uri.parse(url));
    print("inside try block");
    if (response.statusCode == 200) {
      print("request successful");
      final Map<String, dynamic> data = json.decode(response.body);
      // print(data);
      final mapping = {
        'status code': data['status code'] as int,
        'data': data['data'] as List<dynamic>,
        'error': data['error'] as String,
      };
      print("\n\n");
      print(mapping);
      print("\n\n");
      return mapping;
    } else {
      print("exception status code");

      throw Exception(
          'Request failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    print("error.....");
    throw Exception('Error: $e');
  }
}

// }
void main() {
  scrapProducts("https://cartrade.com//tata-cars/");
}
