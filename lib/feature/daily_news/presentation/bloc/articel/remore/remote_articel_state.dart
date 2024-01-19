part of 'remote_articel_bloc.dart';

abstract class RemoteArticelState extends Equatable {
  final List<ArticleEntities> ? article;
  final DioException ? error;

  const RemoteArticelState({this.article, this.error});

  @override
  List<Object> get props => [article!, error!];
}

class RemoteArticelLoading extends RemoteArticelState {
   const RemoteArticelLoading();
}
class RemoteArticelDone extends RemoteArticelState {
  const RemoteArticelDone(List<ArticleEntities> articel): super(article: articel);
}
class RemoteArticelError extends RemoteArticelState {
  const RemoteArticelError(DioException error): super(error: error);
}