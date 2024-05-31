import 'package:bloc/bloc.dart';
import 'package:era_developer_test/repositories/news/models/article.dart';
import 'package:era_developer_test/utils/mock_articles.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<FetchArticles>((event, emit) {
      final articles = mockArticles;
      //sort articles by its publication date
      articles.sort((a, b) => a.publicationDate.compareTo(b.publicationDate));

      emit(ArticlesFetched(articles: articles));
    });
  }
}
