import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/feature/daily_news/domain/entities/article.dart';
import 'package:clean_architecture/feature/daily_news/domain/usecases/get_save_article.dart';
import 'package:clean_architecture/feature/daily_news/domain/usecases/remove_article.dart';
import 'package:clean_architecture/feature/daily_news/domain/usecases/save_article.dart';
import 'package:equatable/equatable.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
   final GetSaveArticelUseCase _getSaveArticelUseCase;
   final SaveArticelUseCase _saveArticelUseCase;
   final RemoveArticelUseCase _removeArticelUseCase;

   LocalArticleBloc(
       this._getSaveArticelUseCase,
       this._saveArticelUseCase,
       this._removeArticelUseCase,
       ): super(const LocalArticleLoading()){

    on<GetSaveArticles>(onGetSaveArticles);
    on<RemoveArticles>(onRemoveArticles);
    on<SaveArticles>(onSaveArticles);
   }

   void onGetSaveArticles(GetSaveArticles event,Emitter<LocalArticleState> emit)async{
        final articles = await _getSaveArticelUseCase();
        emit(LocalArticleDone(articles));
   }
   void onSaveArticles(SaveArticles saveArticles,Emitter<LocalArticleState> emit)async{
     await _saveArticelUseCase(params: saveArticles.article);
     final articles = await _getSaveArticelUseCase();
     emit(LocalArticleDone(articles));
   }
   void onRemoveArticles(RemoveArticles removeArticles,Emitter<LocalArticleState> emit)async{
        await _removeArticelUseCase(params: removeArticles.article);
        final articles = await _getSaveArticelUseCase();
        emit(LocalArticleDone(articles));
   }

}
