import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:multi_select_dropdown/model.dart';

class ApiService {
  Future<List<DropdownItem>> fetchDropdownItems() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => DropdownItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed');
    }
  }
}
