

import 'package:clean_architecture/feature/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';


@Entity(tableName: "articel", primaryKeys: ['id'])
class ArticleModel extends ArticleEntities{

  const ArticleModel({
    int ? id,
    String ? author,
    String ? title,
    String ? description,
    String ? url,
    String ? urlToImage,
    String ? publishedAt,
    String ? content,
}): super(
    id: id,
    author: author,
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json){
    return ArticleModel(
      author: json["author"]??"",
      title: json["title"]??"",
      description: json["description"]??"",
      url: json["url"]??"",
      urlToImage: json["urlToImage"]??"",
      publishedAt: json["publishedAt"]??"",
      content: json["content"]??"",
    );
  }

  factory ArticleModel.fromEntity(ArticleEntities entity){
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }

}