part of 'article_bloc.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}

class ArticlesFetched extends ArticleState {
  ArticlesFetched({required this.articles});
  final List<Article> articles;

  void readArticle(int id) {
      articles[id].read = true;
  }

  List<String> datesToString() {
    final dates = <String>[];
    final today = DateTime.now();
    for (var article in articles) {
      final tempDifference = today.difference(article.publicationDate);
      if (tempDifference.inHours >= 24) {
        if (tempDifference.inDays >= 365) {
          //if difference between now and publication date of article is more than 365 days(i.e. year)
          //then collect data in years

          if ((tempDifference.inDays ~/ 365) == 1) {
            dates.add('${tempDifference.inDays ~/ 365} year ago');
          } else {
            dates.add('${tempDifference.inDays ~/ 365} years ago');
          }
        } else {
          //if difference between now and publication date of article is more than 24 hours(i.e. day)
          //then collect data in days

          if (tempDifference.inDays == 1) {
            dates.add('${tempDifference.inDays} day ago');
          } else {
            dates.add('${tempDifference.inDays} days ago');
          }
        }
      } else {
        //if difference between now and publication date of article is less than 24 hours
        //then collect data in hours

        if (tempDifference.inDays == 1) {
          dates.add('${tempDifference.inHours} hour ago');
        } else {
          dates.add('${tempDifference.inHours} hours ago');
        }
      }
    }
    return dates;
  }

  List<Article> get getAllArticles => articles;
}
