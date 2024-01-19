import 'package:clean_architecture/feature/daily_news/data/data_source/local/app_database.dart';
import 'package:clean_architecture/feature/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:clean_architecture/feature/daily_news/data/repository/article_repository_implement.dart';
import 'package:clean_architecture/feature/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture/feature/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/feature/daily_news/domain/usecases/get_save_article.dart';
import 'package:clean_architecture/feature/daily_news/domain/usecases/remove_article.dart';
import 'package:clean_architecture/feature/daily_news/domain/usecases/save_article.dart';
import 'package:clean_architecture/feature/daily_news/presentation/bloc/articel/remore/remote_articel_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance;


Future<void> initializeDependency() async{

  final dataBase = await $FloorAppDataBase.databaseBuilder("app_database.db").build();
  sl.registerSingleton<AppDataBase>(dataBase);
  
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(),sl()));
  
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl())
  );

  sl.registerSingleton<GetSaveArticelUseCase>(
      GetSaveArticelUseCase(sl())
  );

  sl.registerSingleton<SaveArticelUseCase>(
      SaveArticelUseCase(sl())
  );

  sl.registerSingleton<RemoveArticelUseCase>(
      RemoveArticelUseCase(sl())
  );




  sl.registerFactory<RemoteArticelBloc>(
      ()=> RemoteArticelBloc(sl())
  );
}