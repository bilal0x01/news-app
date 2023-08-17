import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/news/gateway.dart';

class ArticlesDataProvider {
  static final _client = Dio();

  static Future<List<Article>> fetchArticles() async {
    try {
      final raw = await _client.get(Gateway.baseUrl);
      final data = raw.data['articles'] as List;

      return data
          .map((articleData) =>
              Article.fromJson(articleData as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('-----$e-----');
      rethrow;
    }
  }

  static Future<List<Article>> fetchTechArticles() async {
    try {
      final raw = await _client.get(Gateway.techUrl);
      final data = raw.data['articles'] as List;

      return data
          .map((articleData) =>
              Article.fromJson(articleData as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('-----$e-----');
      rethrow;
    }
  }
}
