import 'package:clean_architecture/config/theme/app_theme.dart';
import 'package:clean_architecture/feature/daily_news/presentation/bloc/articel/remore/remote_articel_bloc.dart';
import 'package:clean_architecture/feature/daily_news/presentation/page/home/daily_news.dart';
import 'package:clean_architecture/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependency();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticelBloc>(
      create: (context) => sl()..add(GetArticle()),
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: const DailyNews(),
      ),
    );
  }
}

