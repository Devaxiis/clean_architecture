
import 'package:clean_architecture/core/resources/data_satate.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/feature/daily_news/domain/entities/article.dart';
import 'package:clean_architecture/feature/daily_news/domain/repository/article_repository.dart';

class RemoveArticelUseCase implements UseCase<void, ArticleEntities>{

  final ArticleRepository _articleRepository;

  RemoveArticelUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntities ? params}) {
    return _articleRepository.removeArticle(params!);
  }

}