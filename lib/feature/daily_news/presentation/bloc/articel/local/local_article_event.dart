part of 'local_article_bloc.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntities? article;

  const LocalArticleEvent({ this.article});

  @override
  List<Object> get props => [article!];
}


class GetSaveArticles extends LocalArticleEvent{
  const GetSaveArticles();
}

class RemoveArticles extends LocalArticleEvent{
  const RemoveArticles(ArticleEntities article):super(article: article);
}
class SaveArticles extends LocalArticleEvent{
  const SaveArticles(ArticleEntities article):super(article: article);
}