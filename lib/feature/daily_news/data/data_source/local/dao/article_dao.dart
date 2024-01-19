
import 'package:clean_architecture/feature/daily_news/data/models/article.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao{
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel articleModel);

  @Query('SELECT * FROM article')
  Future<List<ArticleModel>> getArticle();
}