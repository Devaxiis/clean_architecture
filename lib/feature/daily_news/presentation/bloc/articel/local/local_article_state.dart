part of 'local_article_bloc.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleEntities>? article;
  const LocalArticleState({this.article});


  @override
  List<Object> get props =>[article!];
}

class LocalArticleLoading extends LocalArticleState {
  const LocalArticleLoading();
}

class LocalArticleDone extends LocalArticleState {
  const LocalArticleDone(List<ArticleEntities> articel):super(article: articel);

}
