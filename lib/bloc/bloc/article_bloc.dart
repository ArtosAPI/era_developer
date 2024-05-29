import 'package:bloc/bloc.dart';
import 'package:era_developer_test/repositories/news/mock_news_repository.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<FetchArticles>((event, emit) {
      emit(Articles());
    });
  }
}
