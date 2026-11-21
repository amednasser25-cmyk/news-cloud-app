import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/api_keys.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsServices {
  final  Dio dio;
 
  NewsServices(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async
  {
   try {
     var response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$newsApiKey&category=$category'
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];
      List<ArticleModel> articlelist =[];
       
       for(var article in articles)
       {
          ArticleModel articleModel = ArticleModel.fromJson(article);
          articlelist.add(articleModel);
       }
       return articlelist;
  } catch (e) {
     
      throw Exception('Oops, there was an error, try again later');
    }
  }
}
