
import 'package:clean_architecture/core/resources/data_satate.dart';
import 'package:clean_architecture/feature/daily_news/domain/entities/article.dart';

abstract class ArticleRepository{
  Future<DataState<List<ArticleEntities>>> getNewsArticles();

  Future<List<ArticleEntities>> getSavedArticel();

  Future<void> saveArticle(ArticleEntities article);

  Future<void> removeArticle(ArticleEntities article);


}