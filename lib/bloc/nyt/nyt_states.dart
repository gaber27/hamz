// states for NYT for all functions
import '../../data/nyt_repo/nyt_model.dart';

abstract class NYTStates{}

class NYTInital extends NYTStates{}

class NYTFetchArticleLoading extends NYTStates{}

class NYTFetchArticleSuccess extends NYTStates{
  final List<Article> articles;

  NYTFetchArticleSuccess(this.articles);
}

class NYTFetchArticleError extends NYTStates {
  final String message;
  NYTFetchArticleError(this.message);
}
