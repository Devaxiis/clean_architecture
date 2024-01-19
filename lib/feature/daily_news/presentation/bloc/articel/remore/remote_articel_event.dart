part of 'remote_articel_bloc.dart';

abstract class RemoteArticelEvent extends Equatable {
  const RemoteArticelEvent();
}

class GetArticle extends RemoteArticelEvent{
  @override
  List<Object?> get props => [];
}
