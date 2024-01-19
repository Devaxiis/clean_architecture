import 'package:clean_architecture/feature/daily_news/presentation/bloc/articel/remore/remote_articel_bloc.dart';
import 'package:clean_architecture/feature/daily_news/presentation/widget/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/article.dart';


class DailyNews extends StatelessWidget {
  const DailyNews({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody() ,
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
            color: Colors.black
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticelBloc,RemoteArticelState> (
      builder: (_,state) {
        if (state is RemoteArticelLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticelError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticelDone) {
          return ListView.builder(
            itemBuilder: (context,index){
              return ArticleWidget(
                article: state.article![index] ,
                onArticlePressed: (article) => _onArticlePressed(context,article),
              );
            },
            itemCount: state.article!.length,
          );
        }
        return const SizedBox();
      },
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntities article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }

}