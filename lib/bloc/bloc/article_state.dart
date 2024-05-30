part of 'article_bloc.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}

class ArticlesFetched extends ArticleState {
  ArticlesFetched({required this.articles});
  final List<Article> articles;

  void readAllArticles() {
    for (var article in articles) {
      article.read = true;
    }
    print(articles[0].imageUrl);
    
  }

  List<Article> get getAllArticles => articles;
}
