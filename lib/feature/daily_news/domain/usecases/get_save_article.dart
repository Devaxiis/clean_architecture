
import 'package:clean_architecture/core/resources/data_satate.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/feature/daily_news/domain/entities/article.dart';
import 'package:clean_architecture/feature/daily_news/domain/repository/article_repository.dart';

class GetSaveArticelUseCase implements UseCase<List<ArticleEntities>, void>{

  final ArticleRepository _articleRepository;

  GetSaveArticelUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntities>> call({void params}) {
    return _articleRepository.getSavedArticel();
  }

}