

import 'dart:io';

import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/core/resources/data_satate.dart';
import 'package:clean_architecture/feature/daily_news/data/data_source/local/app_database.dart';
import 'package:clean_architecture/feature/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:clean_architecture/feature/daily_news/data/models/article.dart';
import 'package:clean_architecture/feature/daily_news/domain/entities/article.dart';
import 'package:clean_architecture/feature/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  final NewsApiService _newsApiService;
  final AppDataBase _appDataBase;
  ArticleRepositoryImpl(this._newsApiService, this._appDataBase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    final httpResponse =await _newsApiService.getNewsArticle(
      apiKey: newsApiKey,
      country: countryQuery,
      category: categoryQuery,
    );

    try{
      if(httpResponse.response.statusCode == HttpStatus.ok){
        return Datasuccess(httpResponse.data);
      }else{
        return DataFailed(
            DioError(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioErrorType.badResponse,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    }on DioException catch(e){
       return DataFailed(e);
    }

  }

  @override
  Future<List<ArticleEntities>> getSavedArticel() async{
   return _appDataBase.articleDao.getArticle();
  }

  @override
  Future<void> removeArticle(ArticleEntities article) {
    return _appDataBase.articleDao.deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntities article) {
    return _appDataBase.articleDao.insertArticle(ArticleModel.fromEntity(article));
  }

}