import 'package:bloc/bloc.dart';
import 'package:json_block/bloc/art/state.dart';
import 'package:json_block/bloc/article/article_event.dart';
import 'package:json_block/data/model/result.dart';
import 'package:json_block/data/rep/repository.dart';
import 'package:meta/meta.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArtState> {

  Repository repository;

  ArticleBloc({@required this.repository});

  @override
  // TODO: implement initialState
  ArtState get initialState => ArticleInitialState();

  @override
  Stream<ArtState> mapEventToState(ArticleEvent event) async* {
    if (event is FetchArticlesEvent) {
      yield ArticleLoadingState();
      try {
        List<Articles> articles = await repository.getArticles();
        yield ArticleLoadedState(articles: articles);
      } catch (e) {
        yield ArticleErrorState(message: e.toString());
      }
    }
  }

}