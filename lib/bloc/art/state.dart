import 'package:equatable/equatable.dart';
import 'package:json_block/data/model/result.dart';
import 'package:meta/meta.dart';

abstract class ArtState extends Equatable {}

class ArticleInitialState extends ArtState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ArticleLoadingState extends ArtState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ArticleLoadedState extends ArtState {

  List<Articles> articles;

  ArticleLoadedState({@required this.articles});

  @override
  // TODO: implement props
  List<Object> get props => [articles];
}

class ArticleErrorState extends ArtState {

  String message;

  ArticleErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

