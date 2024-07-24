// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio = Dio();
  NewsService();
  Future<List<ArticleModel>> getNews(String category) async {
    try {
      var response = await dio.get(
        //git your api from https://newsdata.io/
          'https://newsdata.io/api/1/latest?country=us&apikey=Write your api &category=$category');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['results'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.formjson(article);
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
