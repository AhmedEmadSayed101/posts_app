import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<List> getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<List> addData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.post(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }
}
