

import 'dart:async';
import 'package:clean_architecture/feature/daily_news/data/data_source/local/dao/article_dao.dart';
import 'package:clean_architecture/feature/daily_news/data/models/article.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDataBase extends FloorDatabase{
  ArticleDao get articleDao;
}