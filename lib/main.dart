import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_block/bloc/art/bloc.dart';
import 'package:json_block/data/rep/repository.dart';
import 'package:json_block/ui/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test News',
      home: BlocProvider(
        builder: (context) => ArticleBloc(repository: RepositoryImpl()),
        child: HomePage(),
      ),
    );
  }
}
