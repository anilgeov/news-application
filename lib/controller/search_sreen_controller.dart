
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model_news.dart';

class SearchScreenController with ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;
  Future<void> searchData({required String searchText}) async {
    isLoading = true;
    final url = Uri.parse("https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=49fe83b5cf85471f8bd4d35ff3f208a5"); // string interpolation
    try {
      final response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
        },);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(decodedData);
      } else {
        print("Api failed");              // Handle the failure case as needed.
      }
    } catch (e) {
      print("Error: $e");// Handle the error case as needed.
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
