part of 'article_bloc.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}

class Articles extends ArticleState{
  MockNewsRepository articles = MockNewsRepository();
}