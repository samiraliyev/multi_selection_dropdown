import 'dart:convert';

import 'package:http/http.dart';
import 'package:multi_select_dropdown/data/providers/endpoint.dart';

import '../model/post_model.dart';

class PostService {
  static List<String>? item;
  late final String title;

  static Future<List<PostResponse>> getPost() async {
    try {
      const endpoint = Endpoints.postUrl;
      final Uri url = Uri.parse(endpoint);
      final response = await get(url);
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return postResponseFromJson(response.body);
      } else {
        throw Exception;
      }
    } catch (e) {
      throw Exception;
    }
  }
}
