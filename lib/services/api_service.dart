

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_provider_project/models/user_model.dart';

class ApiService {
  Future<List<UserModel>> fetchUser() async{
    final url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    final response = await http.get(url);

    if(response.statusCode  == 200){
      final List data = jsonDecode(response.body);
      return data.map((e) => UserModel.fromJson(e)).toList();
    }else{
      throw Exception("Failed to load users");
    }
  }
}