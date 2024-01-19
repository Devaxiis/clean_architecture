import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/resources/data_satate.dart';
import 'package:clean_architecture/feature/daily_news/domain/entities/article.dart';
import 'package:clean_architecture/feature/daily_news/domain/usecases/get_article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'remote_articel_event.dart';
part 'remote_articel_state.dart';

class RemoteArticelBloc extends Bloc<RemoteArticelEvent, RemoteArticelState> {

  final GetArticleUseCase _articleUseCase;

  RemoteArticelBloc(this._articleUseCase) : super(const RemoteArticelLoading()) {
    on<GetArticle>(onGetArticle);
  }
  void onGetArticle(GetArticle event,Emitter<RemoteArticelState> emit)async{
    final dataState = await _articleUseCase();

    if(dataState is Datasuccess && dataState.data!.isNotEmpty){
      emit(
        RemoteArticelDone(dataState.data!)
      );
    }
    if(dataState is DataFailed){
      emit(
        RemoteArticelError(dataState.error!)
      );
    }
  }
}
